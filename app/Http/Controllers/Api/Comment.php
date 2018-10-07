<?php

namespace App\Http\Controllers\Api;

use App\Models\UserComment;
use Illuminate\Http\Request;
use  App\Models\UserComment_;
use Illuminate\Support\Facades\Crypt;
use Gate;

class Comment extends \App\Http\Controllers\Controller
{
    public function auditUserCommentList(Request $request)
    {
        $filter = $request->query('filter') ? json_decode($request->query('filter'),true): [];
        $list = UserComment_::getAuditUserCommentList(
            $request->input('current_page', 0),
            $request->input('page_size', 0),
            [
                'audit_user_id' => &$filter['audit_user_id'],
                'user_id' => &$filter['user_id'],
                'to_user_id' => &$filter['to_user_id'],
            ]
        );

        $result = ['success' => 1, 'data' => $list, '$request' => $request->query(), '$filter' => $filter];
        return response()->json($result);
    }

    public function audit(Request $request, $id)
    {
        $result = UserComment_::auditComment($id,
            $request->input('status'),
            $request->input('reason'));
        return response()->json($result);
    }
}
