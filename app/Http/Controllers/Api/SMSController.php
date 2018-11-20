<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use  App\Models\AuthMap_;
use Illuminate\Support\Facades\Crypt;
use Gate, Cache;
use App\Services\SMS\Check;

class SMSController extends \App\Http\Controllers\Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $filter = $request->query('filter') ? json_decode($request->query('filter'), true) : [];

        $list = AuthMap_::getAuthMapList(
            $request->input('current_page', 0),
            $request->input('page_size', 0),
            [
                'keyword' => &$filter['keyword'],
            ]
        );

        $result = ['success' => 1, 'data' => $list];
        return response()->json($result);
    }
}
