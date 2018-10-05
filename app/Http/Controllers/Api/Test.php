<?php
/**
 * Created by PhpStorm.
 * User: lijingbo
 * Date: 2018/10/3
 * Time: 11:49 PM
 */

namespace App\Http\Controllers\Api;

use App\Services\SMS\SMS;
use App\Services\Pusher\Socket;

class Test extends \App\Http\Controllers\Controller
{
    function __invoke()
    {
        $r = Socket::send('push_to_uid', [1, 21, 3], 1);
        dump($r);
    }
}
