<?php
/**
 * Created by PhpStorm.
 * User: lijingbo
 * Date: 2018/10/3
 * Time: 11:49 PM
 */

namespace App\Http\Controllers\Web;

use App\Services\SMS\Send;
use App\Services\Socket\Chat\ChatUser;

class Test extends \App\Http\Controllers\Controller
{
    function __invoke()
    {
        $a = ChatUser::check(1, 2);
    }
}
