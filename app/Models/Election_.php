<?php

namespace App\Models;

use DB;
use Carbon\Carbon;

class Election_ extends Election
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

        $Obj = Election::with(['initiateUser', 'options', 'attendUsersMiddle']);
        $Obj->orderBy('updated_at', 'desc');

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

        return ['rows' => $get->toArray(), 'pagination' =>getPagination($currentPage, $pageSize, $total)];
    }

    static public function getElection(int $electionId, bool $getObject = false)
    {
        $Obj = Election::with([
            'initiateUser',
            'options' => function ($query) {
                $query->with(['results', 'contentUser']);
            },
            'attendUsersMiddle',
            'results',
        ])
            ->findOrFail($electionId);

        if ($getObject) {
            $result = $Obj;
        } else {
            $result = $Obj->toArray();
        }

        return $result;
    }

    static public function getPublicizedElection(int $electionId): array
    {
        try {
            $election = self::getElection($electionId, true);

            if ($election->ended_at >= Carbon::now()->timestamp) {
                throw new \Exception('选举未结束，不可以查看结果');
            }

            //未公示时
            if (!$election->is_publicized) {
                //未参加投票的人员无权查看结果
                if (!in_array(User_::getMyId(), $election->result_user_ids)) {
                    throw new \Exception('没有查看选举结果的权限');
                }
            }
            $success = 1;
            $data = $election->toArray();
        } catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
        }

        return ['success' => (int)($success ?? 1), 'msg' => $msg ?? null, 'data' => $data ?? null];
    }

    static public function getAttendElection(int $electionId, bool $getObject = false): array
    {
        try {
            $election = self::getElection($electionId, true);

            if ($election->started_at >= Carbon::now()->timestamp) {
                throw new \Exception('选举未开始，不可以参加投票');
            }

            if ($election->ended_at <= Carbon::now()->timestamp) {
                throw new \Exception('选举已结束，不可以参加投票');
            }

            //未参加投票的人员无权查看结果
            if (!in_array(User_::getMyId(), $election->attend_user_ids)) {
                throw new \Exception('没有投票的权限');
            }

            if (in_array(User_::getMyId(), $election->result_user_ids)) {
                throw new \Exception('您已经投过票了，请勿重复投票');
            }

            $success = 1;
            $data = $getObject ? $election : $election->toArray();
        } catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
        }

        return ['success' => (int)($success ?? 1), 'msg' => $msg ?? null, 'data' => $data ?? null];
    }

    static public function createElection(array $requestData): array
    {
        $validator = \Validator::make($requestData, [
            'title' => 'required',
            'option_select_count' => 'required',
            'initiate_content' => 'required',
            'is_publicized' => 'required',
            'started_at' => 'required',
            'ended_at' => 'required',
            'election_user_ids' => 'required',
            'attend_user_ids' => 'required',
//            'more_files' => 'required',
        ]);

        try {
            if ($validator->fails()) {
                throw new \Exception($validator->errors()->first());
            }

            DB::transaction(function () use ($requestData) {
                $Obj = new Election();
                $Obj->initiate_user_id = User_::getMyId();
                $Obj->title = $requestData['title'];
                $Obj->option_select_count = $requestData['option_select_count'];
                $Obj->initiate_content = $requestData['initiate_content'];
                $Obj->is_publicized = $requestData['is_publicized'];
                $Obj->started_at = $requestData['started_at'] ?? 0;
                $Obj->ended_at = $requestData['ended_at'] ?? 0;
                $Obj->more = [
                    'files' => $requestData['more_files'] ?? null,
                ];
                $Obj->save();

                $createMany = [];
                for ($i = 0; $i < count($requestData['election_user_ids']); $i++) {
                    $createMany[] = [
                        'election_id' => $Obj->id,
                        'content_user_id' => $requestData['election_user_ids'][$i],
                        'created_at' => time(),
                        'updated_at' => time(),
                    ];
                }
                ElectionOption::insert($createMany);

                $createMany = [];
                for ($i = 0; $i < count($requestData['attend_user_ids']); $i++) {
                    $createMany[] = [
                        'election_id' => $Obj->id,
                        'user_id' => $requestData['attend_user_ids'][$i],
                        'created_at' => time(),
                        'updated_at' => time(),
                    ];
                }
                ElectionUser::insert($createMany);
            });
        } catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
        }

        return ['success' => (int)($success ?? 1), 'msg' => $msg ?? null];
    }

    static public function updateElection(int $electionId, array $requestData): array
    {
        $validator = \Validator::make($requestData, [
            'title' => 'required',
            'initiate_content' => 'required',
            'is_publicized' => 'required',
            'started_at' => 'required',
            'ended_at' => 'required',
            'election_user_ids' => 'required',
            'attend_user_ids' => 'required',
            'more_files' => 'required',
        ]);

        try {
            if ($validator->fails()) {
                throw new \Exception($validator->errors()->first());
            }

            DB::transaction(function () use ($electionId, $requestData) {
                $Obj = Election::findOrFail($electionId);

                if ($Obj->started_at < Carbon::now()->timestamp) {
                    throw new \Exception('选举已经开始，禁止修改操作');
                }
                if ($Obj->ended_at < Carbon::now()->timestamp) {
                    throw new \Exception('选举已经结束，禁止修改操作');
                }

                $Obj->initiate_user_id = User_::getMyId();
                $Obj->title = $requestData['title'];
                $Obj->option_select_count = $requestData['option_select_count'];
                $Obj->initiate_content = $requestData['initiate_content'];
                $Obj->is_publicized = $requestData['is_publicized'];
                $Obj->started_at = $requestData['started_at'] ?? 0;
                $Obj->ended_at = $requestData['ended_at'] ?? 0;
                $Obj->more = [
                    'files' => $requestData['more_files'] ?? null,
                ];
                $Obj->save();

                $createMany = [];
                for ($i = 0; $i < count($requestData['election_user_ids']); $i++) {
                    $createMany[] = [
                        'election_id' => $Obj->id,
                        'content_user_id' => $requestData['election_user_ids'][$i],
                        'created_at' => time(),
                        'updated_at' => time(),
                    ];
                }
                ElectionOption::insert($createMany);
                ElectionOption
                    ::where('election_id', $Obj->id)
                    ->whereNotIn('content_user_id', $requestData['election_user_ids'])
                    ->delete();

                $createMany = [];
                for ($i = 0; $i < count($requestData['attend_user_ids']); $i++) {
                    $createMany[] = [
                        'election_id' => $Obj->id,
                        'user_id' => $requestData['attend_user_ids'][$i],
                        'created_at' => time(),
                        'updated_at' => time(),
                    ];
                }
                ElectionUser::insert($createMany);
                ElectionUser
                    ::where('election_id', $Obj->id)
                    ->whereNotIn('user_id', $requestData['attend_user_ids'])
                    ->delete();
            });
        } catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
        }

        return ['success' => (int)($success ?? 1), 'msg' => $msg ?? null];
    }

    static public function updateElectionPublicityContent(int $electionId, array $requestData): array
    {
        $validator = \Validator::make($requestData, [
            'publicity_content' => 'required',
        ]);

        try {
            if ($validator->fails()) {
                throw new \Exception($validator->errors()->first());
            }

            DB::transaction(function () use ($electionId, $requestData) {
                $Obj = self::getElection($electionId, true);

                if ($Obj->ended_at >= Carbon::now()->timestamp) {
                    throw new \Exception('选举尚未结束');
                }
                if ($Obj->initiate_user_id !== User_::getMyId()) {
                    throw new \Exception('您没有该权限');
                }

                $Obj->publicity_content = $requestData['publicity_content'];
                $Obj->published_at = Carbon::now()->timestamp;
                $Obj->save();
            });
        } catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
        }

        return ['success' => (int)($success ?? 1), 'msg' => $msg ?? null];
    }

    static public function deleteElection(int $electionId): array
    {
        try {
            $Election = Election_::getElection($electionId, true);

            if ($Election->started_at <= Carbon::now()->timestamp) {
                throw new \Exception('选举已经开始，不允许删除');
            }

            DB::transaction(function () use ($electionId) {
                $Obj = Election::findOrFail($electionId);
                $Obj->options()->delete();
                $Obj->attendUsersMiddle()->delete();
                $Obj->results()->delete();
                $Obj->delete();
            });
        } catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
        }

        return ['success' => (int)($success ?? 1), 'msg' => $msg ?? null, 'data' => $Election ?? null];
    }

    static public function AttendSubmit(int $electionId, array $requestData)
    {
        $validator = \Validator::make($requestData, [
            'option_ids' => 'required',
        ]);

        try {
            if ($validator->fails()) {
                throw new \Exception($validator->errors()->first());
            }

            $getAttendElection = self::getAttendElection($electionId, true);
            if (!$getAttendElection['success']) {
                return $getAttendElection;
            }

            $myId = User_::getMyId();

            DB::transaction(function () use ($myId, $electionId, $requestData) {
                $createMany = [];
                for ($i = 0; $i < count($requestData['option_ids']); $i++) {
                    $createMany[] = [
                        'election_id' => $electionId,
                        'user_id' => $myId,
                        'option_id' => $requestData['option_ids'][$i],
                        'created_at' => time(),
                        'updated_at' => time(),
                    ];
                }
                ElectionResult::insert($createMany);
            });
        } catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
        }

        return ['success' => (int)($success ?? 1), 'msg' => $msg ?? null];
    }
}
