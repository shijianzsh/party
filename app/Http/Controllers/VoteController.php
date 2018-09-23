<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Vote_;

class VoteController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $filter = $request->query('filter') ? json_decode($request->query('filter'),true): [];
        $list = Vote_::getVoteList(
            $request->input('current_page', 0),
            $request->input('page_size', 0),
            [
                'initiate_user_id' =>&$filter['initiate_user_id'],
                'keyword' => &$filter['keyword'],
                'start_timestamp' => &$filter['start_timestamp'],
                'end_timestamp' =>&$filter['end_timestamp'],
            ]
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
        $result = Vote_::createVote($request->input('data'));
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
        $list = Vote_::getVote($id);

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
        $result = Vote_::updateVote($id, $request->input('data'));
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
        return response()->json(Vote_::deleteVote($id));
    }
}
