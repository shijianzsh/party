<?php
/**
 * Created by PhpStorm.
 * User: lijingbo
 * Date: 2018/10/3
 * Time: 10:13 AM
 */

namespace App\Services\Sms;


class Sms
{
    static public function send(int $phoneNumber, string $template_code, array $data)
    {
        $aliSms = new \Mrgoon\AliSms\AliSms();
        $response = $aliSms->sendSms($phoneNumber, $template_code, $data);

        $success = $response->Code === 'OK' ? 1 : 0;
        return ['success' => (int)($success ?? 1), 'msg' => $response->Message, 'data' => $response];
    }
}
