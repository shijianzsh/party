<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use  App\Models\ExamPaper_;
use Illuminate\Support\Facades\Crypt;
use Gate;

class ExamPaper extends Controller
{
    public function userList(Request $request)
    {
        $list = ExamPaper_::getUserExamPaperList(
            $request->input('user_id', 0)
        );

        $result = ['success' => 1, 'data' => $list, '$request' => $request->query()];
        return response()->json($result);
    }
}
