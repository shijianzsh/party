<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Meeting_, App\Models\PortalPost_;

class Meeting extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function department(Request $request)
    {
        $filter = json_decode($request->query('filter') ? $request->query('filter') : [], true);
        $list = Meeting_::getDepartmentMeetingList(
            $request->input('current_page', 0),
            $request->input('page_size', 0),
            [
                'initiate_user_id' => &$filter['initiate_user_id'],
                'need_audit' => &$filter['need_audit'],
                'keyword' => &$filter['keyword'],
                'department_id' => &$filter['department_id'],//required
            ]
        );

        $result = ['success' => 1, 'data' => $list, '$request' => $request];
        return response()->json($result);
    }

    public function attendUser(Request $request)
    {
        $filter = json_decode($request->query('filter') ? $request->query('filter') : [], true);
        $list = Meeting_::getAttendUserMeetingList(
            $request->input('current_page', 0),
            $request->input('page_size', 0),
            [
                'initiate_user_id' => &$filter['initiate_user_id'],
                'need_audit' => &$filter['need_audit'],
                'keyword' => &$filter['keyword'],
                'attend_user_id' => &$filter['attend_user_id'],//required
            ]
        );

        $result = ['success' => 1, 'data' => $list, '$request' => $request];
        return response()->json($result);
    }

    public function auditUser(Request $request)
    {
        $filter = json_decode($request->query('filter') ? $request->query('filter') : [], true);
        $list = Meeting_::getAuditUserMeetingList(
            $request->input('current_page', 0),
            $request->input('page_size', 0),
            [
                'initiate_user_id' => &$filter['initiate_user_id'],
                'keyword' => &$filter['keyword'],
                'audit_user_id' => &$filter['audit_user_id'],//required
            ]
        );

        $result = ['success' => 1, 'data' => $list, '$request' => $request];
        return response()->json($result);
    }
}
