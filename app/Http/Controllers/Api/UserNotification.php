<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use  App\Models\UserNotification_;
use Illuminate\Support\Facades\Crypt;
use Gate, Cache;

class UserNotification extends \App\Http\Controllers\Controller
{
    /**
     * Display BadgeCount.
     *
     * @param  int $user_id
     * @return \Illuminate\Http\Response
     */
    public function getUserUnreadNotificationBadgeCount($user_id)
    {
        $result = UserNotification_::getUserUnreadNotificationBadgeCount($user_id);
        return response()->json($result);
    }

}
