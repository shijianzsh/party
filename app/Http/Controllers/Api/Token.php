<?php
/**
 * Created by PhpStorm.
 * User: lijingbo
 * Date: 2018/8/21
 * Time: 下午9:43
 */

namespace App\Http\Controllers\Api;

use App\Services\Token\Token as TokenModel;

class Token extends \App\Http\Controllers\Controller
{
    public function __invoke()
    {
        $Obj = new TokenModel();
        return $Obj->create();
    }
}
