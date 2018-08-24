<?php
/**
 * Created by PhpStorm.
 * User: lijingbo
 * Date: 2018/8/21
 * Time: 下午4:48
 */

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Services\Upload\Upload as UploadService;
use App\Models\UploadFileLog_;

class Upload extends Controller
{
    public function __invoke(Request $request)
    {
        $url = UploadService::handleUpload();
        $createLog = UploadFileLog_::create($url);
        return ['success' => $createLog, 'data' => $url];
    }
}
