<?php

namespace App\Models;

class PortalCategory_ extends PortalCategory
{
    static public function getCategoryList(
        int $currPage = 0,
        int $pageNumber = 0,
        array $filter = [
            'parent_id' => null,
            'keyword' => null,
        ],
        array $with = []
    ): array
    {
        $parentId =& $filter['parent_id'];
        $keyWord =& $filter['keyword'];

        $Obj = PortalCategory::with($with);

        if ($parentId !== null) {
            $Obj->where('parent_id', $parentId);
        }

        if ($keyWord !== null) {
            $Obj->where('name', 'like', "%{$keyWord}%");
        }

        $total = $Obj->count();

        if ($currPage && $pageNumber) {
            $offset = ($currPage - 1) * $pageNumber;
            $Obj->offset($offset)->limit($pageNumber);
        }

        $get = $Obj->get();

        return ['total' => $total ?? 0, 'rows' => $get->toArray(), 'pagination' => ['current' => $currPage, 'page_number' => $pageNumber]];
    }

    static public function getCategory(int $categoryId, bool $getObject = false, array $with = [])
    {
        $Obj = PortalCategory::with($with);
        $get = $Obj->findOrFail($categoryId);

        return $getObject ? $get : $get->toArray();
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

        return ['success' => (int)$success ?? 1, 'msg' => $msg ?? null, '$requestData' => $requestData ?? null];
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

        return ['success' => (int)$success ?? 1, 'msg' => $msg ?? null];
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
