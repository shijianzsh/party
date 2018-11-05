<?php
/**
 * Created by PhpStorm.
 * User: lijingbo
 * Date: 2018/9/28
 * Time: 12:32 AM
 */

/**
 * 判断传入参数是否为标准json格式字符串
 *
 * @param  $something
 * @return boolean
 */
function is_json($something)
{
    try {
        $decode = json_decode($something, true);
        if (is_array($decode)) {
            return true;
        } else {
            return false;
        }
    } catch (Exception $e) {
        return false;
    }
}

function rand_str($length = 8, $char = '123456789ABCDEFGHIJKLMNPQRSTUVWXYZ')
{
    if (!is_int($length) || $length < 0) {
        return false;
    }

    $string = '';
    for ($i = $length; $i > 0; $i--) {
        $string .= $char[mt_rand(0, strlen($char) - 1)];
    }

    return $string;
}
