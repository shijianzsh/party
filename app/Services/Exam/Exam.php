<?php
/**
 * Created by PhpStorm.
 * User: lijingbo
 * Date: 2018/8/24
 * Time: 下午11:59
 */

namespace App\Services\Exam;

class Exam
{
    static public function isSameAnswers(array $a, array $b): bool
    {
        if (count($a) !== count($b)) {
            return false;
        }

        for ($i = 0; $i < count($a); $i++) {
            if (!in_array($a[$i], $b)) {
                return false;
            }
        }

        return true;
    }
}
