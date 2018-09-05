<?php

namespace App\Models;

class Department_ extends Department
{
    static public function getDepartmentList(
        int $currentPage = 0,
        int $pageSize = 0,
        array $filter = [
            '' => "",
        ],
        array $with = []
    ): array
    {
        $Obj = Department::with($with);

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

    static public function createDepartment(): array
    {

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
}
