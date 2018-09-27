<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Models\DepartmentWorkPlan_, App\Models\PortalPost_;

class DepartmentWorkPlanController extends \App\Http\Controllers\Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $filter = $request->query('filter') ? json_decode($request->query('filter'),true): [];
        $list = DepartmentWorkPlan_::getWorkPlanList(
            $request->input('current_page', 0),
            $request->input('page_size', 0),
            [
                'initiate_user_id' => &$filter['initiate_user_id'],
//                'to_user_id' => &$filter['to_user_id'],
            ]
        );

        $result = ['success' => 1, 'data' => $list, '$request' => $request];
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
        $result = DepartmentWorkPlan_::createWorkPlan($request->input('data'));
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
        $list = DepartmentWorkPlan_::getWorkPlan(
            $id, []
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
        $result = DepartmentWorkPlan_::updateWorkPlan($id, $request->input('data'));
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
        return response()->json(DepartmentWorkPlan_::deleteWorkPlan($id));
    }
}
