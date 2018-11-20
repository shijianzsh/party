<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Models\Department_;

class Department extends \App\Http\Controllers\Controller
{
    /**
     * 获取当前单位旗下所有单位列表
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function departmentDepartmentList(Request $request, $id)
    {
        $list = Department_::getDepartmentDepartmentList(0, 0,
            [
                'department_id' => $id
            ],
            (array)$request->query('with', [])
        );
        $result = ['success' => 1, 'data' => $list->query()];
        return response()->json($result);
    }

    public function selectComponentList(Request $request)
    {
        $filter = $request->query('filter') ? json_decode($request->query('filter'), true) : [];

        $list = Department_::getSelectComponentList(
            [
                'department_id' => &$filter['department_id']
            ],
            (array)$request->query('with', [])
        );
        $result = ['success' => 1, 'data' => $list];
        return response()->json($result);
    }

    /**
     * 获取当前单位旗下所有单位的坐标信息
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function getDepartmentCoordinateList(Request $request, $id)
    {
        $result = Department_::getDepartmentCoordinateList($id);
        return response()->json($result);
    }
}
