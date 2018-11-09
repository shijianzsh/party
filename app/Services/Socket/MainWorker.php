<?php
/**
 * Created by PhpStorm.
 * User: lijingbo
 * Date: 2018/11/1
 * Time: 12:33 AM
 */

namespace App\Services\Socket;

use Workerman\Worker;
use Workerman\Lib\Timer;
use App\Services\Socket\Helper\SocketHelper;

class MainWorker
{
    public const ON_MESSAGE_REQUEST_KEY_EVENT = [
        '后台管理' => 'admin',
        '通知' => 'notification',
        '聊天' => 'chat',
        '学习' => 'learning',
    ];
    public const ON_MESSAGE_REQUEST_KEY_MAP = [
        '心跳' => 'beep',
        '注册' => 'register',
        '获取uids' => 'get_uids',
        '获取users' => 'get_online_users',
        '发送消息' => 'chat_send_message_to_user',
        '聊天设置session' => 'chat_set_session_uid',
        '学习计时' => 'learning_record',
    ];

    //start钩子处创建text协议 接受服务器发送的消息
    static public function onWorkerStart(&$main_worker)
    {
        InnerWorker::run($main_worker);
    }

    //socket进程收到消息
    static public function onMessage(&$connection, $data, &$main_worker)
    {
        if (!is_json($data)) {
            $connection->send('请求参数错误');
            return;
        }

        $res = json_decode($data, true);
        $event =& $res['event'];
        $requestKey =& $res['key'];
        $requestValue =& $res['value'];

        $Helper = SocketHelper::init($main_worker, $connection);

        try {
            if (!in_array($event, self::ON_MESSAGE_REQUEST_KEY_EVENT))
                throw new \Exception('socket request event error:' . $event);

            if (!in_array($requestKey, self::ON_MESSAGE_REQUEST_KEY_MAP))
                throw new \Exception('socket request key error:' . $requestKey);

            switch ($requestKey) {
                case self::ON_MESSAGE_REQUEST_KEY_MAP['心跳']:
                    $Helper->send(['key' => self::ON_MESSAGE_REQUEST_KEY_MAP['心跳']]);
                    break;
                case self::ON_MESSAGE_REQUEST_KEY_MAP['注册']:
                    $Helper->register($event, $requestValue)->send(['key' => self::ON_MESSAGE_REQUEST_KEY_MAP['注册']]);
                    break;
                case self::ON_MESSAGE_REQUEST_KEY_MAP['获取uids']:
                    $Helper->uids()->send();
                    break;
                case self::ON_MESSAGE_REQUEST_KEY_MAP['获取users']:
                    $Helper->uids()->send();
                    break;
            }

            switch ($event) {
                case self::ON_MESSAGE_REQUEST_KEY_EVENT['聊天']:
                    switch ($requestKey) {
                        case self::ON_MESSAGE_REQUEST_KEY_MAP['注册']:
                            $Helper->chatFeedbackOnlineUsersStatus($requestValue);
                            $Helper->chatBroadcastUserOnline($requestValue);
                            break;
                        case self::ON_MESSAGE_REQUEST_KEY_MAP['发送消息']:
                            $Helper->chatSendMessage($requestValue);
                            break;
                        case self::ON_MESSAGE_REQUEST_KEY_MAP['聊天设置session']:
                            $Helper->chatSetSession($requestValue);
                            break;
                    }
                    break;
                case self::ON_MESSAGE_REQUEST_KEY_EVENT['学习']:
                    switch ($requestKey) {
//                        case self::ON_MESSAGE_REQUEST_KEY_MAP['注册']:
//                            $Helper->learningRegister($requestValue);
//                            break;
                        case self::ON_MESSAGE_REQUEST_KEY_MAP['学习计时']:
                            $Helper->learningRecord($requestValue);
                            break;
                    }
                    break;
                case self::ON_MESSAGE_REQUEST_KEY_EVENT['通知']:

                    break;
                default:

                    break;
            }

        } catch (\Exception $e) {
            $Helper->send(null, 0, $e->getMessage());
        }
    }

    //有人下线时
    static public function onClose(&$connection, &$main_worker)
    {
        $Helper = SocketHelper::init($main_worker, $connection);

        if (isset($connection->uid) && !empty($connection->uid)) {
            $uid = $connection->uid;
            $event = $connection->event;

            switch ($event) {
                case self::ON_MESSAGE_REQUEST_KEY_EVENT['聊天']:
                    $Helper->chatBroadcastUserOffline($uid);
                    break;
            }

//            SocketHelper::sendToAll($main_worker, ['uid_offline' => $connection->uid]);
//            SocketHelper::sendToAdmin($main_worker, ['push_uids' => SocketHelper::getUids($main_worker)]);
            $connection->event = 0;
            $connection->uid = 0;
        }
    }
}
