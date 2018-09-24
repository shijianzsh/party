<?php
/**
 * Created by PhpStorm.
 * User: lijingbo
 * Date: 2018/8/21
 * Time: 下午9:43
 */

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Vote_;

class Vote extends Controller
{
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
}
