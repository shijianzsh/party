<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use  App\Models\ExamUserResult_;
use Illuminate\Support\Facades\Crypt;
use Gate;

class ExamResult extends \App\Http\Controllers\Controller
{
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
