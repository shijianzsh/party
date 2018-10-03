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

class SocketMain
{
    static public function run()
    {
        $main_worker = new Worker(env('SOCKET_HOST'));

        // 启动1个进程对外提供服务
        $main_worker->count = 1;

        $main_worker->onMessage = function ($connection, $data) use (&$main_worker) {
            if (!is_json($data)) {
                $connection->send('请求参数错误');
            }

            $res = json_decode($data, true);

            switch ($res['key']) {
                case 'uid':
                    Helper::setUid($connection, $res['value']);
                    Helper::send($connection, ['uid' => $connection->uid]);
                    break;
                case 'get_status':
                    $uids = Helper::getUids($main_worker);
                    Helper::send($connection, $uids);
                    break;
            }
        };

        // 当有客户端连接断开时
        $main_worker->onClose = function ($connection) use (&$main_worker) {
            if (isset($connection->uid)) {
                $connection->uid = 0;
            }
        };
        // 运行worker
        Worker::runAll();
    }
}
