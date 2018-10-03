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

class User extends \App\Http\Controllers\Controller
{
    public function login(Request $request)
    {
        $Obj = new User_();
        return $Obj->getAccessToken(
            $request->input('token', ''),
            $request->input()
        );
    }

    public function getUserWithPartyInfo($id)
    {
        $result = ['success' => 1, 'data' => User_::getUserWithPartyInfo($id)];
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
