<?php
/**
 * Created by PhpStorm.
 * ChatMessage: lijingbo
 * Date: 2018/8/21
 * Time: 下午9:43
 */

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Services\Token\Token as TokenModel, App\Services\Token\AccessToken as AccessTokenModel;
use App\Models\ChatUserMessage_;
use App\Models\Department_;

class ChatUserMessage extends \App\Http\Controllers\Controller
{
    public function create(Request $request, $from_user_id, $to_user_id)
    {
        return response()->json(ChatUserMessage_::createMessage($from_user_id, $to_user_id, $request->input()));
    }

    public function check($from_user_id, $to_user_id)
    {
        return response()->json(ChatUserMessage_::markChecked($from_user_id, $to_user_id));
    }
}
