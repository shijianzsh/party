<?php
/**
 * Created by PhpStorm.
 * User: lijingbo
 * Date: 2018/8/21
 * Time: 下午9:43
 */

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Services\Token\Token as TokenModel, App\Services\Token\AccessToken as AccessTokenModel;
use App\Models\User_;

class User extends Controller
{
    public function login(Request $request)
    {
        $Obj = new User_();
        return $Obj->getAccessToken(
            $request->input('token'),
            $request->input('account'),
            $request->input('password')
        );
    }
}
