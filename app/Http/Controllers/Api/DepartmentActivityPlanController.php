<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Models\DepartmentActivityPlan_, App\Models\PortalPost_;

class DepartmentActivityPlanController extends \App\Http\Controllers\Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $filter = $request->query('filter') ? json_decode($request->query('filter'),true): [];
        $list = DepartmentActivityPlan_::getActivityPlanList(
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
        $result = DepartmentActivityPlan_::createActivityPlan($request->input('data'));
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
        $list = DepartmentActivityPlan_::getActivityPlan(
            $id,  []
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
        $result = DepartmentActivityPlan_::updateActivityPlan($id,$request->input('data'));
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
        return response()->json(DepartmentActivityPlan_::deleteActivityPlan($id));
    }
}
