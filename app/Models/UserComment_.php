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
            'pagination' => ['current' => $currentPage, 'pageSize' => $pageSize, 'total' => $total ?? 0]
        ];
    }

    static public function getComment(int $CommentId, array $with = []): array
    {
        return $Obj = UserComment::with($with)->findOrFail($CommentId)->toArray();
    }

    static public function createComment(array $requestData): array
    {
        $validator = \Validator::make($requestData, [
//            'user_id' => 'required',
//            'to_user_ids' => 'required',
//            'audit_user_id' => 'required',
//            'need_audit' => 'required',
//            'comment_title' => 'required',
//            'comment_content' => 'required',
//            'more_thumbnail' => 'required',
//            'more_photos' => 'required',
//            'more_videos' => 'required',
//            'more_files' => 'required',
        ]);

        try {
            if ($validator->fails()) {
                throw new \Exception($validator->errors()->first());
            }

            DB::transaction(function () use ($requestData) {
                $Obj = new UserComment();
                $Obj->user_id = $requestData['user_id'] ?? 0;
                $Obj->need_audit = $requestData['need_audit'] ?? 1;//默认需要审核
                $Obj->comment_title = $requestData['comment_title'] ?? '';
                $Obj->comment_content = $requestData['comment_content'] ?? '';
                $Obj->leave_at = $requestData['leave_at'] ?? 0;
                $Obj->more = [
                    'files' => $requestData['more_files'] ?? null,
                ];
                $Obj->save();

                if ($Obj->need_audit) {
                    $Obj->audit()->save(new UserCommentAudit(['audit_user_id' => $requestData['audit_user_id'] ?? 0]));
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

    static public function updateComment(int $CommentId, array $requestData): array
    {
        $validator = \Validator::make($requestData, [
//            'user_id' => 'required',
//            'to_user_ids' => 'required',
//            'audit_user_id' => 'required',
//            'need_audit' => 'required',
//            'comment_title' => 'required',
//            'comment_content' => 'required',
//            'more_thumbnail' => 'required',
//            'more_photos' => 'required',
//            'more_videos' => 'required',
//            'more_files' => 'required',
        ]);

        try {
            if ($validator->fails()) {
                throw new \Exception($validator->errors()->first());
            }

            DB::transaction(function () use ($CommentId, $requestData) {
                $Obj = UserComment::findOrFail($CommentId);
//                $Obj->user_id = $requestData['user_id'] ?? 0;
//                $Obj->need_audit = $requestData['need_audit'] ?? 1;//默认需要审核
                $Obj->comment_title = $requestData['comment_title'] ?? '';
                $Obj->comment_content = $requestData['comment_content'] ?? '';
                $Obj->leave_at = $requestData['leave_at'] ?? 0;
                $Obj->more = [
                    'files' => $requestData['more_files'] ?? null,
                ];
                $Obj->save();

                if ($Obj->need_audit) {
                    UserCommentAudit::where('comment_id', $CommentId)->delete();

                    $Obj->audit()->save(new UserCommentAudit(['audit_user_id' => $requestData['audit_user_id'] ?? 0]));
                } else {
                    UserCommentAudit::where('comment_id', $CommentId)->delete();
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

    static public function deleteComment(int $CommentId): array
    {
        return ['success' => UserComment::destroy($CommentId)];
    }

    static public function auditComment(int $CommentId, int $status, string $reason)
    {
        $row = UserCommentAudit::where('comment_id', $CommentId)
            ->where('audit_user_id', User_::getMyId())
            ->firstOrFail();

        if ($row->status !== UserCommentAudit::STATUS['待审核']) {
            $statusNow = array_flip(UserCommentAudit::STATUS)[$row->status];
            throw new \Exception('操作失败，已经审核过了。当前状态为 ' . $statusNow);
        }

        $row->status = $status;
        $row->reason = $reason;

        return ['success' => (int)$row->save()];
    }
}
