<?php

namespace App\Models;

use App\Models\PortalCategory_;

class PortalPost_ extends PortalPost
{
    static public function getPostList(
        int $currPage = 0,
        int $pageNumber = 0,
        array $filter = [
            'category_id' => 0,
            'keyword' => "",
            'start_timestamp' => 0,
            'end_timestamp' => 0
        ],
        array $with = []
    ): array
    {
        $categoryId =& $filter['category_id'];
        $keyWord =& $filter['keyword'];
        $startTimestamp =& $filter['start_timestamp'];
        $endTimestamp =& $filter['end_timestamp'];

        $Obj = PortalPost::with(array_merge(['categorys'], $with));

        if ($categoryId) {
            $Obj->whereHas('categorys', function ($query) use ($categoryId) {
                $query->where('portal_category.id', $categoryId);
            });
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

        if ($currPage && $pageNumber) {
            $offset = ($currPage - 1) * $pageNumber;
            $Obj->offset($offset)->limit($pageNumber);
        }

        $get = $Obj->get();

        return ['total' => $total ?? 0, 'rows' => $get->toArray(),
            'pagination' => ['current' => $currPage, 'page_number' => $pageNumber]
        ];
    }

    static public function getPost(int $postId, array $with = []): array
    {
        return $Obj = PortalPost::with($with)->findOrFail($postId)->toArray();
    }

    static public function createPost(array $requestData): array
    {
        $validator = \Validator::make($requestData, [
            'user_id' => 'required',
            'need_audit' => 'required',
            'post_status' => 'required',
            'comment_status' => 'required',
            'is_top' => 'required',
            'recommended' => 'required',
            'post_title' => 'required',
            'post_excerpt' => 'required',
            'post_source' => 'required',
            'published_at' => 'required',
            'thumbnail' => 'required',
            'photos' => 'required',
            'videos' => 'required',
            'files' => 'required',
        ]);

        try {
            if ($validator->fails()) {
                throw new \Exception($validator->errors()->first());
            }

            $Obj = new PortalPost();
            $Obj->user_id = $requestData['user_id'];
            $Obj->need_audit = $requestData['need_audit'];
            $Obj->post_status = $requestData['post_status'];
            $Obj->comment_status = $requestData['comment_status'];
            $Obj->is_top = $requestData['is_top'];
            $Obj->recommended = $requestData['recommended'];
            $Obj->post_title = $requestData['post_title'];
            $Obj->post_excerpt = $requestData['post_excerpt'];
            $Obj->post_source = $requestData['post_source'];
            $Obj->post_content = $requestData['post_content'];
            $Obj->published_at = $requestData['published_at'];
            $Obj->more['thumbnail'] = $requestData['thumbnail'];
            $Obj->more['photos'] = $requestData['photos'];
            $Obj->more['videos'] = $requestData['videos'];
            $Obj->more['files'] = $requestData['files'];
            $success = $Obj->save();

            $createMany = [];
            for ($i = 0; $i < count($requestData['category_ids']); $i++) {
                $createMany[] = ['category_id' => $requestData['category_ids'][$i], 'post_id' => $Obj->id];
            }
            PortalCategoryPost::create($createMany);
        } catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
        }

        return ['success' => (int)$success ?? 1, 'msg' => $msg ?? null];
    }

    static public function updatePost(int $postId, array $requestData): array
    {
        $validator = \Validator::make($requestData, [
            'user_id' => 'required',
            'need_audit' => 'required',
            'post_status' => 'required',
            'comment_status' => 'required',
            'is_top' => 'required',
            'recommended' => 'required',
            'post_title' => 'required',
            'post_excerpt' => 'required',
            'post_source' => 'required',
            'published_at' => 'required',
            'thumbnail' => 'required',
            'photos' => 'required',
            'videos' => 'required',
            'files' => 'required',
        ]);

        try {
            if ($validator->fails()) {
                throw new \Exception($validator->errors()->first());
            }

            DB::transaction(function () use ($postId, $requestData) {
                $Obj = PortalPost::findOrFail($postId);
//                $Obj->user_id = $requestData['user_id'];
                $Obj->need_audit = $requestData['need_audit'];
                $Obj->post_status = $requestData['post_status'];
                $Obj->comment_status = $requestData['comment_status'];
                $Obj->is_top = $requestData['is_top'];
                $Obj->recommended = $requestData['recommended'];
                $Obj->post_title = $requestData['post_title'];
                $Obj->post_excerpt = $requestData['post_excerpt'];
                $Obj->post_source = $requestData['post_source'];
                $Obj->post_content = $requestData['post_content'];
                $Obj->published_at = $requestData['published_at'];
                $Obj->more['thumbnail'] = $requestData['thumbnail'];
                $Obj->more['photos'] = $requestData['photos'];
                $Obj->more['videos'] = $requestData['videos'];
                $Obj->more['files'] = $requestData['files'];
                $success = $Obj->save();

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
            });
        } catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
        }

        return ['success' => (int)$success ?? 1, 'msg' => $msg ?? null];
    }

    static public function deletePost(int $postId): array
    {
        return ['success' => PortalPost::destroy($postId)];
    }
}
