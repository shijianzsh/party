<?php
/**
 * Created by PhpStorm.
 * User: lijingbo
 * Date: 2018/10/3
 * Time: 10:25 AM
 */

namespace App\Services\Socket;


class Helper
{
    static public function setUid(&$connection, int $uid)
    {
        $connection->uid = $uid;
        $connection->real_ip = $_SERVER['HTTP_X_REAL_IP'];
    }

    static public function getUid(&$connection): int
    {
        if (!isset($connection->uid)) {
            return 0;
        }

        return (int)$connection->uid;
    }

    static public function getUids(&$worker): array
    {
        $uids = [];
        foreach ($worker->connections as $connection) {
            if (isset($connection->uid) && $connection->uid) {
                $uids[] = $connection->uid;
            }
        }
        return $uids;
    }

    static public function getOnlineUsers(&$worker): array
    {
        $users = [];
        foreach ($worker->connections as $connection) {
            if (isset($connection->uid) && $connection->uid) {
                $users[] = ['id' => $connection->uid, 'ip' => $connection->real_ip];
            }
        }
        return $users;
    }

    static public function send(&$connection, $data): bool
    {
        $result = ['success' => 1, 'data' => $data];
        $connection->send(json_encode($result));
        return true;
    }

    static public function sendToUid(&$worker, int $uid, $msg): bool
    {
        $isSend = false;
        foreach ($worker->connections as $connection) {
            if (isset($connection->uid) && (int)$connection->uid === $uid) {
                self::sendToClient($connection, $msg);
                $isSend = true;
            }
        }
        return $isSend;
    }
}
