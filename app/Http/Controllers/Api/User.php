<?php
/**
 * Created by PhpStorm.
 * User: lijingbo
 * Date: 2018/8/21
 * Time: 下午9:43
 */

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Services\Token\Token as TokenModel, App\Services\Token\AccessToken as AccessTokenModel;
use App\Models\User_;
use App\Models\Department_;

class User extends \App\Http\Controllers\Controller
{
    public function getDepartmentUserList(Request $request, $department_id)
    {
        $filter = $request->query('filter') ? json_decode($request->query('filter'), true) : [];

        $descendant_id =& $filter['department_id'];

        $isDescendant = !empty($descendant_id)
            ? Department_::isDescendant((int)$descendant_id, (int)$department_id)
            : null;

        if ($isDescendant === false) {
            return response()->json(['success' => 0, 'msg' => '无法查看无关联党支部的党员信息']);
        }

        $list = User_::getDepartmentUserList(
            $request->input('current_page', 0),
            $request->input('page_size', 0),
            [
                'ids' => &$filter['ids'],
                'department_id' => $department_id,
                'descendant_id' => $descendant_id,
                'keyword' => &$filter['keyword'],
                'start_timestamp' => &$filter['start_timestamp'],
                'end_timestamp' => &$filter['end_timestamp'],
            ],
            []
        );

        $result = ['success' => 1, 'data' => $list];
        return response()->json($result);
    }

    public function getDepartmentTransferUserList(Request $request, $department_id)
    {
        $filter = $request->query('filter') ? json_decode($request->query('filter'), true) : [];

        $list = User_::getDepartmentTransferUserList(
            $request->input('current_page', 0),
            $request->input('page_size', 0),
            [
                'department_id' => $department_id,
                'keyword' => &$filter['keyword'],
                'start_timestamp' => &$filter['start_timestamp'],
                'end_timestamp' => &$filter['end_timestamp'],
            ],
            []
        );

        $result = ['success' => 1, 'data' => $list];
        return response()->json($result);
    }

    public function getDepartmentReceiveUserList(Request $request, $department_id)
    {
        $filter = $request->query('filter') ? json_decode($request->query('filter'), true) : [];

        $list = User_::getDepartmentReceiveUserList(
            $request->input('current_page', 0),
            $request->input('page_size', 0),
            [
                'department_id' => $department_id,
                'keyword' => &$filter['keyword'],
                'start_timestamp' => &$filter['start_timestamp'],
                'end_timestamp' => &$filter['end_timestamp'],
            ],
            []
        );

        $result = ['success' => 1, 'data' => $list];
        return response()->json($result);
    }

    public function getCommunication(Request $request, $id)
    {
        $filter = $request->query('filter') ? json_decode($request->query('filter'), true) : [];
        $filter = array_merge($filter, ['user_id'=> $id]);
        return response()->json(User_::getCommunication($filter));
    }

    public function login(Request $request)
    {
        return User_::getAccessToken(
            $request->input('token', ''),
            $request->input()
        );
    }

    public function getUserWithPartyInfo($id)
    {
        $result = ['success' => 1, 'data' => User_::getUserWithPartyInfo($id)];
        return response()->json($result);
    }

    public function getUserThumbnail($id)
    {
        $result = ['success' => 1, 'data' => User_::getUserThumbnail($id)];
        return response()->json($result);
    }

    public function changePassword(Request $request, $id)
    {
        $result = User_::changePassword($id, $request->input('data'));
        return response()->json($result);
    }

    /**
     * 用户更改个人信息单个字段内容
     *
     * @param  \Illuminate\Http\Request $request
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function updateOneField(Request $request, $id)
    {
        return response()->json(User_::editUser($id, $request->input('data')));
    }
}
