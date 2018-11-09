<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use  App\Models\UserLearningRecord_;
use Illuminate\Support\Facades\Crypt;
use Gate, Cache;

class UserLearningRecordController extends \App\Http\Controllers\Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {

        $filter = $request->query('filter') ? json_decode($request->query('filter'), true) : [];
        $list = UserLearningRecord_::getLearningRecordList(
            $request->input('current_page', 0),
            $request->input('page_size', 0),
            [
                'user_id' => &$filter['user_id'],
                'start_timestamp' => &$filter['start_timestamp'],
                'end_timestamp' => &$filter['end_timestamp'],
            ],
            (array)$request->query('with', [])
        );

        $result = ['success' => 1, 'data' => $list, '$request' => $request, '$filter' => $filter];
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
        $result = UserLearningRecord_::recordLearningRecord(0, $request->input('data'));
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
        $list = UserLearningRecord_::getLearningRecord($id);

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
        $result = UserLearningRecord_::recordLearningRecord($id, $request->input('data'));
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
        return response()->json(UserLearningRecord_::deleteLearningRecord($id));
    }
}
