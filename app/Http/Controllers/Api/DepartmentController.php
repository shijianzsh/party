<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use  App\Models\Department,App\Models\Department_;

class DepartmentController extends \App\Http\Controllers\Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $filter = $request->query('filter') ? json_decode($request->query('filter'),true): [];
        $list = Department_::getDepartmentList(
            $request->input('current_page', 0),
            $request->input('page_size', 0),
            [
                'department_id' => &$filter['department_id'],
                'keyword' => &$filter['keyword'],
                'start_timestamp' => &$filter['start_timestamp'],
                'end_timestamp' => &$filter['end_timestamp'],
            ],
            (array)$request->query('with', [])
        );
        $result = ['success' => 1, 'data' => $list, '$request' => $request->query(), '$filter' => $filter];
        return response()->json($result);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $result = Department_::createDepartment($request->input('data'));
        return response()->json($result);
    }

    /**
     * Display the specified resource.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $list = Department_::getDepartment(
            $id, false, ['parent', 'children']
        );

        $result = ['success' => 1, 'data' => $list];
        return response()->json($result);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $result = Department_::updateDepartment($id, $request->input('data'));
        return response()->json($result);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        return response()->json(Department_::deleteDepartment($id));
    }
}
