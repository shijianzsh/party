<?php
/**
 * Created by PhpStorm.
 * User: lijingbo
 * Date: 2018/10/2
 * Time: 11:34 PM
 */

namespace App\Services\Notification;

use App\Services\Socket\Push;
use App\Services\Sms\Sms;
use App\Models\UserNotification_;

class Pusher
{
    static public function send(int $notification_id): array
    {
        $notification = UserNotification_::getNotification($notification_id, ['user']);

        $is_checked = $notification['is_checked'];
        if ($is_checked) {
            throw new \Exception('发送失败:已读的通知');
        }

        $user_id = $notification['user_id'];
        $related_type = $notification['related_type'];
        $related_type_format = $notification['related_type_format'];
        $related_id = $notification['related_id'];
        $operate_type = $notification['operate_type'];
        $operate_type_format = $notification['operate_type_format'];

        $socket = Push::send('push_notification_to_uid', ['notification_id' => $notification_id], $user_id);

        $name = $notification['user']['name'];
        $phone = $notification['user']['cellphone'];
        $template_code = 'SMS_147202143';
        $data = ['name' => $name, 'operate_type' => $operate_type_format, 'related_type' => $related_type_format];
        $sms = Sms::send($phone, $template_code, $data);

        return ['success' => 1, 'data' => ['socket' => $socket, 'sms' => $sms]];
    }
}
