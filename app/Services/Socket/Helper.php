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
        $connection->real_ip = array_key_exists('HTTP_X_REAL_IP', $_SERVER) ? $_SERVER['HTTP_X_REAL_IP'] : null;
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

    static public function sendToUid(&$worker, int $uid, $data): bool
    {
        $isSend = false;
        foreach ($worker->connections as $connection) {
            if (isset($connection->uid) && (int)$connection->uid === $uid) {
                self::send($connection, $data);
                $isSend = true;
            }
        }
        return $isSend;
    }

    static public function sendToAdmin(&$worker, $data): bool
    {
        $uid = 1;
        $isSend = false;
        foreach ($worker->connections as $connection) {
            if (isset($connection->uid) && (int)$connection->uid === $uid) {
                self::send($connection, $data);
                $isSend = true;
            }
        }
        return $isSend;
    }
}
