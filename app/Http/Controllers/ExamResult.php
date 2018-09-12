<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use  App\Models\ExamUserResult_;
use Illuminate\Support\Facades\Crypt;
use Gate;

class ExamResult extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function start(Request $request, $paperId)
    {
        $filter = json_decode($request->query('filter') ? $request->query('filter') : [], true);
        $list = ExamUserResult_::getCommentList(
            $request->input('current_page', 0),
            $request->input('page_size', 0),
            [
                'user_id' => &$filter['user_id'],
                'to_user_id' => &$filter['to_user_id'],
            ]
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
    public function submit(Request $request,$id)
    {
        $result = ExamUserResult_::createComment($request->input('data'));
        return response()->json($result);
    }
}
