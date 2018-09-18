<?php

namespace App\Models;

use DB;

class Department_ extends Department
{
    static public function getDepartmentList(
        int $currentPage = 0,
        int $pageSize = 0,
        array $filter = [
            'keyword' =>null,
        ],
        array $with = []
    ): array
    {
        $Obj = Department::with($with);

        $keyword =& $filter['keyword'];

        if ($keyword !== null) {
            $Obj->where(function ($query) use ($keyword) {
                $query
                    ->where('name', 'like', "%{$keyword}%")
                    ->orWhere('location', 'like', "%{$keyword}%")
                    ->orWhere('secretary', 'like', "%{$keyword}%");
            });
        }

        $total = $Obj->count();

        if ($currentPage) {
            $pageSize = !$pageSize ? Department::PAGE_SIZE : $pageSize;
        } else {
            $pageSize = 0;
        }
        if ($currentPage && $pageSize) {
            $offset = ($currentPage - 1) * $pageSize;
            $Obj->offset($offset)->limit($pageSize);
        }

        $get = $Obj->get();

        return [
            'rows' => $get->toArray(),
            'pagination' => ['current' => $currentPage, 'pageSize' => $pageSize, 'total' => $total ?? 0]
        ];
    }

    static public function getDepartmentDepartmentList(
        int $currentPage = 0,
        int $pageSize = 0,
        array $filter = [
            'department_id' => null,
            'keyword' => null,
        ],
        array $with = []
    ): array
    {
        $Obj = Department::with($with);

        $departmentId =& $filter['department_id'];
        $keyword =& $filter['keyword'];

        if ($departmentId !== null) {
            $Obj->where('path', 'like', "%-{$departmentId}-%");
        }

        if ($keyword !== null) {
            $Obj->where(function ($query) use ($keyword) {
                $query
                    ->where('name', 'like', "%{$keyword}%")
                    ->orWhere('location', 'like', "%{$keyword}%")
                    ->orWhere('secretary', 'like', "%{$keyword}%");
            });
        }

        $total = $Obj->count();

        if ($currentPage) {
            $pageSize = !$pageSize ? Department::PAGE_SIZE : $pageSize;
        } else {
            $pageSize = 0;
        }
        if ($currentPage && $pageSize) {
            $offset = ($currentPage - 1) * $pageSize;
            $Obj->offset($offset)->limit($pageSize);
        }

        $get = $Obj->get();

        return [
            'rows' => $get->toArray(),
            'pagination' => ['current' => $currentPage, 'pageSize' => $pageSize, 'total' => $total ?? 0]
        ];
    }

    static public function getDepartment(int $departmentId, bool $getObject = false)
    {
        $Obj = Department::with([])->findOrFail($departmentId);

        if ($getObject) {
            $result = $Obj;
        } else {
            $result = $Obj->toArray();
        }

        return $result;
    }

    static public function createDepartment(array $requestData): array
    {
        $validator = \Validator::make($requestData, [
            'parent_id' => '',
            'name' => 'required',
            'introduce' => '',
            'location' => '',
            'coordinate' => '',
            'telphone' => '',
            'cellphone' => '',
            'secretary' => '',
            'established_at' => '',
            'thumbnail' => '',
        ]);

        try {
            if ($validator->fails()) {
                throw new \Exception($validator->errors()->first());
            }

            $Obj = new Department();
            $Obj->parent_id = $requestData['parent_id'] ?? 0;
            $Obj->name = $requestData['name'];
            $Obj->introduce = $requestData['introduce'] ?? '';
            $Obj->location = $requestData['location'] ?? '';
            $Obj->coordinate = $requestData['coordinate'] ?? '';
            $Obj->telphone = $requestData['telphone'] ?? '';
            $Obj->cellphone = $requestData['cellphone'] ?? '';
            $Obj->secretary = $requestData['secretary'] ?? '';
            $Obj->established_at = $requestData['established_at'] ?? '';
            $Obj->path = null;
            $Obj->more = ['thumbnail' => $requestData['thumbnail'] ?? ''];
            $success = $Obj->save();
        } catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
        }

        return ['success' => (int)($success ?? 1), 'msg' => $msg ?? null];
    }

    static public function updateDepartment(int $departmentId, array $requestData): array
    {
        $validator = \Validator::make($requestData, [
            'parent_id' => '',
            'name' => 'required',
            'introduce' => '',
            'location' => '',
            'coordinate' => '',
            'telphone' => '',
            'cellphone' => '',
            'secretary' => '',
            'established_at' => '',
            'thumbnail' => '',
        ]);

        try {
            if ($validator->fails()) {
                throw new \Exception($validator->errors()->first());
            }

            $Obj = Department::findOrFail($departmentId);
            $Obj->parent_id = $requestData['parent_id'] ?? 0;
            $Obj->name = $requestData['name'];
            $Obj->introduce = $requestData['introduce'] ?? '';
            $Obj->location = $requestData['location'] ?? '';
            $Obj->coordinate = $requestData['coordinate'] ?? '';
            $Obj->telphone = $requestData['telphone'] ?? '';
            $Obj->cellphone = $requestData['cellphone'] ?? '';
            $Obj->secretary = $requestData['secretary'] ?? '';
            $Obj->established_at = $requestData['established_at'] ?? '';
            $Obj->path = null;
            $Obj->more = ['thumbnail' => $requestData['thumbnail'] ?? ''];
            $success = $Obj->save();
        } catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
        }

        return ['success' => (int)($success ?? 1), 'msg' => $msg ?? null];
    }

    static public function deleteDepartment(int $departmentId): array
    {
        try {
            $Obj = Department::with(['children', 'users'])->findOrFail($departmentId);
            if (!$Obj) {
                throw new \Exception('deleteDepartment Obj null error');
            }

            if (count($Obj->children)) {
                throw new \Exception('拥有子级单位，无法删除！');
            }

            if (count($Obj->users)) {
                throw new \Exception('拥有用户，无法删除！');
            }

            $Obj->delete();
        } catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
        }

        return ['success' => (int)($success ?? 1), 'msg' => $msg ?? null];
    }

    //获取所有后裔department
    static public function getEscendants(int $departmentIds, array $with = []): array
    {
        $array = Department
            ::with($with)
            ->where('parent_id', '<>', 0)
            ->get()
            ->toArray();

        $ids = [$departmentIds];
        $result = [];
        $isChanged = true;

        while ($isChanged) {
            $isChanged = false;
            for ($i = 0; $i < count($array); $i++) {
                if (in_array($array[$i]['parent_id'], $ids)) {
                    $ids[] = $array[$i]['id'];
                    $result[] = $array[$i];
                    $array[$i] = null;
                    $isChanged = true;
                }
            }
            $array = array_values($array);
        }
        unset($array);

        return ['rows' => $result, 'ids' => array_unique($ids)];
    }
}
