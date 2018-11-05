<?php
/**
 * Created by PhpStorm.
 * User: lijingbo
 * Date: 2018/10/3
 * Time: 11:49 PM
 */

namespace App\Http\Controllers\Api;

use App\Services\SMS\SMS;
use App\Services\Socket\Push;

class Test extends \App\Http\Controllers\Controller
{
    function __invoke()
    {
        $r = Push::send('push_notification_to_uid', [1, 21, 3], 2);
    }
}
