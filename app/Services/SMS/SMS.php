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
    static public function send(int $phoneNumber, string $template, array $data)
    {
        $aliSms = new \Mrgoon\AliSms\AliSms();
        $response = $aliSms->sendSms($phoneNumber, $template, $data);

//        $response = $aliSms->sendSms('15598259922',
//            'SMS_146809749',
//            ['name' => '111', 'count' => '123']
//        );

        $success = $response->Code === 'OK' ? 1 : 0;
        return ['success' => (int)($success ?? 1), 'msg' => $response->Message, 'data' => $response];
    }
}
