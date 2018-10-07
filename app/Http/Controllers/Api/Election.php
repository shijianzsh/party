<?php
/**
 * Created by PhpStorm.
 * User: lijingbo
 * Date: 2018/8/21
 * Time: 下午9:43
 */

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Models\Election_;

class Election extends \App\Http\Controllers\Controller
{
    public function getPublicizedElection(Request $request, $id)
    {
        $result = Election_::getPublicizedElection($id);
        return response()->json($result);
    }

    public function getAttendElection(Request $request, $id)
    {
        $result = Election_::getAttendElection($id);
        return response()->json($result);
    }

    public function AttendSubmit(Request $request, $id)
    {
        $result = Election_::AttendSubmit($id, $request->input('data'));
        return response()->json($result);
    }

    public function UpdatePublicityContent(Request $request, $id){
        $result = Election_::updateElectionPublicityContent($id, $request->input('data'));
        return response()->json($result);
    }
}
