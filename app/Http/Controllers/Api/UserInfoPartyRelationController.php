<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use  App\Models\UserInfoPartyRelation_;
use Illuminate\Support\Facades\Crypt;
use Gate;

class UserInfoPartyRelationController extends \App\Http\Controllers\Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $filter = $request->query('filter') ? json_decode($request->query('filter'),true): [];
        $list = UserInfoPartyRelation_::getUserInfoPartyRelationList(
            $request->input('current_page', 0),
            $request->input('page_size', 0),
            [
                'keyword' => &$filter['keyword'],
            ]
        );

        $result = ['success' => 1, 'data' => $list];
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
        $result = UserInfoPartyRelation_::createUserInfoPartyRelation($request->input('data'));
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
        $row = UserInfoPartyRelation_::getUserInfoPartyRelation($id, []);

        $result = ['success' => 1, 'data' => $row];
        return response()->json($result);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @param  int $id
     */
    public function update(Request $request, $id)
    {
        $result = UserInfoPartyRelation_::updateUserInfoPartyRelation($id, $request->input('data'));
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
        return response()->json(UserInfoPartyRelation_::deleteUserInfoPartyRelation($id));
    }
}
