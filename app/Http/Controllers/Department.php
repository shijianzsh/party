<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Department_;

class Department extends Controller
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
                'department_id',$id
            ],
            $request->query('with', []) ? $request->query('with', []) : []
        );
        $result = ['success' => 1, 'data' => $list, '$request' => $request->query()];
        return response()->json($result);
    }
}
