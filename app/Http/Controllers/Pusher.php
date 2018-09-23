<?php
/**
 * Created by PhpStorm.
 * User: lijingbo
 * Date: 2018/8/21
 * Time: 下午9:43
 */

namespace App\Http\Controllers;

use Cache;

class Pusher extends Controller
{
    public function __invoke()
    {
        Cache::put('bar', 'baz', 10);
        return $value = Cache::get('bar');
    }
}
