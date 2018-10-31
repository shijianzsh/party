<?php
/**
 * Created by PhpStorm.
 * User: lijingbo
 * Date: 2018/10/5
 * Time: 4:57 PM
 */

namespace App\Services\Socket;

class Push
{
    private const KEY_MAP = [
        'push_notification_to_uid',
        'push_to_uid',
        'push_to_all',
        'push_to_admin',
    ];

    /**
     * 服务端发消息到socket服务器
     */
    static public function send(string $sendKey, $sendValue, int $uid = null)
    {
        try {
            if (!in_array($sendKey, self::KEY_MAP)) {
                throw new \Exception('Socket send key error');
            }

            $client = stream_socket_client(
                env('SOCKET_INNER_TCP_HOST'),
                $errno, $errmsg, 3);

            $sendData = ['key' => $sendKey, 'value' => $sendValue, 'uid' => $uid];
            // 发送数据，Text协议的端口，Text协议需要在数据末尾加上换行符
            fwrite($client, json_encode($sendData) . "\n");
            // 读取推送结果
            $result = fread($client, 8192);

            if (!is_json($result)) {
                throw new \Exception($result);
            }

            $result = json_decode($result, true);

            $success =& $result['success'];
            $msg =& $result['msg'];
            $data =& $result['data'];

        } catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
        }

        return [
            'success' => (int)($success ?? 1),
            'msg' => !$success ? ($msg ? $msg : '发送失败') : null,
            'data' => $data ?? null
        ];

    }
}
