<?php
/**
 * Created by PhpStorm.
 * User: lijingbo
 * Date: 2018/11/1
 * Time: 12:34 AM
 */

namespace App\Services\Socket;

use Workerman\Worker;
use Workerman\Lib\Timer;
use App\Services\Socket\Helper\SocketHelper;

class InnerWorker
{
    static public function run(&$main_worker)
    {
        // 开启一个内部端口，方便内部系统推送数据，Text协议格式 文本+换行符
        $inner_text_worker = new Worker(env('SOCKET_INNER_TCP_HOST'));
        $inner_text_worker->count = 1;
        $inner_text_worker->onMessage = function ($connection, $buffer) use (&$main_worker) {
            self::onMessage($connection, $buffer, $main_worker);
        };
        //执行监听
        $inner_text_worker->listen();
    }

    static private function onMessage(&$connection, $buffer, &$main_worker)
    {
        $res = json_decode($buffer, true);
        $resKey =& $res['key'];
        $resValue =& $res['value'];
        $uid =& $res['uid'];

        try {
            switch ($resKey) {
                case 'push_to_uid':
                    $success = (int)SocketHelper::sendToUid($main_worker, $uid, ['push_to_uid' => $resValue]);
                    break;
                case 'push_to_all':
                    $success = (int)SocketHelper::sendToAll($main_worker, ['push_to_all' => $resValue]);
                    break;
                case 'push_to_admin':
                    $success = (int)SocketHelper::sendToAdmin($main_worker, ['push_to_admin' => $resValue]);
                    break;
                default:
                    $success = (int)SocketHelper::sendToUid($main_worker, $uid, [$resKey => $resValue]);
                    break;
            }
        } catch (\Exception $e) {
            $msg = $e->getMessage();
        }

        $result = ['success' => $success ?? 1, 'msg' => $msg ?? null];
        $connection->send(json_encode($result));
    }
}
