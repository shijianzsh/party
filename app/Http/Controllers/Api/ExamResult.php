<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use  App\Models\ExamUserResult_;
use Illuminate\Support\Facades\Crypt;
use Gate;

class ExamResult extends \App\Http\Controllers\Controller
{
    public function getSubmittedList(Request $request, $user_id)
    {
        $filter = $request->query('filter') ? json_decode($request->query('filter'), true) : [];
        $list = ExamUserResult_::getExamUserSubmittedResultList(
            $request->input('current_page', 0),
            $request->input('page_size', 0),
            [
                'user_id' => $user_id,
                'start_timestamp' => &$filter['start_timestamp'],
                'end_timestamp' => &$filter['end_timestamp'],
            ],
            ['user', 'paper']
        );

        $result = ['success' => 1, 'data' => $list, '$request' => $request->query(), '$filter' => $filter];
        return response()->json($result);
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function start(Request $request, $id)
    {
        $filter = $request->query('filter') ? json_decode($request->query('filter'), true) : [];
        $result = ExamUserResult_::startExam($id, $request->input('user_id'));
        return response()->json($result);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function submit(Request $request, $id)
    {
        $result = ExamUserResult_::submitExam($id, $request->input('data'));
        return response()->json($result);
    }
}
