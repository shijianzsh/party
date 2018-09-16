<?php

namespace App\Models;

use App\Models\PortalCategory_;
use DB;

class PortalPost_ extends PortalPost
{
    static public function getPostList(
        int $currentPage = 0,
        int $pageSize = 0,
        array $filter = [
            'category_id' => 0,
            'is_published' => null,
            'keyword' => "",
            'start_timestamp' => 0,
            'end_timestamp' => 0
        ],
        array $with = []
    ): array
    {
        $categoryId =& $filter['category_id'];
        $keyWord =& $filter['keyword'];
        $isPublished =& $filter['is_published'];
        $startTimestamp =& $filter['start_timestamp'];
        $endTimestamp =& $filter['end_timestamp'];

        $Obj = PortalPost::with(array_merge(['categorys'], $with));

        if ($categoryId) {
            $Obj->whereHas('categorys', function ($query) use ($categoryId) {
                $query->where('portal_category.id', $categoryId);
            });
        }

        if ($isPublished) {
            $Obj->where('post_status', 1);
            $Obj->where('published_at', '<', \Carbon\Carbon::now()->timestamp);
        }

        if ($keyWord) {
            $Obj->where('post_title', 'like', "%{$keyWord}%");
        }

        if ($startTimestamp) {
            $Obj->where('published_at', '>=', $startTimestamp);
        }

        if ($endTimestamp) {
            $Obj->where('published_at', '<=', $endTimestamp);
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

    static public function getPost(int $postId, array $with = []): array
    {
        return $Obj = PortalPost::with($with)->findOrFail($postId)->toArray();
    }

    static public function createPost(array $requestData): array
    {
        $validator = \Validator::make($requestData, [
//            'category_id' => 'required',
//            'category_ids' => 'required',
//            'user_id' => 'required',
//            'need_audit' => 'required',
//            'audit_user_id' => 'required',
//            'post_status' => 'required',
//            'comment_status' => 'required',
//            'is_top' => 'required',
//            'post_title' => 'required',
//            'post_excerpt' => 'required',
//            'post_source' => 'required',
//            'published_at' => 'required',
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
                $Obj = new PortalPost();
                $Obj->user_id = $requestData['user_id'] ?? 0;
                $Obj->need_audit = $requestData['need_audit'] ?? 0;
                $Obj->post_status = $requestData['post_status'] ?? 0;
                $Obj->comment_status = $requestData['comment_status'] ?? 0;
                $Obj->is_top = $requestData['is_top'] ?? 0;
                $Obj->post_title = $requestData['post_title'] ?? '';
                $Obj->post_excerpt = $requestData['post_excerpt'] ?? '';
                $Obj->post_source = $requestData['post_source'] ?? '';
                $Obj->post_content = $requestData['post_content'] ?? '';
                $Obj->published_at = $requestData['published_at'] ?? 0;
                $Obj->more = [
                    'thumbnail' => $requestData['more_thumbnail'] ?? null,
                    'photos' => $requestData['more_photos'] ?? null,
                    'videos' => $requestData['more_videos'] ?? null,
                    'files' => $requestData['more_files'] ?? null,
                ];
                $Obj->save();

                if ($Obj->need_audit) {
                    $Obj->audit()->save(new PortalPostAudit(['audit_user_id' => $requestData['audit_user_id'] ?? 0]));
                }

                ($requestData['category_id'] ?? null) && !(array_key_exists('category_ids', $requestData) && count($requestData['category_ids']))
                    ? $requestData['category_ids'] = [$requestData['category_id']]
                    : null;

                if ($requestData['category_ids'] ?? false) {
                    $createMany = [];
                    for ($i = 0; $i < count($requestData['category_ids']); $i++) {
                        $createMany[] = [
                            'category_id' => $requestData['category_ids'][$i],
                            'post_id' => $Obj->id,
                            'created_at' => time(),
                            'updated_at' => time(),
                        ];
                    }
                    PortalCategoryPost::insert($createMany);
                }
            });
        } catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
        }

        return ['success' => (int)($success ?? 1), 'msg' => $msg ?? null];
    }

    static public function updatePost(int $postId, array $requestData): array
    {
        $validator = \Validator::make($requestData, [
//            'category_id' => 'required',
//            'category_ids' => 'required',
//            'user_id' => 'required',
//            'need_audit' => 'required',
//            'post_status' => 'required',
//            'comment_status' => 'required',
//            'is_top' => 'required',
//            'post_title' => 'required',
//            'post_excerpt' => 'required',
//            'post_source' => 'required',
//            'published_at' => 'required',
//            'more_thumbnail' => 'required',
//            'more_photos' => 'required',
//            'more_videos' => 'required',
//            'more_files' => 'required',
        ]);

        try {
            if ($validator->fails()) {
                throw new \Exception($validator->errors()->first());
            }

            DB::transaction(function () use ($postId, $requestData) {
                $Obj = PortalPost::findOrFail($postId);
                $Obj->user_id = $requestData['user_id'] ?? 0;
                $Obj->need_audit = $requestData['need_audit'] ?? 0;
                $Obj->post_status = $requestData['post_status'] ?? 0;
                $Obj->comment_status = $requestData['comment_status'] ?? 0;
                $Obj->is_top = $requestData['is_top'] ?? 0;
                $Obj->post_title = $requestData['post_title'] ?? '';
                $Obj->post_excerpt = $requestData['post_excerpt'] ?? '';
                $Obj->post_source = $requestData['post_source'] ?? '';
                $Obj->post_content = $requestData['post_content'] ?? '';
                $Obj->published_at = $requestData['published_at'] ?? 0;
                $Obj->more = [
                    'thumbnail' => $requestData['more_thumbnail'] ?? null,
                    'photos' => $requestData['more_photos'] ?? null,
                    'videos' => $requestData['more_videos'] ?? null,
                    'files' => $requestData['more_files'] ?? null,
                ];
                $Obj->save();

                if ($Obj->need_audit) {
                    PortalPostAudit::where('post_id', $postId)->delete();

                    $Obj->audit()->save(new PortalPostAudit(['audit_user_id' => $requestData['audit_user_id'] ?? 0]));
                } else {
                    PortalPostAudit::where('post_id', $postId)->delete();
                }

                ($requestData['category_id'] ?? null) && !(array_key_exists('category_ids', $requestData) && count($requestData['category_ids']))
                    ? $requestData['category_ids'] = [$requestData['category_id']]
                    : null;

                if ($requestData['category_ids'] ?? false) {
                    for ($i = 0; $i < count($requestData['category_ids']); $i++) {
                        PortalCategoryPost::updateOrCreate(
                            [
                                'category_id' => $requestData['category_ids'][$i],
                                'post_id' => $Obj->id
                            ]
                        );
                    }

                    PortalCategoryPost
                        ::where('post_id', $Obj->id)
                        ->whereNotIn('category_id', $requestData['category_ids'])
                        ->delete();
                }
            });
        } catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
        }

        return ['success' => (int)($success ?? 1), 'msg' => $msg ?? null];
    }

    static public function deletePost(int $postId): array
    {
        return ['success' => PortalPost::destroy($postId)];
    }

    static public function auditPost(int $postId, int $status, string $reason = '')
    {
        $row = PortalPostAudit::where('post_id', $postId)
            ->where('audit_user_id', User_::getMyId())
            ->firstOrFail();

        if ($row->status !== PortalPostAudit::STATUS['待审核']) {
            $statusNow = array_flip(PortalPostAudit::STATUS)[$row->status];
            throw new \Exception('操作失败，已经审核过了。当前状态为 ' . $statusNow);
        }

        $row->status = $status;
        $row->reason = $reason;

        return ['success' => (int)$row->save()];
    }
}
