<?php
/**
 * Created by PhpStorm.
 * User: lijingbo
 * Date: 2018/8/21
 * Time: 下午9:53
 */

namespace App\Services\Login;

use Carbon\Carbon;

class Login
{
    public const salt = "ljb";
    public const length = 16;

    static public function getPassword(string $password): string
    {
        $a = md5(Login::salt . $password);
        $b = md5(Login::salt . $a);
        return substr($b, 0, Login::length);
    }
}
