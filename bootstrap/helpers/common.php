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

function is_str_chinese(string $str): bool
{
    //新疆等少数民族可能有·
    $str = str_replace("·", '', $str);
    if (preg_match('/^[\x7f-\xff]+$/', $str)) {
        return true;//全是中文
    } else {
        return false;//不全是中文
    }
}

function get_first_charter(string $str): string
{
    if (empty($str)) throw new Exception('get_first_charter param empty error');
    if (is_numeric($str)) return '#';

    $fchar = ord($str{0});

    if ($fchar >= ord('A') && $fchar <= ord('z'))
        return strtoupper($str{0});

    $s1 = iconv('UTF-8', 'gb2312', $str);

    $s2 = iconv('gb2312', 'UTF-8', $s1);

    $s = $s2 == $str ? $s1 : $str;

    $asc = ord($s{0}) * 256 + ord($s{1}) - 65536;

    if ($asc >= -20319 && $asc <= -20284)
        return 'A';

    if ($asc >= -20283 && $asc <= -19776)
        return 'B';

    if ($asc >= -19775 && $asc <= -19219)
        return 'C';

    if ($asc >= -19218 && $asc <= -18711)
        return 'D';

    if ($asc >= -18710 && $asc <= -18527)
        return 'E';

    if ($asc >= -18526 && $asc <= -18240)
        return 'F';

    if ($asc >= -18239 && $asc <= -17923)
        return 'G';

    if ($asc >= -17922 && $asc <= -17418)
        return 'H';

    if ($asc >= -17417 && $asc <= -16475)
        return 'J';

    if ($asc >= -16474 && $asc <= -16213)
        return 'K';

    if ($asc >= -16212 && $asc <= -15641)
        return 'L';

    if ($asc >= -15640 && $asc <= -15166)
        return 'M';

    if ($asc >= -15165 && $asc <= -14923)
        return 'N';

    if ($asc >= -14922 && $asc <= -14915)
        return 'O';

    if ($asc >= -14914 && $asc <= -14631)
        return 'P';

    if ($asc >= -14630 && $asc <= -14150)
        return 'Q';

    if ($asc >= -14149 && $asc <= -14091)
        return 'R';

    if ($asc >= -14090 && $asc <= -13319)
        return 'S';

    if ($asc >= -13318 && $asc <= -12839)
        return 'T';

    if ($asc >= -12838 && $asc <= -12557)
        return 'W';

    if ($asc >= -12556 && $asc <= -11848)
        return 'X';

    if ($asc >= -11847 && $asc <= -11056)
        return 'Y';

    if ($asc >= -11055 && $asc <= -10247)
        return 'Z';

    return '#';
}
