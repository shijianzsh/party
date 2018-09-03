<?php

namespace App\Models;

class Department_ extends Department
{
    static public function getDepartmentList(
        int $currPage = 0,
        int $pageNumber = 0,
        array $filter = [
            '' => "",
        ],
        array $with = []
    ): array
    {
        $Obj = Department::with($with);

        $total = $Obj->count();

        if ($currPage && $pageNumber) {
            $offset = ($currPage - 1) * $pageNumber;
            $Obj->offset($offset)->limit($pageNumber);
        }

        $get = $Obj->get();

        return ['total' => $total ?? 0, 'rows' => $get->toArray(), 'pagination' => ['current' => $currPage, 'page_number' => $pageNumber]];
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

    static public function updateDepartment(int $departmentId): array
    {

    }

    static public function deleteDepartment(int $departmentId): array
    {
        try {
            $Obj = Department::with(['children', 'users'])->findOrFail($departmentId);
            if (!$Obj) {
                throw new \Exception('deleteDepartment Obj null error');
            }

            if ($Obj->children) {
                throw new \Exception('拥有子级单位，无法删除！');
            }

            if ($Obj->users) {
                throw new \Exception('拥有用户，无法删除！');
            }

            $Obj->delete();
        } catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
        }

        return ['success' => (int)$success ?? 1, 'msg' => $msg ?? null];
    }
}
