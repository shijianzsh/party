<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Cache;
use App\Services\Socket\Server;
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
    protected $signature = 'workerman {action} {--daemonize}';
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

        Server::run();
    }
}
