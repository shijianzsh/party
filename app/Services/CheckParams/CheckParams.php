<?php
/**
 * Created by PhpStorm.
 * User: lijingbo
 * Date: 2018/8/22
 * Time: 上午11:05
 */

namespace App\Services\CheckParams;

trait CheckParams
{
    static public function checkParams(array $data, array $keys): array
    {
        $isSuccess = 1;
        $missingKeys = [];

        for ($i = 0; $i < count($keys); $i++) {
            foreach ($data as $key => $value) {
                if ($keys[$i] == $key) {
                    continue 2;
                }
            }

            $isSuccess = 0;
            $missingKeys[] = $keys[$i];
        }

        return ['success' => $isSuccess, 'msg' => implode(",", $missingKeys)];
    }
}
