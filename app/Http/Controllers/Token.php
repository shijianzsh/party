<?php
/**
 * Created by PhpStorm.
 * User: lijingbo
 * Date: 2018/8/21
 * Time: 下午9:43
 */

namespace App\Http\Controllers;

use App\Services\Token\Token as TokenModel;

class Token extends Controller
{
    public function __invoke()
    {
        $Obj = new TokenModel();
        return $Obj->create();
    }
}
