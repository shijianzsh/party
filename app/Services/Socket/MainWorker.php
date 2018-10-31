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
        $resKey =& $res['key'];
        switch ($resKey) {
            case 'set_uid':
                SocketHelper::setUid($main_worker, $connection, $res['value']);
                SocketHelper::sendToAdmin($main_worker, ['push_uids' => SocketHelper::getUids($main_worker)]);
                SocketHelper::send($connection, ['set_uid' => true]);
                break;
            case 'get_uids':
                SocketHelper::send($connection, ['get_uids' => SocketHelper::getUids($main_worker)]);
                break;
        }
    }

    //有人下线时
    static public function onClose(&$connection, &$main_worker)
    {
        if (isset($connection->uid)) {
            SocketHelper::sendToAll($main_worker, ['uid_offline' => $connection->uid]);
            SocketHelper::sendToAdmin($main_worker, ['push_uids' => SocketHelper::getUids($main_worker)]);
            $connection->uid = 0;
        }
    }
}
