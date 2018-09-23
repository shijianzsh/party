<?php

namespace App\Models;

class Election_ extends _BaseModel
{
    static public function getElectionList(
        int $currentPage = 0,
        int $pageSize = 0,
        array $filter = [
            'initiate_user_id' => null,
            'keyword' => null,
            'start_timestamp' => 0,
            'end_timestamp' => 0
        ]
    ): array
    {
        $initiate_user_id =& $filter['initiate_user_id'];
        $keyword =& $filter['keyword'];
        $startTimestamp =& $filter['start_timestamp'];
        $endTimestamp =& $filter['end_timestamp'];

        $Obj = Election::with(['initiateUser']);

        if ($initiate_user_id !== null) {
            $Obj->where('initiate_user_id', $initiate_user_id);
        }

        if ($keyword !== null) {
            $Obj->where(function ($query) use ($keyword) {
                $query->where('initiate_content', 'like', "%{$keyword}%")
                    ->orWhere('publicity_content', 'like', "%{$keyword}%");
            });
        }


        if ($startTimestamp) {
            $Obj->where('started_at', '>=', $startTimestamp);
        }

        if ($endTimestamp) {
            $Obj->where('ended_at', '<=', $endTimestamp);
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

        return ['rows' => $get->toArray(), 'pagination' => ['current' => $currentPage, 'pageSize' => $pageSize, 'total' => $total ?? 0]];
    }

    static public function getElection(int $ElectionId, bool $getObject = false)
    {
        $Obj = Election::with([
            'initiateUser',
            'options' => function ($query) {
                $query->with(['results']);
            },
            'attendUsers',
            'results',
        ])
            ->findOrFail($ElectionId);

        if ($getObject) {
            $result = $Obj;
        } else {
            $result = $Obj->toArray();
        }

        return $result;
    }

    static public function createElection(array $requestData): array
    {
        $validator = \Validator::make($requestData, [
//            'initiate_user_id' => 'initiate_user_id',//自动获取
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
                $Obj = new Election;
                $Obj->department_id = User::where('id', User_::getMyId())->first()->department->id;
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
                            'status' => ElectionAudit::STATUS['未审核']
                        ]);
                }

                $saveMany = [];
                for ($i = 0; $i < count($requestData['leader_ids']); $i++) {
                    $saveMany[] =
                        new ElectionUser([
                            'user_id' => $requestData['leader_ids'][$i],
                            'type' => ElectionUser::TYPE['参会领导'],
                            'need_appointment' => $Obj->type == self::TYPE['线下'] ? 1 : 0,
                        ]);
                }
                for ($i = 0; $i < count($requestData['attend_user_ids']); $i++) {
                    $saveMany[] =
                        new ElectionUser([
                            'user_id' => $requestData['attend_user_ids'][$i],
                            'type' => ElectionUser::TYPE['参会人员'],
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

    static public function updateElection(int $ElectionId, array $requestData): array
    {
        //TODO
        return [];
        $validator = \Validator::make($requestData, [
//            'initiate_user_id' => 'initiate_user_id',//自动获取
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
                $Obj = new Election;
                $Obj->department_id = User::where('id', User_::getMyId())->first()->department['id'];
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
                            'status' => ElectionAudit::STATUS['未审核']
                        ]);
                }

                $saveMany = [];
                for ($i = 0; $i < count($requestData['leader_ids']); $i++) {
                    $saveMany[] =
                        new ElectionUser([
                            'user_id' => $requestData['leader_ids'][$i],
                            'type' => ElectionUser::TYPE['参会领导'],
                            'need_appointment' => $Obj->type == self::TYPE['线下'] ? 1 : 0,
                        ]);
                }
                for ($i = 0; $i < count($requestData['attend_user_ids']); $i++) {
                    $saveMany[] =
                        new ElectionUser([
                            'user_id' => $requestData['attend_user_ids'][$i],
                            'type' => ElectionUser::TYPE['参会人员'],
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

    static public function deleteElection(int $ElectionId): array
    {
        try {
            $Election = Election_::getElection($ElectionId, true);

            if ($Election->started_at <= Carbon::now()->timestamp) {
                throw new \Exception('选举表决已经开始，不允许删除');
            }

            DB::transaction(function () use ($ElectionId) {
                $Obj = Election::findOrFail($ElectionId);
                $Obj->options()->delete();
                $Obj->attendUsers()->delete();
                $Obj->results()->delete();
                $Obj->delete();
            });
        } catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
        }

        return ['success' => (int)($success ?? 1), 'msg' => $msg ?? null, 'data' => $Election];
    }
}
