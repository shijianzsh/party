<?php
/**
 * Created by PhpStorm.
 * User: lijingbo
 * Date: 2018/11/1
 * Time: 2:30 AM
 */

namespace App\Services\Socket\Helper;

use App\Services\Socket\MainWorker;

trait ChatUser
{
    private $SEND_KEY_MAP = [
        '新消息' => 'chat_new_message',
        '发送回执' => 'chat_send_feedback',
        '有人上线' => 'chat_user_get_online',
        '有人下线' => 'chat_user_get_offline',
        '在线用户情况' => 'chat_online_users_status',
    ];

    private function check(int $fromUserId, int $toUserId)
    {
        return RequestHelper::get("api/chat_user_messages/{$fromUserId}/{$toUserId}/check");
    }

    private function create(int $fromUserId, int $toUserId, int $messageType, string $message)
    {
        return RequestHelper::post("api/chat_user_messages/{$fromUserId}/{$toUserId}/create", ['type' => $messageType, 'message' => $message]);
    }

    public function sendChatMessage(array $data = ['from_user_id' => null, 'to_user_id' => null, 'type' => null, 'message' => null])
    {
        //获取参数
        $fromUserId = $this->uid()->get();
        $toUserId = $data['to_user_id'];
        $messageType = $data['type'];
        $message = $data['message'];

        if (!$fromUserId) throw new \Exception('sendMessage $fromUserId null error');

        //消息写入数据库
        $createRequest = self::create($fromUserId, $toUserId, $messageType, $message);

        if (!$createRequest['success']) throw new \Exception('sendToUserMessage create request error:' . $createRequest['msg']);

        //消息发送给接收者
        $sendDataToReceiver = [
            'key' => $this->SEND_KEY_MAP['新消息'],
            'from_user_id' => $fromUserId,
            'to_user_id' => $toUserId,
            'type' => $messageType,
            'message' => $message,
            'created_at' => $createRequest['data']['created_at'],
            'updated_at' => $createRequest['data']['updated_at'],
        ];
        $this->sendToEventUid(MainWorker::ON_MESSAGE_REQUEST_KEY_EVENT['聊天'], $toUserId, $sendDataToReceiver);

        //发送结果发送给发送者
        $sendDataToSender = [
            'key' => $this->SEND_KEY_MAP['发送回执'],
            'from_user_id' => $fromUserId,
            'to_user_id' => $toUserId,
            'type' => $messageType,
            'message' => $message,
            'created_at' => $createRequest['data']['created_at'],
            'updated_at' => $createRequest['data']['updated_at'],
            'send_success' => 1,
        ];

        $this->sendToEventUid(MainWorker::ON_MESSAGE_REQUEST_KEY_EVENT['聊天'], $fromUserId, $sendDataToSender);
    }

    public function broadcastUserOnline($uid)
    {
        $sendData = [
            'key' => $this->SEND_KEY_MAP['有人上线'],
            'user_id' => $uid,
        ];
        $this->sendToEventUid(MainWorker::ON_MESSAGE_REQUEST_KEY_EVENT['聊天'], null, $sendData);
    }

    public function broadcastUserOffline($uid)
    {
        $sendData = [
            'key' => $this->SEND_KEY_MAP['有人下线'],
            'user_id' => $uid,
        ];
        $this->sendToEventUid(MainWorker::ON_MESSAGE_REQUEST_KEY_EVENT['聊天'], null, $sendData);

    }

    public function feedbackOnlineUsersStatus($uid){
        $uids=$this->uids()->get();

        $sendData = [
            'key' => $this->SEND_KEY_MAP['在线用户情况'],
            'uids' => $uids,
        ];
        $this->sendToEventUid(MainWorker::ON_MESSAGE_REQUEST_KEY_EVENT['聊天'], $uid, $sendData);
    }
}
