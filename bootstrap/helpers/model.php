<?php
/**
 * Created by PhpStorm.
 * User: lijingbo
 * Date: 2018/10/9
 * Time: 12:39 AM
 */

function createNotification(array $data)
{
    if (!array_key_exists('user_id', $data)) {
        throw new Exception('helper createNotification param error 1');
    }
    if (!array_key_exists('related_type', $data)) {
        throw new Exception('helper createNotification param error 2');
    }
    if (!array_key_exists('related_id', $data)) {
        throw new Exception('helper createNotification param error 3');
    }
    if (!array_key_exists('operate_type', $data)) {
        throw new Exception('helper createNotification param error 4');
    }
    if (!array_key_exists('is_send_sms', $data)) {
        $data['is_send_sms'] = 1;
    }

    $user_id = $data['user_id'];

    if (empty($user_id)) {
        return false;
    }

    if (is_numeric($user_id)) {
        $result = \App\Models\UserNotification_::createNotification($data);
        return $result;
    }

    if (is_array($user_id)) {
        for ($i = 0; $i < count($user_id); $i++) {
            $dataCopy = $data;
            $dataCopy['user_id'] = $user_id[$i];
            $result = \App\Models\UserNotification_::createNotification($dataCopy);
        }
        return $result;
    }

    throw new Exception('helper createNotification flow error');
}
