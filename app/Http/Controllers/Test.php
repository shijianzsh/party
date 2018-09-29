<?php
/**
 * Created by PhpStorm.
 * User: lijingbo
 * Date: 2018/9/29
 * Time: 9:40 AM
 */

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\AuthMap_;
use App\Services\Auth\Auth;

class Test extends \App\Http\Controllers\Controller
{
    public function index(){
//       $a=AuthMap_::getUserAuth(1);
        $b=Auth::setUserId(1)->verify('post','api/token');
       dump($b);
    }
}
