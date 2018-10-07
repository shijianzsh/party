<?php

namespace App\Models;

use DB;
use Carbon\Carbon;

class Vote_ extends _BaseModel
{
    static public function getVoteList(
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

        $Obj = Vote::with(['initiateUser']);

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

    static public function getVote(int $voteId, bool $getObject = false)
    {
        $Obj = Vote::with([
            'initiateUser',
            'attendUsersMiddle',
            'attendUsers',
        ])
            ->findOrFail($voteId);

        if ($getObject) {
            $result = $Obj;
        } else {
            $result = $Obj->toArray();
        }

        return $result;
    }

    static public function getPublicizedVote(int $voteId): array
    {
        try {
            $vote = self::getVote($voteId, true);

            if ($vote->ended_at >= Carbon::now()->timestamp) {
                throw new \Exception('表决未结束，不可以查看结果');
            }

            //未公示时
            if (!$vote->is_publicized) {
                //未参加投票的人员无权查看结果
                if (!in_array(User_::getMyId(), $vote->attend_user_ids)) {
                    throw new \Exception('没有查看表决结果的权限');
                }
            }
            $success = 1;
            $data = $vote->toArray();
        } catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
        }

        return ['success' => (int)($success ?? 1), 'msg' => $msg ?? null, 'data' => $data ?? null];
    }

    static public function getAttendVote(int $voteId, bool $getObject = false): array
    {
        try {
            $vote = self::getVote($voteId, true);

            if ($vote->started_at >= Carbon::now()->timestamp) {
                throw new \Exception('表决未开始，不可以参加投票');
            }

            if ($vote->ended_at <= Carbon::now()->timestamp) {
                throw new \Exception('表决已结束，不可以参加投票');
            }

            //未参加投票的人员无权查看结果
            if (!in_array(User_::getMyId(), $vote->attend_user_ids)) {
                throw new \Exception('没有投票的权限');
            }

            //查看当前用户是否已提交过结果
            $userIdToIsSubmited = array_column($vote->attendUsersMiddle->toArray(), 'is_submited', 'user_id');
            if ($userIdToIsSubmited[User_::getMyId()]) {
                throw new \Exception('您已经投过票了，请勿重复投票');
            }

            $success = 1;
            $data = $getObject ? $vote : $vote->toArray();
        } catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
        }

        return ['success' => (int)($success ?? 1), 'msg' => $msg ?? null, 'data' => $data ?? null];
    }

    static public function createVote(array $requestData): array
    {
        $validator = \Validator::make($requestData, [
            'title' => 'required',
            'initiate_content' => 'required',
            'is_publicized' => 'required',
            'started_at' => 'required',
            'ended_at' => 'required',
            'attend_user_ids' => 'required',
            'more_files' => 'required',
        ]);

        try {
            if ($validator->fails()) {
                throw new \Exception($validator->errors()->first());
            }

            DB::transaction(function () use ($requestData) {
                $Obj = new Vote();
                $Obj->initiate_user_id = User_::getMyId();
                $Obj->title = $requestData['title'];
                $Obj->initiate_content = $requestData['initiate_content'];
                $Obj->is_publicized = $requestData['is_publicized'];
                $Obj->started_at = $requestData['started_at'] ?? 0;
                $Obj->ended_at = $requestData['ended_at'] ?? 0;
                $Obj->more = [
                    'files' => $requestData['more_files'] ?? null,
                ];
                $Obj->save();

                $createMany = [];
                for ($i = 0; $i < count($requestData['attend_user_ids']); $i++) {
                    $createMany[] = [
                        'vote_id' => $Obj->id,
                        'user_id' => $requestData['attend_user_ids'][$i],
                        'created_at' => time(),
                        'updated_at' => time(),
                    ];
                }
                VoteUser::insert($createMany);
            });
        } catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
        }

        return ['success' => (int)($success ?? 1), 'msg' => $msg ?? null];
    }

    static public function updateVote(int $voteId, array $requestData): array
    {
        $validator = \Validator::make($requestData, [
            'title' => 'required',
            'initiate_content' => 'required',
            'is_publicized' => 'required',
            'started_at' => 'required',
            'ended_at' => 'required',
            'attend_user_ids' => 'required',
            'more_files' => 'required',
        ]);

        try {
            if ($validator->fails()) {
                throw new \Exception($validator->errors()->first());
            }

            DB::transaction(function () use ($voteId, $requestData) {
                $Obj = Vote::findOrFail($voteId);

                if ($Obj->started_at < Carbon::now()->timestamp) {
                    throw new \Exception('表决已经开始，禁止修改操作');
                }
                if ($Obj->ended_at < Carbon::now()->timestamp) {
                    throw new \Exception('表决已经结束，禁止修改操作');
                }

                $Obj->initiate_user_id = User_::getMyId();
                $Obj->title = $requestData['title'];
                $Obj->initiate_content = $requestData['initiate_content'];
                $Obj->is_publicized = $requestData['is_publicized'];
                $Obj->started_at = $requestData['started_at'] ?? 0;
                $Obj->ended_at = $requestData['ended_at'] ?? 0;
                $Obj->more = [
                    'files' => $requestData['more_files'] ?? null,
                ];
                $Obj->save();

                $createMany = [];
                for ($i = 0; $i < count($requestData['attend_user_ids']); $i++) {
                    $createMany[] = [
                        'vote_id' => $Obj->id,
                        'user_id' => $requestData['attend_user_ids'][$i],
                        'created_at' => time(),
                        'updated_at' => time(),
                    ];
                }
                VoteUser::insert($createMany);
                VoteUser
                    ::where('vote_id', $Obj->id)
                    ->whereNotIn('user_id', $requestData['attend_user_ids'])
                    ->delete();
            });
        } catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
        }

        return ['success' => (int)($success ?? 1), 'msg' => $msg ?? null];
    }

    static public function updateVotePublicityContent(int $voteId, array $requestData): array
    {
        $validator = \Validator::make($requestData, [
            'publicity_content' => 'required',
        ]);

        try {
            if ($validator->fails()) {
                throw new \Exception($validator->errors()->first());
            }

            DB::transaction(function () use ($voteId, $requestData) {
                $Obj = self::getVote($voteId, true);

                if ($Obj->ended_at >= Carbon::now()->timestamp) {
                    throw new \Exception('表决尚未结束');
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

    static public function deleteVote(int $voteId): array
    {
        try {
            $vote = self::getVote($voteId, true);

            if ($vote->started_at <= Carbon::now()->timestamp) {
                throw new \Exception('表决表决已经开始，不允许删除');
            }

            DB::transaction(function () use ($voteId) {
                $Obj = Vote::findOrFail($voteId);
                $Obj->attendUsersMiddle()->delete();
                $Obj->delete();
            });
        } catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
        }

        return ['success' => (int)($success ?? 1), 'msg' => $msg ?? null, 'data' => $vote ?? null];
    }

    static public function AttendSubmit(int $voteId, array $requestData)
    {
        $validator = \Validator::make($requestData, [
            'result' => 'required',
        ]);

        try {
            if ($validator->fails()) {
                throw new \Exception($validator->errors()->first());
            }

            $getAttendVote = self::getAttendVote($voteId, true);
            if (!$getAttendVote['success']) {
                return $getAttendVote;
            }

            $myId = User_::getMyId();

            DB::transaction(function () use ($myId, $voteId, $requestData) {
                $voteUser = VoteUser::where('vote_id', $voteId)
                    ->where('user_id', $myId)
                    ->where('is_submited', 0)
                    ->firstOrFail();
                $voteUser->is_submited = 1;
                $voteUser->vote_result = $requestData['result'];
                $voteUser->save();
            });
        } catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
        }

        return ['success' => (int)($success ?? 1), 'msg' => $msg ?? null];
    }
}
