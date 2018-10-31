<?php
/**
 * Created by PhpStorm.
 * User: lijingbo
 * Date: 2018/11/1
 * Time: 2:30 AM
 */

namespace App\Services\Socket\Chat;

use App\Services\Socket\Helper\RequestHelper;

class UserChat
{
    static public function check(int $fromUserId, int $toUserId)
    {
        return RequestHelper::get("api/chat_user_messages/{$fromUserId}/{$toUserId}/check");
    }

    static public function create(int $fromUserId, int $toUserId, int $type, string $message)
    {
        return RequestHelper::post("api/chat_user_messages/{$fromUserId}/{$toUserId}/create", ['type' => $type, 'message' => $message]);
    }
}
