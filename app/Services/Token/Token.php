<?php
/**
 * Created by PhpStorm.
 * User: lijingbo
 * Date: 2018/8/21
 * Time: 下午9:57
 */

namespace App\Services\Token;

class Token extends TokenBase
{
    public function create(): array
    {
        $encryptToken = $this->encrypt($this->createBaseData());
        return ['success' => 1, 'data' => $encryptToken];
    }

    public function verify(string $token): array
    {
        if (empty($token)) {
            return ['success' => 0, 'msg' => 'Token verify error,code 1'];
        }

        try {
            $data = $this->decrypt($token);
        } catch (\Exception $e) {
            return ['success' => 0, 'msg' => $e->getMessage()];
        }

        if (!array_key_exists('timestamp', $data)) {
            return ['success' => 0, 'msg' => 'Token verify error,code 2'];
        }

        if (!array_key_exists('ip', $data)) {
            return ['success' => 0, 'msg' => 'Token verify error,code 3'];
        }

        if ($this->nowTimestamp - (int)$data['timestamp'] > $this->expirationTimestamp) {
            return ['success' => 0, 'msg' => 'token令牌过期'];
        }

        if ($data['ip'] !== $this->clientIpAddress) {
            return ['success' => 0, 'msg' => 'Token verify ip address error'];
        }

        return ['success' => 1, 'data' => $data];
    }
}
