<?php
/**
 * Created by PhpStorm.
 * User: lijingbo
 * Date: 2018/8/21
 * Time: 下午4:48
 */

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Models\UploadFileLog_;

class Upload extends \App\Http\Controllers\Controller
{
    public function __invoke(Request $request)
    {
        return UploadFileLog_::create();
    }
}
