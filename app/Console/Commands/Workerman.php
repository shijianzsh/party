<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Workerman\Worker;
use Workerman\Lib\Timer;

class Workerman extends Command
{
    /**
     *  前端添加代码
     *  var ws = new WebSocket('ws://websocket_server:port');
     * ws.onopen = function(){
     * var uid = 'xxxx';
     * ws.send(uid);
     * };
     * ws.onmessage = function(e){
     * alert(e.data);
     * };
     */
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'workerman:server {action} {--daemonize}';
    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'start workerman';

    public function handle()
    {
        global $argv;
        $action = $this->argument('action');
        if (!in_array($action, ['start', 'stop'])) {
            $this->error('Error Arguments');
            exit;
        }
        $argv[0] = 'workerman:server';
        $argv[1] = $action;
        $argv[2] = '';

        $http_worker = new Worker("websocket://0.0.0.0:2345");

// 启动4个进程对外提供服务
        $http_worker->count = 1;

// 接收到浏览器发送的数据时回复hello world给浏览器
        $http_worker->onMessage = function ($connection, $data) {
            // 向浏览器发送hello world
            while (true) {
                sleep(1);
                $connection->send('hello world111');
            }
        };

// 运行worker
        Worker::runAll();
    }
}
