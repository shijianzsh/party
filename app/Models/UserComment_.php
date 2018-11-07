<?php

namespace App\Models;

use DB;

class UserComment_ extends UserComment
{
    static public function getCommentList(
        int $currentPage = 0,
        int $pageSize = 0,
        array $filter = [
            'user_id' => 0,
            'to_user_id' => 0,
        ],
        array $with = []
    ): array
    {
        $userId =& $filter['user_id'];
        $toUserId =& $filter['to_user_id'];

        $Obj = UserComment::with($with);
        $Obj->orderBy('updated_at', 'desc');

        if ($userId) {
            $Obj->where('user_id', $userId);
        }

        if ($toUserId) {
            $Obj->whereHas('commentUsersMiddle', function ($query) use ($toUserId) {
                $query->where('user_comment_user.user_id', $toUserId);
            });

            $Obj->where(function ($query) {
                $query->where('need_audit', 0)
                    ->orWhere(function ($query) {
                        $query->where('need_audit', 1)
                            ->whereHas('audit', function ($query) {
                                $query->where('user_comment_audit.status', 1);
                            });
                    });
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

        return ['rows' => $get->toArray(),
            'pagination' =>getPagination($currentPage, $pageSize, $total)
        ];
    }

    static public function getAuditUserCommentList(
        int $currentPage = 0,
        int $pageSize = 0,
        array $filter = [
            'audit_user_id' => 0,
            'user_id' => 0,
            'to_user_id' => 0,
        ],
        array $with = []
    ): array
    {
        $auditUserId =& $filter['audit_user_id'];
        $userId =& $filter['user_id'];
        $toUserId =& $filter['to_user_id'];

        $Obj = UserComment::with($with);
        $Obj->orderBy('created_at', 'desc');

        $Obj->where('need_audit', 1)
            ->whereHas('audit', function ($query) use ($auditUserId) {
                $query->where('user_comment_audit.audit_user_id', $auditUserId);
            });

        if ($userId) {
            $Obj->where('user_id', $userId);
        }

        if ($toUserId) {
            $Obj->whereHas('commentUsersMiddle', function ($query) use ($toUserId) {
                $query->where('user_comment_user.user_id', $toUserId);
            });

            $Obj->where(function ($query) {
                $query->where('need_audit', 0)
                    ->orWhere(function ($query) {
                        $query->where('need_audit', 1)
                            ->whereHas('audit', function ($query) {
                                $query->where('user_comment_audit.status', 1);
                            });
                    });
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

        return ['rows' => $get->toArray(),
            'pagination' =>getPagination($currentPage, $pageSize, $total)
        ];
    }

    static public function getComment(int $commentId, array $with = []): array
    {
        return $Obj = UserComment::with($with)->findOrFail($commentId)->toArray();
    }

    static public function createComment(array $requestData): array
    {
        $validator = \Validator::make($requestData, [
            'to_user_ids' => 'required',
            'audit_user_id' => 'required',
//            'need_audit' => 'required',
            'comment_title' => 'required',
            'comment_content' => 'required',
            'leave_at' => 'required',
//            'more_files' => 'required',
            'is_send_sms' => 'required',
        ]);

        try {
            if ($validator->fails()) {
                throw new \Exception($validator->errors()->first());
            }

            DB::transaction(function () use ($requestData) {
                $Obj = new UserComment();
                $Obj->user_id = User_::getMyId();
                $Obj->need_audit = $requestData['need_audit'] ?? 1;//默认需要审核
                $Obj->comment_title = $requestData['comment_title'];
                $Obj->comment_content = $requestData['comment_content'];
                $Obj->leave_at = $requestData['leave_at'];
                $Obj->more = [
                    'files' => $requestData['more_files'] ?? null,
                ];
                $Obj->save();

                if ($Obj->need_audit) {
                    $Obj->audit()->save(new UserCommentAudit(['audit_user_id' => $requestData['audit_user_id']]));

                    createNotification([
                        'user_id' => $requestData['audit_user_id'],
                        'related_type' => \App\Models\UserNotification::RELATED_TYPE['留言'],
                        'related_id' => $Obj->id,
                        'operate_type' => \App\Models\UserNotification::OPERATE_TYPE['审核'],
                        'is_send_sms' => (int)$requestData['is_send_sms'],
                    ]);
                }

                $createMany = [];
                for ($i = 0; $i < count($requestData['to_user_ids']); $i++) {
                    $createMany[] = [
                        'comment_id' => $Obj->id,
                        'user_id' => $requestData['to_user_ids'][$i],
                        'created_at' => time(),
                        'updated_at' => time(),
                    ];
                }
                UserCommentUser::insert($createMany);
            });
        } catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
        }

        return ['success' => (int)($success ?? 1), 'msg' => $msg ?? null];
    }

    static public function updateComment(int $commentId, array $requestData): array
    {
        $validator = \Validator::make($requestData, [
            'to_user_ids' => 'required',
            'audit_user_id' => 'required',
            'comment_title' => 'required',
            'comment_content' => 'required',
            'leave_at' => 'required',
//            'more_files' => 'required',
        ]);

        try {
            if ($validator->fails()) {
                throw new \Exception($validator->errors()->first());
            }

            DB::transaction(function () use ($commentId, $requestData) {
                $Obj = UserComment::findOrFail($commentId);
                $Obj->comment_title = $requestData['comment_title'];
                $Obj->comment_content = $requestData['comment_content'];
                $Obj->leave_at = $requestData['leave_at'];
                $Obj->more = [
                    'files' => $requestData['more_files'] ?? null,
                ];
                $Obj->save();

                if ($Obj->need_audit) {
                    UserCommentAudit::where('comment_id', $commentId)->delete();

                    $Obj->audit()->save(new UserCommentAudit(['audit_user_id' => $requestData['audit_user_id'] ?? 0]));
                } else {
                    UserCommentAudit::where('comment_id', $commentId)->delete();
                }

                for ($i = 0; $i < count($requestData['to_user_ids']); $i++) {
                    UserCommentUser::updateOrCreate(
                        [
                            'comment_id' => $Obj->id,
                            'user_id' => $requestData['to_user_ids'][$i],
                        ]
                    );
                }

                UserCommentUser
                    ::where('comment_id', $Obj->id)
                    ->whereNotIn('user_id', $requestData['to_user_ids'])
                    ->delete();
            });
        } catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
        }

        return ['success' => (int)($success ?? 1), 'msg' => $msg ?? null];
    }

    static public function deleteComment(int $commentId): array
    {
        try {
            $comment = self::getComment($commentId);
            if ($comment['audit_status'] === UserCommentAudit::STATUS['通过']) {
                throw new \Exception('禁止删除已通过审核的留言');
            }

            $success = UserComment::destroy($commentId);
        } catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
        }

        return ['success' => (int)($success ?? 1), 'msg' => $msg ?? null];
    }

    static public function auditComment(int $commentId, int $status, $reason)
    {
        try {
            $row = UserCommentAudit::where('comment_id', $commentId)
                ->where('audit_user_id', User_::getMyId())
                ->firstOrFail();

            if ($row->status !== UserCommentAudit::STATUS['待审核']) {
                $statusNow = array_flip(UserCommentAudit::STATUS)[$row->status];
                throw new \Exception('操作失败，已经审核过了。当前状态为 ' . $statusNow);
            }

            $row->status = $status;
            $row->reason = $reason;
            $success = $row->save();

            if ($status) {
                $comment = self::getComment($commentId);
                createNotification([
                    'user_id' => $comment['user_id'],
                    'related_type' => \App\Models\UserNotification::RELATED_TYPE['留言'],
                    'related_id' => $comment['id'],
                    'operate_type' => \App\Models\UserNotification::OPERATE_TYPE['审核通过'],
                ]);

                createNotification([
                    'user_id' => $comment['to_user_ids'],
                    'related_type' => \App\Models\UserNotification::RELATED_TYPE['留言'],
                    'related_id' => $comment['id'],
                    'operate_type' => \App\Models\UserNotification::OPERATE_TYPE['查看'],
                ]);
            }
        } catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
        }

        return ['success' => (int)($success ?? 1), 'msg' => $msg ?? null];
    }
}
