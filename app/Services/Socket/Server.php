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
use App\Services\Socket\Helper\SocketHelper;

class Server
{
    static public function run()
    {
        define('HEARTBEAT_TIME', 55);

        $main_worker = new Worker(env('SOCKET_HOST'));

        // 启动1个进程对外提供服务
        $main_worker->count = 1;

        $main_worker->onWorkerStart = function ($worker) {
            MainWorker::onWorkerStart($worker);
        };

        $main_worker->onMessage = function ($connection, $data) use (&$main_worker) {
            MainWorker::onMessage($connection, $data, $main_worker);
        };

        // 当有客户端连接断开时
        $main_worker->onClose = function ($connection) use (&$main_worker) {
            MainWorker::onClose($connection, $main_worker);
        };
        // 运行worker
        Worker::runAll();
    }
}
