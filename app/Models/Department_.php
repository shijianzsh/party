<?php

namespace App\Models;

class Department_ extends Department
{
    static public function getDepartmentList(): array
    {

    }

    static public function getDepartment(int $departmentId): array
    {

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
            $Obj = Department::with(['children', 'users'])->find($departmentId);
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

        return ['success' => $success ?? 1, 'msg' => $msg ?? null];
    }
}
