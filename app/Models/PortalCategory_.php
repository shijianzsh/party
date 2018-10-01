<?php

namespace App\Models;

use DB;

class PortalCategory_ extends PortalCategory
{
    static public function getCategoryList(
        int $currentPage = 0,
        int $pageSize = 0,
        array $filter = [
            'parent_id' => null,
            'keyword' => null,
        ],
        array $with = []
    ): array
    {
        $parentId =& $filter['parent_id'];
        $keyword =& $filter['keyword'];

        $Obj = PortalCategory::with($with);

        if (!empty($parentId)) {
            $Obj->where('parent_id', $parentId);
        }

        if (!empty($keyword)) {
            $Obj->where(function ($query) use ($keyword) {
                $query->where('post_title', 'like', "%{$keyword}%")
                    ->orWhere('post_excerpt', 'like', "%{$keyword}%")
                    ->orWhere('post_source', 'like', "%{$keyword}%")
                    ->orWhere('post_content', 'like', "%{$keyword}%");
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

        return ['rows' => $get->toArray(), 'pagination' => ['current' => $currentPage, 'pageSize' => $pageSize, 'total' => $total ?? 0]];
    }

    static public function getCategory(int $categoryId, bool $getObject = false, array $with = [])
    {
        $Obj = PortalCategory::with($with);
        $get = $Obj->findOrFail($categoryId);

        return $getObject ? $get : $get->toArray();
    }

    static public function getCategoryChildrenAndPublishedArticleList(int $categoryId): array
    {
        try {
            $data = self::getCategory($categoryId, false, ['children' => function ($query) {
                $query->with(['posts' => function ($query) {
                    $query->where('post_status', 1);
                    $query->where('published_at', '<', \Carbon\Carbon::now()->timestamp);
                    $query->orderBy('published_at', 'desc');//根据发布日期排序
                    $query->orderBy('is_top', 'desc');//根据是否置顶排序
                    $query->where(function ($query) {//审核约束
                        $query
                            ->where('need_audit', 0)//不需要审核
                            ->orWhere(function ($query) {//需要审核同时通过审核
                                $query
                                    ->where('need_audit', 1)
                                    ->whereHas('audit', function ($query) {
                                        $query->where('portal_post_audit.status', PortalPostAudit::STATUS['通过']);
                                    });
                            });
                    });
                }]);
            }]);
        } catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
        }

        return ['success' => (int)($success ?? 1), 'msg' => $msg ?? null, 'data' => $data ?? null];

    }

    static public function createCategory(array $requestData): array
    {
        $validator = \Validator::make($requestData, [
            'parent_id' => '',
            'sort_order' => '',
            'name' => 'required',
            'description' => '',
            'list_template' => '',
            'article_template' => '',
            'thumbnail' => '',
        ]);

        try {
            if ($validator->fails()) {
                throw new \Exception($validator->errors()->first());
            }

            $Obj = new PortalCategory();
            $Obj->parent_id = $requestData['parent_id'] ?? 0;
            $Obj->sort_order = $requestData['sort_order'] ?? 10000;
            $Obj->name = $requestData['name'];
            $Obj->description = $requestData['description'] ?? '';
            $Obj->list_template = $requestData['list_template'] ?? '';
            $Obj->article_template = $requestData['article_template'] ?? '';
            $Obj->path = null;
            $Obj->more = ['thumbnail' => $requestData['thumbnail'] ?? ''];
            $success = $Obj->save();

        } catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
        }

        return ['success' => (int)($success ?? 1), 'msg' => $msg ?? null, '$requestData' => $requestData ?? null];
    }

    static public function updateCategory(int $categoryId, array $requestData): array
    {
        $validator = \Validator::make($requestData, [
            'parent_id' => '',
            'sort_order' => '',
            'name' => 'required',
            'description' => '',
            'list_template' => '',
            'article_template' => '',
            'thumbnail' => '',
        ]);

        try {
            if ($validator->fails()) {
                throw new \Exception($validator->errors()->first());
            }

            $Obj = PortalCategory::findOrFail($categoryId);
            $Obj->parent_id = $requestData['parent_id'] ?? 0;
            $Obj->sort_order = $requestData['sort_order'] ?? 10000;
            $Obj->name = $requestData['name'];
            $Obj->description = $requestData['description'] ?? '';
            $Obj->list_template = $requestData['list_template'] ?? '';
            $Obj->article_template = $requestData['article_template'] ?? '';
            $Obj->path = null;
            $Obj->more = ['thumbnail' => $requestData['thumbnail'] ?? ''];
            $success = $Obj->save();
        } catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
        }

        return ['success' => (int)($success ?? 1), 'msg' => $msg ?? null];
    }

    static public function deleteCategory(int $categoryId): array
    {
        $Obj = PortalCategory::with(['posts', 'children'])->findOrFail($categoryId);
        if (!$Obj) {
            $result = ['success' => 0, 'msg' => '栏目不存在'];
            goto end;
        }

        if (count($Obj->posts)) {
            $result = ['success' => 0, 'msg' => '栏目中有关联的文章，禁止删除'];
            goto end;
        }

        if (count($Obj->children)) {
            $result = ['success' => 0, 'msg' => '有关联的子栏目，禁止删除'];
            goto end;
        }

        $result = ['success' => (int)$Obj->delete()];

        end:
        return $result;
    }
}
