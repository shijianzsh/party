<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Models\Meeting_, App\Models\PortalPost_;

class Meeting extends \App\Http\Controllers\Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function departmentMeetingList(Request $request)
    {
        try {
            $filter = $request->query('filter') ? json_decode($request->query('filter'), true) : [];
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

            $result = ['success' => 1, 'data' => $list];
            return response()->json($result);
        } catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
            $result = ['success' => (int)($success ?? 1), 'msg' => $msg ?? null];
            return response()->json($result);
        }
    }

    public function attendUserMeetingList(Request $request)
    {
        try {
            $filter = $request->query('filter') ? json_decode($request->query('filter'), true) : [];
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

            $result = ['success' => 1, 'data' => $list];
            return response()->json($result);
        } catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
            return ['success' => (int)($success ?? 1), 'msg' => $msg ?? null];
        }
    }

    public function auditUserMeetingList(Request $request)
    {
        try {
            $filter = $request->query('filter') ? json_decode($request->query('filter'), true) : [];
            $list = Meeting_::getAuditUserMeetingList(
                $request->input('current_page', 0),
                $request->input('page_size', 0),
                [
                    'initiate_user_id' => &$filter['initiate_user_id'],
                    'keyword' => &$filter['keyword'],
                    'audit_user_id' => &$filter['audit_user_id'],//required
                ]
            );

            $result = ['success' => 1, 'data' => $list];
            return response()->json($result);
        } catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
            return ['success' => (int)($success ?? 1), 'msg' => $msg ?? null];
        }
    }

    public function signIn(Request $request, $id)
    {
        $result = Meeting_::signIn($id, $request->input('user_id'));
        return response()->json($result);
    }

    public function audit(Request $request, $id)
    {
        $result = Meeting_::auditMeeting($id,
            $request->input('status'),
            $request->input('reason'));
        return response()->json($result);
    }

    public function arrangeAndSendPush(Request $request, $id)
    {
        $result = Meeting_::arrangeMeetingAndSendPush($id,
            $request->input('status'),
            $request->input('reason'));
        return response()->json($result);
    }
}
