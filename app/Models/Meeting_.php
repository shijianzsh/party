<?php

namespace App\Models;

use Carbon\Carbon;
use DB, Validator;

class Meeting_ extends Meeting
{
    public const AHEAD_SIGN_IN_TIMESTAMP = 3600 * 2;//允许提前先到的时间

    static public function getMeetingList(
        int $currentPage = 0,
        int $pageSize = 0,
        array $filter = [
            'initiate_user_id' => null,
            'need_audit' => null,
            'keyword' => null,
        ]
    ): array
    {
        $initiate_user_id =& $filter['initiate_user_id'];
        $need_audit =& $filter['need_audit'];
        $keyword =& $filter['keyword'];

        $Obj = Meeting::with([
            'audit' => function ($query) {
                $query->with(['auditUser']);
            },
            'initiateUser',
//            'attendUsers'
        ]);
        $Obj->orderBy('updated_at', 'desc');

        if ($initiate_user_id !== null) {
            $Obj->where('initiate_user_id', $initiate_user_id);
        }

        if ($need_audit !== null) {
            $Obj->where('need_audit', $need_audit);
        }

        if ($keyword !== null) {
            $Obj->where(function ($query) use ($keyword) {
                $query->where('title', 'like', "%{$keyword}%")
                    ->orWhere('location', 'like', "%{$keyword}%");
            });
        }

        $total = $Obj->count();

        if ($currentPage) {
            $pageSize = !$pageSize ? self::PAGE_SIZE : $pageSize;
        } else {
            $pageSize = 0;
        }
        if ($currentPage && $pageSize) {
            $offset = ($currentPage - 1) * $pageSize;
            $Obj->offset($offset)->limit($pageSize);
        }

        $get = $Obj->get();

        return ['rows' => $get->toArray(), 'pagination' =>getPagination($currentPage, $pageSize, $total)];
    }

    static public function getDepartmentMeetingList(
        int $currentPage = 0,
        int $pageSize = 0,
        array $filter = [
            'initiate_user_id' => null,
            'need_audit' => null,
            'keyword' => null,
            'department_id' => null,
        ]
    ): array
    {
        $validator = \Validator::make($filter, [
            'department_id' => 'required',
        ]);

        if ($validator->fails()) {
            throw new \Exception($validator->errors()->first());
        }

        $initiate_user_id =& $filter['initiate_user_id'];
        $keyword =& $filter['keyword'];
        $need_audit =& $filter['need_audit'];
        $departmentId =& $filter['department_id'];

        $Obj = Meeting::with([
            'audit' => function ($query) {
                $query->with(['auditUser']);
            },
            'initiateUser',
//            'attendUsers'
        ]);
        $Obj->orderBy('updated_at', 'desc');

        $Obj->whereIn('department_id', Department_::getDescendants($departmentId)['ids']);

        if ($initiate_user_id !== null) {
            $Obj->where('initiate_user_id', $initiate_user_id);
        }

        if ($need_audit !== null) {
            $Obj->where('need_audit', $need_audit);
        }

        if ($keyword !== null) {
            $Obj->where(function ($query) use ($keyword) {
                $query->where('title', 'like', "%{$keyword}%")
                    ->orWhere('location', 'like', "%{$keyword}%");
            });
        }

        $total = $Obj->count();

        if ($currentPage) {
            $pageSize = !$pageSize ? self::PAGE_SIZE : $pageSize;
        } else {
            $pageSize = 0;
        }
        if ($currentPage && $pageSize) {
            $offset = ($currentPage - 1) * $pageSize;
            $Obj->offset($offset)->limit($pageSize);
        }

        $get = $Obj->get();

        return ['rows' => $get->toArray(), 'pagination' =>getPagination($currentPage, $pageSize, $total)];
    }

    static public function getAttendUserMeetingList(
        int $currentPage = 0,
        int $pageSize = 0,
        array $filter = [
            'initiate_user_id' => null,
            'need_audit' => null,
            'keyword' => null,
            'attend_user_id' => null,
        ]
    ): array
    {
        $validator = \Validator::make($filter, [
            'attend_user_id' => 'required',
        ]);

        if ($validator->fails()) {
            throw new \Exception($validator->errors()->first());
        }

        $initiate_user_id =& $filter['user_id'];
        $keyword =& $filter['keyword'];
        $need_audit =& $filter['need_audit'];
        $userId =& $filter['attend_user_id'];

        $Obj = Meeting::with([
            'audit' => function ($query) {
                $query->with(['auditUser']);
            },
            'initiateUser',
//            'attendUsers'
        ]);
        $Obj->orderBy('updated_at', 'desc');

        $Obj->whereHas('attendUsersMiddle', function ($query) use ($userId) {
            $query->where('meeting_user.user_id', $userId);
        });

        if ($initiate_user_id) {
            $Obj->where('initiate_user_id', $initiate_user_id);
        }

        if ($need_audit !== null) {
            $Obj->where('need_audit', $need_audit);
        }

        if ($keyword !== null) {
            $Obj->where(function ($query) use ($keyword) {
                $query->where('title', 'like', "%{$keyword}%")
                    ->orWhere('location', 'like', "%{$keyword}%");
            });
        }

        $total = $Obj->count();

        if ($currentPage) {
            $pageSize = !$pageSize ? self::PAGE_SIZE : $pageSize;
        } else {
            $pageSize = 0;
        }
        if ($currentPage && $pageSize) {
            $offset = ($currentPage - 1) * $pageSize;
            $Obj->offset($offset)->limit($pageSize);
        }

        $get = $Obj->get();

        return ['rows' => $get->toArray(), 'pagination' =>getPagination($currentPage, $pageSize, $total)];
    }

    static public function getAuditUserMeetingList(
        int $currentPage = 0,
        int $pageSize = 0,
        array $filter = [
            'initiate_user_id' => null,
            'keyword' => null,
            'audit_user_id' => null,
        ]
    ): array
    {
        $validator = \Validator::make($filter, [
            'audit_user_id' => 'required',
        ]);

        if ($validator->fails()) {
            throw new \Exception($validator->errors()->first());
        }

        $initiate_user_id =& $filter['user_id'];
        $keyword =& $filter['keyword'];
        $userId =& $filter['audit_user_id'];

        $Obj = Meeting::with([
            'audit' => function ($query) {
                $query->with(['auditUser']);
            },
            'initiateUser',
//            'attendUsers'
        ]);
        $Obj->orderBy('updated_at', 'desc');

        $Obj->where('need_audit', 1)
            ->whereHas('audit', function ($query) use ($userId) {
                $query->where('meeting_audit.audit_user_id', $userId);
            });

        if ($initiate_user_id !== null) {
            $Obj->where('initiate_user_id', $initiate_user_id);
        }

        if ($keyword !== null) {
            $Obj->where(function ($query) use ($keyword) {
                $query->where('title', 'like', "%{$keyword}%")
                    ->orWhere('location', 'like', "%{$keyword}%");
            });
        }

        $total = $Obj->count();

        if ($currentPage) {
            $pageSize = !$pageSize ? self::PAGE_SIZE : $pageSize;
        } else {
            $pageSize = 0;
        }
        if ($currentPage && $pageSize) {
            $offset = ($currentPage - 1) * $pageSize;
            $Obj->offset($offset)->limit($pageSize);
        }

        $get = $Obj->get();

        return ['rows' => $get->toArray(), 'pagination' =>getPagination($currentPage, $pageSize, $total)];
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
            ->findOrFail($meetingId);

        if ($getObject) {
            $result = $Obj;
        } else {
            $result = $Obj->toArray();
        }

        return $result;
    }

    static public function createMeeting(array $requestData): array
    {
        $validator = \Validator::make($requestData, [
//            'need_audit' => 'required',
            'title' => 'required',
            'type' => 'required',
            'location' => 'required',
            'opened_at' => 'required',
//            'ended_at' => 'required',
            'audit_user_id' => 'required',
            'leader_ids' => 'required',
            'attend_user_ids' => 'required',
        ]);

        try {
            if ($validator->fails()) {
                throw new \Exception($validator->errors()->first());
            }

            if (array_key_exists('ended_at', $requestData)
                && $requestData['opened_at']
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
                $Obj->department_id = Department_::getMyId();
                $Obj->initiate_user_id = User_::getMyId();
                $Obj->need_audit = 1;
                $Obj->title = $requestData['title'];
                $Obj->type = $requestData['type'];
                $Obj->location = $requestData['location'];
                $Obj->opened_at = $requestData['opened_at'];
//                $Obj->ended_at = $requestData['ended_at'];
                $Obj->save();

                if ($Obj->need_audit) {
                    $Obj->audit()
                        ->create([
                            'audit_user_id' => $requestData['audit_user_id'],
                            'status' => MeetingAudit::STATUS['未审核']
                        ]);

                    createNotification([
                        'user_id' => $requestData['audit_user_id'],
                        'related_type' => \App\Models\UserNotification::RELATED_TYPE['会议'],
                        'related_id' => $Obj->id,
                        'operate_type' => \App\Models\UserNotification::OPERATE_TYPE['审核'],
                    ]);
                }

                $saveMany = [];
                for ($i = 0; $i < count($requestData['leader_ids']); $i++) {
                    $saveMany[] =
                        new MeetingUser([
                            'user_id' => $requestData['leader_ids'][$i],
                            'type' => MeetingUser::TYPE['参会领导'],
                            'need_appointment' => $Obj->type == self::TYPE['线下'] ? 1 : 0,
                        ]);
                }
                for ($i = 0; $i < count($requestData['attend_user_ids']); $i++) {
                    $saveMany[] =
                        new MeetingUser([
                            'user_id' => $requestData['attend_user_ids'][$i],
                            'type' => MeetingUser::TYPE['参会人员'],
                            'need_appointment' => $Obj->type == self::TYPE['线下'] ? 1 : 0,
                        ]);
                }
                $Obj->attendUsersMiddle()->saveMany($saveMany);
            });
        } catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
        }

        return ['success' => (int)($success ?? 1), 'msg' => $msg ?? null, 'data' => $Obj ?? null];
    }

    static public function updateMeeting(int $meetingId, array $requestData): array
    {
        $validator = \Validator::make($requestData, [
//            'need_audit' => 'required',
            'title' => 'required',
            'type' => 'required',
            'location' => 'required',
            'opened_at' => 'required',
//            'ended_at' => 'required',
//            'audit_user_id' => 'required',
            'leader_ids' => 'required',
            'attend_user_ids' => 'required',
        ]);

        try {
            if ($validator->fails()) {
                throw new \Exception($validator->errors()->first());
            }

            if (array_key_exists('ended_at', $requestData)
                && $requestData['opened_at']
                && $requestData['ended_at']
                && $requestData['opened_at'] >= $requestData['ended_at']) {
                throw new \Exception('会议结束时间不能早于开始时间');
            }
            if ($requestData['opened_at'] <= Carbon::now()->timestamp) {
                throw new \Exception('会议开始时间错误');
            }

            $Obj = null;
            DB::transaction(function () use (&$Obj, $meetingId, $requestData) {
                $Obj = Meeting::findOrFail($meetingId);

                if ($Obj->need_audit
                    && in_array(
                        $Obj->audit->status,
                        [
                            MeetingAudit::STATUS['初审成功'],
                            MeetingAudit::STATUS['预约成功'],
                            MeetingAudit::STATUS['通过审核'],
                        ]
                    )
                ) {
                    throw new \Exception('当前状态不允许修改');
                }

                $Obj->title = $requestData['title'];
                $Obj->type = $requestData['type'];
                $Obj->location = $requestData['location'];
                $Obj->opened_at = $requestData['opened_at'];
//                $Obj->ended_at = $requestData['ended_at'];
                $Obj->save();

                if ($Obj->need_audit) {

                    $AuditObj = MeetingAudit::findOrFail($Obj->audit->id);
                    $AuditObj->status = MeetingAudit::STATUS['未审核'];
                    $AuditObj->save();

                    createNotification([
                        'user_id' => $requestData['audit_user_id'],
                        'related_type' => \App\Models\UserNotification::RELATED_TYPE['会议'],
                        'related_id' => $Obj->id,
                        'operate_type' => \App\Models\UserNotification::OPERATE_TYPE['审核'],
                    ]);
                }

                $saveMany = [];
                for ($i = 0; $i < count($requestData['leader_ids']); $i++) {
                    $saveMany[] =
                        new MeetingUser([
                            'user_id' => $requestData['leader_ids'][$i],
                            'type' => MeetingUser::TYPE['参会领导'],
                            'need_appointment' => $Obj->type == self::TYPE['线下'] ? 1 : 0,
                        ]);
                }
                for ($i = 0; $i < count($requestData['attend_user_ids']); $i++) {
                    $saveMany[] =
                        new MeetingUser([
                            'user_id' => $requestData['attend_user_ids'][$i],
                            'type' => MeetingUser::TYPE['参会人员'],
                            'need_appointment' => $Obj->type == self::TYPE['线下'] ? 1 : 0,
                        ]);
                }
                $Obj->attendUsersMiddle()->delete();
                $Obj->attendUsersMiddle()->saveMany($saveMany);
            });
        } catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
        }

        return ['success' => (int)($success ?? 1), 'msg' => $msg ?? null, 'data' => $Obj ?? null];
    }

    static public function deleteMeeting(int $meetingId): array
    {
        try {
            $meeting = Meeting_::getMeeting($meetingId, true);

            if (!empty($meeting->audit) && $meeting->audit->status === MeetingAudit::STATUS['初审成功']) {
                throw new \Exception('会议已通过初审，不允许删除');
            }

            if (!empty($meeting->audit) && $meeting->audit->status === MeetingAudit::STATUS['通过审核']) {
                throw new \Exception('会议已通过审核，不允许删除');
            }

            if (!empty($meeting->audit) && $meeting->audit->status === MeetingAudit::STATUS['预约成功']) {
                throw new \Exception('会议已预约成功，不允许删除');
            }

            if ($meeting->opened_at <= Carbon::now()->timestamp) {
                throw new \Exception('会议已经开始，不允许删除');
            }

            DB::transaction(function () use ($meetingId) {
                $Obj = Meeting::findOrFail($meetingId);
                $Obj->attendUsersMiddle()->delete();
                $Obj->audit()->delete();
                $Obj->delete();
            });
        } catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
        }

        return ['success' => (int)($success ?? 1), 'msg' => $msg ?? null, 'data' => $meeting];
    }

    static public function signIn(int $meetingId, int $userId): array
    {
        try {
            $meeting = Meeting_::getMeeting($meetingId, true);

            if (!$meeting) {
                throw new \Exception('signIn Obj null error');
            }
            if (!$meeting->audit) {
                throw new \Exception('signIn Obj audit null error');
            }
            if ($meeting->audit['status'] !== MeetingAudit::STATUS['通过审核']) {
                throw new \Exception('会议状态错误');
            }
            if ($meeting->opened_at < Carbon::now()->timestamp - Meeting_::AHEAD_SIGN_IN_TIMESTAMP) {
                throw new \Exception('未到签到时间');
            }
            if ($meeting->ended_at > Carbon::now()->timestamp) {
                throw new \Exception('会议已结束');
            }

            $Obj = $meeting
                ->attendUsers()
                ->where('user_id', $userId)
                ->where('meeting_id', $meeting->id)
                ->firstOrFail();

            if (!$Obj) {
                throw new \Exception('错误：您未参会');
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

        return ['success' => (int)($success ?? 1), 'msg' => $msg ?? null];
    }

    static public function auditMeeting(int $meetingId, int $status, $reason = '')
    {
        try {
            $row = MeetingAudit::where('meeting_id', $meetingId)->firstOrFail();
            $userId = User_::getMyId();

            if (empty($row)) {
                throw new \Exception('获取审核信息失败');
            }

            if ($row->audit_user_id !== $userId) {
                throw new \Exception('没有审核权限');
            }

            if ($row->status !== MeetingAudit::STATUS['未审核']) {
                throw new \Exception('状态错误');
            }

            if (!in_array($status, [MeetingAudit::STATUS['初审成功'], MeetingAudit::STATUS['初审失败']])) {
                throw new \Exception('param status error');
            }

            $row->status = $status;
            $row->reason = $reason;

            $row->save();
        } catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
        }

        return ['success' => (int)($success ?? 1), 'msg' => $msg ?? null];
    }

    static public function arrangeMeetingAndSendPush(int $meetingId, int $status, $reason = '')
    {
        try {
            $row = MeetingAudit::where('meeting_id', $meetingId)->firstOrFail();
            $userId = User_::getMyId();

            if (empty($row)) {
                throw new \Exception('获取审核信息失败');
            }
            if ($row->audit_user_id !== $userId) {
                throw new \Exception('没有审核权限');
            }
            if ($row->status !== MeetingAudit::STATUS['初审成功']) {
                throw new \Exception('状态错误');
            }
            if (!in_array($status, [MeetingAudit::STATUS['预约成功'], MeetingAudit::STATUS['预约失败']])) {
                throw new \Exception('param status error');
            }

            $row->status = $status;
            $row->reason = $reason;

            $row->save();

            if ($status) {
                $meeting = self::getMeeting($meetingId);
                createNotification([
                    'user_id' => $meeting['initiate_user_id'],
                    'related_type' => \App\Models\UserNotification::RELATED_TYPE['会议'],
                    'related_id' => $meeting['id'],
                    'operate_type' => \App\Models\UserNotification::OPERATE_TYPE['审核通过'],
                ]);

                createNotification([
                    'user_id' => array_column($meeting['attend_users'], 'id'),
                    'related_type' => \App\Models\UserNotification::RELATED_TYPE['会议'],
                    'related_id' => $meeting['id'],
                    'operate_type' => \App\Models\UserNotification::OPERATE_TYPE['参加'],
                ]);
            }

        } catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
        }

        return ['success' => (int)($success ?? 1), 'msg' => $msg ?? null];
    }
}
