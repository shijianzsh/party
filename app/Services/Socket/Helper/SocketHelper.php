<?php
/**
 * Created by PhpStorm.
 * User: lijingbo
 * Date: 2018/10/3
 * Time: 10:25 AM
 */

namespace App\Services\Socket\Helper;

class SocketHelper
{
    private $worker = null;
    private $connection = null;

    use FlashData, ChatUser, Learning;

    public function __construct(&$worker, &$connection)
    {
        $this->worker = $worker;
        $this->connection = $connection;

        if (!$this->worker || !$this->connection) throw new \Exception('SocketHelper init error');
    }

    //静态初始化方法
    static public function init(&$worker, &$connection)
    {
        return new self($worker, $connection);
    }

    //在connection中注册
    public function register(string $event, int $uid): self
    {
        if (!$uid || !$event) throw new \Exception('socket register params null error');

        foreach ($this->worker->connections as $connection) {
            $_uid = $connection->uid ?? null;
            $_event = $connection->event ?? null;

            if ($_uid === $uid && $_event === $event) {
                $connection->uid = 0;
                $connection->event = null;
            }
        }

        $this->connection->uid = $uid;
        $this->connection->event = $event;
        $this->connection->real_ip = array_key_exists('HTTP_X_REAL_IP', $_SERVER) ? $_SERVER['HTTP_X_REAL_IP'] : null;

        return $this;
    }

    //获取connection中的event
    public function event(): self
    {
        $this->setFlash(isset($this->connection->event) ? $this->connection->event : null);
        return $this;
    }

    //获取connection中的uid
    public function uid(): self
    {
        $this->setFlash(isset($this->connection->uid) ? (int)$this->connection->uid : 0);
        return $this;
    }

    //获取在线的所有uids
    public function uids(): self
    {
        $uids = [];
        foreach ($this->worker->connections as $connection) {
            $_uid = $connection->uid ?? null;
            $_event = $connection->event ?? null;

            if ($_uid) {
                $uids[] = $_uid;
            }
        }

        $this->setFlash(array_unique($uids));
        return $this;
    }

    //获取在线的所有user的id、uid、events和对应ip
    public function onlineUsers(): self
    {
        $temp = [];
        $id2ip = [];

        foreach ($this->worker->connections as $connection) {
            $_uid = $connection->uid ?? null;
            $_event = $connection->event ?? null;

            if ($_uid && $_event) {
                if (!array_key_exists($_uid, $temp)) {
                    $temp[$_uid] = [];
                }
                $temp[$_uid][] = $_event;
                $id2ip[$_uid] = $connection->real_ip;
            }
        }

        $result = [];
        foreach ($temp as $uid => $events) {
            $result[] = [
                'id' => $uid,
                'uid' => $uid,
                'events' => $events,
                'ip' => $id2ip[$uid],
            ];
        }

        $this->setFlash($result);
        return $this;
    }

    //结束方法 给一个connection发送数据
    public function send($data = null, $success = 1, $msg = null): self
    {
        try {
            $sendData = ($this->getFlash() && empty($data))
                ? $this->getFlash()
                : (!empty($data) ? $data : null);
        } catch (\Exception $e) {
            $msg = $e->getMessage();
        }

        $result = [
            'success' => $success,
            'msg' => $msg,
            'data' => $sendData ?? null,
            'event' => $this->event()->get(),
        ];
        $this->connection->send(json_encode($result));

        return $this;
    }

    //结束方法 给指定uid发送数据
    public function sendToEventUid(string $event, $uid, $data = null): self
    {
        //广播
        if (empty($uid)) {
            foreach ($this->worker->connections as $connection) {
                $_event = $connection->event ?? null;

                if ($_event === $event) {
                    $result = [
                        'success' => 1,
                        'msg' => null,
                        'data' => $data,
                        'event' => $event,
                    ];
                    $connection->send(json_encode($result));
                }
            }

            return $this;
        }

        //发送给特定uid
        if (is_numeric($uid)) {
            $isSend = false;
            foreach ($this->worker->connections as $connection) {
                $_uid = $connection->uid ?? null;
                $_event = $connection->event ?? null;

                if ($_uid === $uid && $_event === $event) {
                    $result = [
                        'success' => 1,
                        'msg' => null,
                        'data' => $data,
                        'event' => $event,
                    ];
                    $connection->send(json_encode($result));
                    $isSend = true;
                }
            }

//            if (!$isSend) throw new \Exception('send error');
            return $this;
        }

        //发送给多个uid
        if (is_array($uid)) {
            foreach ($this->worker->connections as $connection) {
                $_uid = $connection->uid ?? null;
                $_event = $connection->event ?? null;

                if (in_array($_uid, $uid) && $_event === $event) {
                    $result = [
                        'success' => 1,
                        'msg' => null,
                        'data' => $data,
                        'event' => $event,
                    ];
                    $connection->send(json_encode($result));
                }
            }
            return $this;
        }

        throw new \Exception('sendToEventUid uid error');
    }

    //结束方法 给admin发送数据
    public function sendToEventAdmin($event, $data = null): self
    {
        $adminUid = 1;
        return $this->sendToEventUid($event, $adminUid, $data);
    }

    //结束方法 获取数据
    public function get()
    {
        $flash = $this->getFlash();
        if ($flash === null) throw new \Exception('SocketHelper get flashData error');
        $this->clearFlash();
        return $flash;
    }
}
