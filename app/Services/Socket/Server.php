<?php
/**
 * Created by PhpStorm.
 * User: lijingbo
 * Date: 2018/10/3
 * Time: 10:26 AM
 */

namespace App\Services\Socket;

use Workerman\Worker;
use Workerman\Lib\Timer;

class Server
{
    static public function run()
    {
        define('HEARTBEAT_TIME', 55);

        $main_worker = new Worker(env('SOCKET_HOST'));

        // 启动1个进程对外提供服务
        $main_worker->count = 1;

        $main_worker->onWorkerStart = function ($worker) {
            // 开启一个内部端口，方便内部系统推送数据，Text协议格式 文本+换行符
            $inner_text_worker = new Worker(env('SOCKET_INNER_TCP_HOST'));
            $inner_text_worker->count = 1;
            $inner_text_worker->onMessage = function ($connection, $buffer) use (&$worker) {

                $res = json_decode($buffer, true);
                $resKey =& $res['key'];
                $resValue =& $res['value'];
                $uid =& $res['uid'];

                switch ($resKey) {
                    case 'push_to_uid':
                        $success = (int)Helper::sendToUid($worker, $uid, ['push_to_uid' => $resValue]);
                        break;
                    case 'push_to_all':
                        $success = (int)Helper::sendToAll($worker, ['push_to_all' => $resValue]);
                        break;
                    case 'push_to_admin':
                        $success = (int)Helper::sendToAdmin($worker, ['push_to_admin' => $resValue]);
                        break;
                    default:
                        $success = 0;
                        break;
                }

                $result = ['success' => $success ?? 1];
                $connection->send(json_encode($result));
            };
            // ## 执行监听 ##
            $inner_text_worker->listen();
        };

        $main_worker->onMessage = function ($connection, $data) use (&$main_worker) {
            if (!is_json($data)) {
                $connection->send('请求参数错误');
            }

            $res = json_decode($data, true);
            $resKey =& $res['key'];
            switch ($resKey) {
                case 'set_uid':
                    Helper::setUid($main_worker,$connection, $res['value']);
                    Helper::sendToAdmin($main_worker, ['push_uids' => Helper::getUids($main_worker)]);
                    Helper::send($connection, ['set_uid' => true]);
                    break;
                case 'get_uids':
                    Helper::send($connection, ['get_uids' => Helper::getUids($main_worker)]);
                    break;
            }
        };

        // 当有客户端连接断开时
        $main_worker->onClose = function ($connection) use (&$main_worker) {
            if (isset($connection->uid)) {
                Helper::sendToAdmin($main_worker, ['push_uids' => Helper::getUids($main_worker)]);
                $connection->uid = 0;
            }
        };
        // 运行worker
        Worker::runAll();
    }
}
