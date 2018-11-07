<?php

namespace App\Models;

use DB;

class Department_ extends Department
{
    static public function getDepartmentList(
        int $currentPage = 0,
        int $pageSize = 0,
        array $filter = [
            'department_id' => null,
            'keyword' => null,
            'start_timestamp' => null,
            'end_timestamp' => null,
        ],
        array $with = []
    ): array
    {
        $departmentId =& $filter['department_id'];
        $keyword =& $filter['keyword'];
        $startTimestamp =& $filter['start_timestamp'];
        $endTimestamp =& $filter['end_timestamp'];

        $Obj = Department::with($with);

        if (!empty($departmentId)) {
            $Obj->where('parent_id', $departmentId);
        }

        if (!empty($keyword)) {
            $Obj->where(function ($query) use ($keyword) {
                $query
                    ->where('name', 'like', "%{$keyword}%")
                    ->orWhere('location', 'like', "%{$keyword}%")
                    ->orWhere('secretary', 'like', "%{$keyword}%");
            });
        }

        if ($startTimestamp) {
            $Obj->where('established_at', '>=', $startTimestamp);
        }

        if ($endTimestamp) {
            $Obj->where('established_at', '<=', $endTimestamp);
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
            'pagination' =>getPagination($currentPage, $pageSize, $total)
        ];
    }

    static public function getDepartmentDepartmentList(
        int $currentPage = 0,
        int $pageSize = 0,
        array $filter = [
            'department_id' => null,
            'keyword' => null,
            'start_timestamp' => null,
            'end_timestamp' => null,
        ],
        array $with = []
    ): array
    {
        $Obj = Department::with($with);

        $departmentId =& $filter['department_id'];
        $keyword =& $filter['keyword'];
        $startTimestamp =& $filter['start_timestamp'];
        $endTimestamp =& $filter['end_timestamp'];

        $Obj->where('path', 'like', "%-{$departmentId}-%");

        if (!empty($keyword)) {
            $Obj->where(function ($query) use ($keyword) {
                $query
                    ->where('name', 'like', "%{$keyword}%")
                    ->orWhere('location', 'like', "%{$keyword}%")
                    ->orWhere('secretary', 'like', "%{$keyword}%");
            });
        }

        if (!empty($startTimestamp)) {
            $Obj->where('established_at', '>=', $startTimestamp);
        }

        if (!empty($endTimestamp)) {
            $Obj->where('established_at', '<=', $endTimestamp);
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
            'pagination' =>getPagination($currentPage, $pageSize, $total)
        ];
    }

    static public function getSelectComponentList(
        array $filter = [
            'department_id' => null,
        ],
        array $with = []
    ): array
    {
        $departmentId =& $filter['department_id'];

        $Obj = Department::with($with);

        if (!empty($departmentId)) {
            $Obj->where('parent_id', $departmentId);
        }

        $get = $Obj->get(['id','parent_id','name','path']);
        return $get->toArray();
    }

    static public function getDepartmentCoordinateList(int $departmentId): array
    {
        $me = self::getDepartment($departmentId);
        $children = self::getDepartmentDepartmentList(0, 0, ['department_id' => $departmentId]);
        $temp = array_merge([$me], $children['rows']);
        $result = [];

        for ($i = 0; $i < count($temp); $i++) {
            $x = $temp[$i]['coordinate_x'];
            $y = $temp[$i]['coordinate_y'];

            if (
                $x > self::COORDINATES_RANGE['x']['max']
                || $x < self::COORDINATES_RANGE['x']['min']
                || $y > self::COORDINATES_RANGE['y']['max']
                || $y < self::COORDINATES_RANGE['y']['min']
            ) {
                continue;
            }

            $result[] = $temp[$i];
        }

        return ['success' => 1, 'data' => $result];
    }

    /**
     * 通过access_token获取当前user关联的department_id
     *
     * @return int
     */
    static public function getMyId(): int
    {
        $userId = User_::getMyId();
        $get = User::findOrFail($userId);
        return $get->department_id;
    }

    static public function getDepartment(int $departmentId, bool $getObject = false, array $with = [])
    {
        $Obj = Department::with($with)->findOrFail($departmentId);

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
            'coordinate_x' => 'required',
            'coordinate_y' => 'required',
            'telphone' => '',
            'cellphone' => '',
            'secretary' => '',
            'established_at' => 'required',
            'more_thumbnail' => 'required',
            'more_monitor_map' => 'required',
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
            $Obj->coordinate_x = $requestData['coordinate_x'] ?? '';
            $Obj->coordinate_y = $requestData['coordinate_y'] ?? '';
            $Obj->telphone = $requestData['telphone'] ?? '';
            $Obj->cellphone = $requestData['cellphone'] ?? '';
            $Obj->secretary = $requestData['secretary'] ?? '';
            $Obj->established_at = $requestData['established_at'] ?? '';
            $Obj->path = null;
            $Obj->more = [
                'thumbnail' => $requestData['more_thumbnail'] ?? '',
                'monitor_map' => $requestData['more_monitor_map'] ?? ''
            ];
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
            'coordinate_x' => '',
            'coordinate_y' => '',
            'telphone' => '',
            'cellphone' => '',
            'secretary' => '',
            'established_at' => '',
            'more_thumbnail' => '',
            'more_monitor_map' => 'required',
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
            $Obj->coordinate_x = $requestData['coordinate_x'] ?? '';
            $Obj->coordinate_y = $requestData['coordinate_y'] ?? '';
            $Obj->telphone = $requestData['telphone'] ?? '';
            $Obj->cellphone = $requestData['cellphone'] ?? '';
            $Obj->secretary = $requestData['secretary'] ?? '';
            $Obj->established_at = $requestData['established_at'] ?? '';
            $Obj->path = null;
            $Obj->more = [
                'thumbnail' => $requestData['more_thumbnail'] ?? '',
                'monitor_map' => $requestData['more_monitor_map'] ?? ''
            ];
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
    static public function getDescendants(int $departmentIds, array $with = []): array
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

    //获取是否为后裔
    static public function isDescendant(int $descendant_id, int $parent_id)
    {
        $descendant_ids = self::getDescendants($parent_id)['ids'];
        return in_array($descendant_id, $descendant_ids);
    }

    static public function getDepartmentMeetingStatistics(int $departmentId): array
    {
        //TODO
        return self::getDepartment($departmentId, true, ['meeting']);
    }
}
