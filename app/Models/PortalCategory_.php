<?php

namespace App\Models;

class PortalCategory_ extends PortalCategory
{
    static public function getCategoryList(
        int $currPage = 0,
        int $pageNumber = 0,
        array $filter = [
            'parent_id' => "",
            'keyword' => "",
        ],
        array $with = []
    ): array
    {
        $parentId =& $filter['parent_id'];
        $keyWord =& $filter['keyword'];

        $Obj = PortalCategory::with($with);

        if ($parentId) {
            $Obj->where('parent_id', $parentId);
        }

        if ($keyWord) {
            $Obj->where('name', 'like', "%{$keyWord}%");
        }

        $total = $Obj->count();

        if ($currPage && $pageNumber) {
            $offset = ($currPage - 1) * $pageNumber;
            $Obj->offset($offset)->limit($pageNumber);
        }

        $get = $Obj->get();

        return ['total' => $total ?? 0, 'rows' => $get->toArray()];
    }

    static public function createCategory(array $requestData): array
    {
        $validator = Validator::make($requestData, [
            'parent_id' => 'required',
            'sort_order' => 'required',
            'name' => 'required',
            'description' => 'required',
            'list_template' => 'required',
            'one_template' => 'required',
            'thumbnail' => 'required',
        ]);

        try {
            if ($validator->fails()) {
                throw new \Exception($validator->errors()->first());
            }

            $Obj = new PortalCategory();
            $Obj->parent_id = $requestData['parent_id'];
            $Obj->sort_order = $requestData['sort_order'];
            $Obj->name = $requestData['name'];
            $Obj->description = $requestData['description'];
            $Obj->list_template = $requestData['list_template'];
            $Obj->one_template = $requestData['one_template'];
            $Obj->more['thumbnail'] = $requestData['thumbnail'];
            $success = $Obj->save();

        } catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
        }

        return ['success' => $success ?? 1, 'msg' => $msg ?? null];
    }

    static public function updateCategory(int $categoryId, array $requestData): array
    {
        $validator = Validator::make($requestData, [
            'parent_id' => 'required',
            'sort_order' => 'required',
            'name' => 'required',
            'description' => 'required',
            'list_template' => 'required',
            'one_template' => 'required',
            'thumbnail' => 'required',
        ]);

        try {
            if ($validator->fails()) {
                throw new \Exception($validator->errors()->first());
            }

            $Obj = PortalCategory::find($categoryId);
            $Obj->parent_id = $requestData['parent_id'];
            $Obj->sort_order = $requestData['sort_order'];
            $Obj->name = $requestData['name'];
            $Obj->description = $requestData['description'];
            $Obj->list_template = $requestData['list_template'];
            $Obj->one_template = $requestData['one_template'];
            $Obj->more['thumbnail'] = $requestData['thumbnail'];
            $success = $Obj->save();

        } catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
        }

        return ['success' => $success ?? 1, 'msg' => $msg ?? null];
    }

    static public function deleteCategory(int $categoryId): array
    {
        $Obj = PortalCategory::with('posts')->find($categoryId);
        if (!$Obj) {
            $result = ['success' => 0, 'msg' => '栏目不存在'];
            goto end;
        }

        if ($Obj->posts) {
            $result = ['success' => 0, 'msg' => '栏目中有关联的文章，禁止删除'];
            goto end;
        }

        $result = ['success' => $Obj->delete()];

        end:
        return $result;
    }
}
