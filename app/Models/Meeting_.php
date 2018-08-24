<?php

namespace App\Models;

use Carbon\Carbon;
use DB, Validator;

class Meeting_ extends Meeting
{
    static public $auditStatusMap = [
        '未审核' => 0,
        '初审失败' => -2,
        '初审成功' => 2,
        '预约失败' => -3,
        '预约成功' => 3,
        '通过审核' => 4
    ];

    static public $aheadSignInTimestamp = 3600 * 2;//允许提前先到的时间

    static public function getMeetingList(
        int $currPage = 0,
        int $pageNumber = 0,
        array $filter = [
            'initiate_user_id' => null,
            'need_audit' => null,
            'keyword' => null,
        ]
    ): array
    {
        $initiate_user_id =& $filter['user_id'];
        $need_audit =& $filter['need_audit'];
        $keyword =& $filter['keyword'];

        $Obj = Meeting::with([
            'audit' => function ($query) {
                $query->with(['auditUser']);
            },
            'initiateUser',
            'attendUsers'
        ]);

        if ($initiate_user_id) {
            $Obj->where('initiate_user_id', $initiate_user_id);
        }

        if ($need_audit) {
            $Obj->where('need_audit', $need_audit);
        }

        if ($keyword) {
            $Obj->where('title', 'like', "%{$keyword}%");
        }

        $total = $Obj->count();

        if ($currPage && $pageNumber) {
            $offset = ($currPage - 1) * $pageNumber;
            $Obj->offset($offset)->limit($pageNumber);
        }

        $get = $Obj->get();

        return ['total' => $total ?? 0, 'rows' => $get->toArray()];
    }

    static public function getMeeting(int $meetingId, bool $getObject = false)
    {
        $Obj = Meeting::with([
            'audit' => function ($query) {
                $query->with(['auditUser']);
            },
            'initiateUser',
            'attendUsers'
        ])
            ->find($meetingId);

        if ($getObject) {
            $result = $Obj;
        } else {
            $result = $Obj->toArray();
        }

        return $result;
    }

    static public function createMeeting(array $requestData): array
    {
        $validator = Validator::make($requestData, [
            'need_audit' => 'required',
            'title' => 'required',
            'type' => 'required',
            'location' => 'required',
            'opened_at' => 'required',
            'ended_at' => 'required',
            'audit_user_id' => 'required',
        ]);

        try {
            if ($validator->fails()) {
                throw new \Exception($validator->errors()->first());
            }

            if ($requestData['opened_at']
                && $requestData['ended_at']
                && $requestData['opened_at'] >= $requestData['ended_at']) {
                throw new \Exception('会议结束时间不能早于开始时间');
            }
            if ($requestData['opened_at'] <= Carbon::now()->timestamp) {
                throw new \Exception('会议开始时间错误');
            }
            $Obj = null;
            DB::transaction(function () use (&$Obj, $requestData) {
                $Obj = new Meeting;
                $Obj->initiate_user_id = User_::getMyId();
                $Obj->need_audit = $requestData['need_audit'];
                $Obj->title = $requestData['title'];
                $Obj->type = $requestData['type'];
                $Obj->location = $requestData['location'];
                $Obj->opened_at = $requestData['opened_at'];
                $Obj->ended_at = $requestData['ended_at'];
                $Obj->save();

                if ($Obj->need_audit) {
                    $Obj->audit()
                        ->create([
                            'audit_user_id' => $requestData['audit_user_id'],
                            'status' => Self::$auditStatusMap['未审核']
                        ]);
                }
            });
        } catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
        }

        return ['success' => $success ?? 1, 'msg' => $msg ?? null, 'data' => $Obj];
    }

    static public function updateMeeting(int $meetingId, array $requestData): array
    {
        $validator = Validator::make($requestData, [
            'need_audit' => 'required',
            'title' => 'required',
            'type' => 'required',
            'location' => 'required',
            'opened_at' => 'required',
            'ended_at' => 'required',
            'audit_user_id' => 'required',
        ]);

        try {
            if ($validator->fails()) {
                throw new \Exception($validator->errors()->first());
            }
        }catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
        }



        $meeting = Meeting_::getMeeting($meetingId, true);

        if (!$meeting) {
            throw new \Exception('updateMeeting Obj null error');
        }

        if (!$meeting->audit) {
            throw new \Exception('updateMeeting Obj audit null error');
        }

        //TODO

        return ['success' => $success ?? 1, 'msg' => $msg ?? null];
    }

    static public function auditMeeting(int $meetingId, array $requestData): array
    {
        $validator = Validator::make($requestData, [
            'is_passed' => 'required',
            'reason' => 'required',
        ]);

        try {
            if ($validator->fails()) {
                throw new \Exception($validator->errors()->first());
            }

            $meeting = Meeting_::getMeeting($meetingId, true);
            if (!$meeting) {
                throw new \Exception('auditMeeting Obj null error');
            }

            $audit = MeetingAudit
                ::where('meeting_id', $meetingId)
                ->where('audit_user_id', User_::getMYId())
                ->where('status', self::$auditStatusMap['未审核'])
                ->first();

            if (!$audit) {
                throw new \Exception('没有找到符合审核条件的会议');
            }

            $audit->status = $requestData['is_passed'] ? self::$auditStatusMap['初审成功'] : self::$auditStatusMap['初审失败'];
            $audit->reason = $requestData['is_passed'] ? '' : $requestData['reason'];
            $audit->save();
        } catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
        }

        return ['success' => $success ?? 1, 'msg' => $msg ?? null];
    }

    static public function reserveMeeting(int $meetingId): array
    {
        $meeting = Meeting_::getMeeting($meetingId, true);
        if (!$meeting) {
            throw new \Exception('reserveMeeting Obj null error');
        }

        if (!$meeting->audit) {
            throw new \Exception('reserveMeeting Obj audit null error');
        }

        if ($meeting->audit['audit_user_id'] !== User_::getMyId()) {
            throw new \Exception('auditMeeting audit_user_id error');
        }

        //TODO

        return [];
    }

    static public function deleteMeeting(int $meetingId): array
    {
        $meeting = Meeting_::getMeeting($meetingId, true);
        if (!$meeting) {
            throw new \Exception('deleteMeeting Obj null error');
        }

        if (!$meeting->audit) {
            throw new \Exception('deleteMeeting Obj audit null error');
        }

        //TODO

        return [];
    }

    static public function signIn(int $meetingId): array
    {
        try {
            $meeting = Meeting_::getMeeting($meetingId, true);

            if (!$meeting) {
                throw new \Exception('signIn Obj null error');
            }
            if (!$meeting->audit) {
                throw new \Exception('signIn Obj audit null error');
            }
            if ($meeting->audit['status'] !== self::$auditStatusMap['通过审核']) {
                throw new \Exception('会议状态错误');
            }
            if ($meeting->opened_at < Carbon::now()->timestamp - Self::$aheadSignInTimestamp) {
                throw new \Exception('未到签到时间');
            }
            if ($meeting->ended_at > Carbon::now()->timestamp) {
                throw new \Exception('会议已结束');
            }

            $Obj = $meeting->attendUsers()->where('user_id', User_::getMyId())
                ->where('meeting_id', $meeting->id)
                ->first();

            if (!$Obj) {
                throw new \Exception('未参会错误');
            }
            if ($Obj->is_signed_in) {
                throw new \Exception('您已签过到了');
            }

            $Obj->is_signed_in = 1;
            $Obj->save();
        } catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
        }

        return ['success' => $success ?? 1, 'msg' => $msg ?? null];
    }
}
