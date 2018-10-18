<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use  App\Models\ExamUserResult_;
use Illuminate\Support\Facades\Crypt;
use Gate;

class ExamResultController extends \App\Http\Controllers\Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $filter = $request->query('filter') ? json_decode($request->query('filter'),true): [];
        $list = ExamUserResult_::getExamUserResultList(
            $request->input('current_page', 0),
            $request->input('page_size', 0),
            [
                'user_id' => &$filter['user_id'],
                'start_timestamp' => &$filter['start_timestamp'],
                'end_timestamp' => &$filter['end_timestamp'],
            ],
            ['user', 'paper']
        );

        $result = ['success' => 1, 'data' => $list, '$request' => $request->query(), '$filter' => $filter];
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
        $row = ExamUserResult_::getExamUserResult($id);

        $result = ['success' => 1, 'data' => $row];
        return response()->json($result);
    }
}
