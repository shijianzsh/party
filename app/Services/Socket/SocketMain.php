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

        $temp = 0;
        $main_worker->onWorkerStart = function($worker)
        {
            // 开启一个内部端口，方便内部系统推送数据，Text协议格式 文本+换行符
            $inner_text_worker = new Worker(env('SOCKET_INNER_HTTP_HOST'));
            $inner_text_worker->onMessage = function($connection, $buffer)
            {
                // $data数组格式，里面有uid，表示向那个uid的页面推送数据
                $data = json_decode($buffer, true);
                $uid = $data['uid'];
                // 通过workerman，向uid的页面推送数据
                $ret = sendMessageByUid($uid, $buffer);
                // 返回推送结果
                $connection->send($ret ? 'ok' : 'fail');
            };
            // ## 执行监听 ##
            $inner_text_worker->listen();
        };

        $main_worker->onMessage = function ($connection, $data) use (&$main_worker) {
            if (!is_json($data)) {
                $connection->send('请求参数错误');
            }

            $res = json_decode($data, true);

            switch ($res['key']) {
                case 'set_uid':
                    Helper::setUid($connection, $res['value']);
                    Helper::sendToAdmin($main_worker, ['push_uids' => Helper::getUids($main_worker)]);
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
