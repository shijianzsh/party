<?php
/**
 * Created by PhpStorm.
 * User: lijingbo
 * Date: 2018/10/3
 * Time: 11:49 PM
 */

namespace App\Http\Controllers\Web;

use App\Services\SMS\Send;

class Test extends \App\Http\Controllers\Controller
{
    function __invoke()
    {
        $aliSms = new \Mrgoon\AliSms\AliSms();
        $response = $aliSms->sendSms('15598259922',
            'SMS_146809749',
            ['name' => '111', 'count' => '123']
        );
        dump($response);

        return;
        // 建立socket连接到内部推送端口
        $client = stream_socket_client('tcp://inner_http.test', $errno, $errmsg, 1);
// 推送的数据，包含uid字段，表示是给这个uid推送
        $data = array('uid' => 'uid1', 'percent' => '88%');
// 发送数据，注意5678端口是Text协议的端口，Text协议需要在数据末尾加上换行符
        fwrite($client, json_encode($data) . "\n");
// 读取推送结果
        echo fread($client, 8192);
    }
}
