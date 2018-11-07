<?php

namespace App\Models;

class PortalPostComment_ extends PortalPostComment
{
    static public function getPostCommentList(
        int $currentPage = 0,
        int $pageSize = 0,
        array $filter = [
            'post_id' => null,
        ],
        array $with = []
    ): array
    {
        $postId =& $filter['post_id'];

        $post = PortalPost_::getPost($postId);
        if (!$post['comment_status']) {
            goto end;
        }

        $Obj = PortalPostComment::with($with);
        $Obj->where('post_id', $postId);
        $Obj->orderBy('created_at', 'desc');//根据发布日期排序

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

        end:
        return [
            'rows' => isset($get)?$get->toArray():[],
            'pagination' =>getPagination($currentPage, $pageSize, $total)
        ];
    }

    static public function getPostComment(int $PortalPostCommentId, bool $getObject = false)
    {
        $Obj = PortalPostComment::with([])->findOrFail($PortalPostCommentId);

        if ($getObject) {
            $result = $Obj;
        } else {
            $result = $Obj->toArray();
        }

        return $result;
    }

    static public function createPostComment(array $requestData): array
    {
        $validator = \Validator::make($requestData, [
            'post_id' => 'required',
            'comment_content' => 'required',
        ]);

        try {
            if ($validator->fails()) {
                throw new \Exception($validator->errors()->first());
            }

            $post = PortalPost_::getPost($requestData['post_id']);
            if (!$post['comment_status']) {
                throw new \Exception('文章不允许评论');
            }

            $Obj = new PortalPostComment();
            $Obj->post_id = $requestData['post_id'];
            $Obj->user_id = User_::getMyId();
            $Obj->comment_content = $requestData['comment_content'] ?? '';
            $success = $Obj->save();
        } catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
        }

        return ['success' => (int)($success ?? 1), 'msg' => $msg ?? null];
    }

    static public function updatePostComment(int $postCommentId, array $requestData): array
    {
        $validator = \Validator::make($requestData, [
            'comment_content' => '',
        ]);

        try {
            if ($validator->fails()) {
                throw new \Exception($validator->errors()->first());
            }

            $post = PortalPost_::getPost($requestData['post_id']);
            if (!$post['comment_status']) {
                throw new \Exception('文章不允许评论');
            }

            $Obj = PortalPostComment::findOrFail($postCommentId);
            $Obj->comment_content = $requestData['comment_content'] ?? '';
            $success = $Obj->save();
        } catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
        }

        return ['success' => (int)($success ?? 1), 'msg' => $msg ?? null];
    }

    static public function deletePostComment(int $postCommentId): array
    {
        try {
            $Obj = PortalPostComment::with([])->findOrFail($postCommentId);
            if (!$Obj) {
                throw new \Exception('deletePortalPostComment Obj null error');
            }
            $Obj->delete();
        } catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
        }

        return ['success' => (int)($success ?? 1), 'msg' => $msg ?? null];
    }
}
