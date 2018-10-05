<?php
/**
 * Created by PhpStorm.
 * User: lijingbo
 * Date: 2018/10/5
 * Time: 4:48 PM
 */

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Models\User_;
use App\Services\Socket\Push;
use App\Services\Sms\Sms;

class Pusher extends \App\Http\Controllers\Controller
{
    public function socket(Request $request, $user_id, $send_key)
    {
        $result = Push::send($send_key, $request->input('data'), $user_id);
        return response()->json($result);
    }

    public function Sms(Request $request, $user_id)
    {
        $user = User_::getUser($user_id);
        $phoneNumber = $user['cellphone'];
        $result = Sms::send($phoneNumber, $request->input('template'), $request->input('data'));
        return response()->json($result);
    }
}
