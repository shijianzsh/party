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
use App\Models\UserActivist_;
use App\Models\Department_;

class Activist extends \App\Http\Controllers\Controller
{
    /**
     * Display the specified resource.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function getActivistByCode($code)
    {
        $result = ['success' => 1, 'data' => UserActivist_::getActivistByCode($code)];
        return response()->json($result);
    }
}
