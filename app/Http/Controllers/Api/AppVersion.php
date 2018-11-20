<?php
/**
 * Created by PhpStorm.
 * User: lijingbo
 * Date: 2018/8/21
 * Time: 下午9:43
 */

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Models\AppVersion_;

class AppVersion extends \App\Http\Controllers\Controller
{
    public function getLatestVersion($type)
    {
        $result = AppVersion_::getLatestVersion($type);
        return response()->json($result);
    }
}
