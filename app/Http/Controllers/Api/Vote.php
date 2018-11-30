<?php
/**
 * Created by PhpStorm.
 * User: lijingbo
 * Date: 2018/8/21
 * Time: 下午9:43
 */

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Models\Vote_;

class Vote extends \App\Http\Controllers\Controller
{
    public function getVoteAndElectionList(Request $request)
    {
        $filter = $request->query('filter') ? json_decode($request->query('filter'),true): [];
        $list = Vote_::getVoteAndElectionList(
            $request->input('current_page', 0),
            $request->input('page_size', 0),
            [
                'initiate_user_id' =>&$filter['initiate_user_id'],
                'keyword' => &$filter['keyword'],
                'start_timestamp' => &$filter['start_timestamp'],
                'end_timestamp' =>&$filter['end_timestamp'],
            ]
        );

        $result = ['success' => 1, 'data' => $list];
        return response()->json($result);
    }

    public function getPublicizedVote(Request $request, $id)
    {
        $result = Vote_::getPublicizedVote($id);
        return response()->json($result);
    }

    public function getAttendVote(Request $request, $id)
    {
        $result = Vote_::getAttendVote($id);
        return response()->json($result);
    }

    public function AttendSubmit(Request $request, $id)
    {
        $result = Vote_::AttendSubmit($id, $request->input('data'));
        return response()->json($result);
    }

    public function UpdatePublicityContent(Request $request, $id){
        $result = Vote_::updateVotePublicityContent($id, $request->input('data'));
        return response()->json($result);
    }
}
