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
use App\Models\AuthMap_;

class Test extends \App\Http\Controllers\Controller
{
    function __invoke()
    {
        $a = new \App\Services\Exam\Excel();
        $a->justReadFile();
    }
}
