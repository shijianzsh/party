<?php
/**
 * Created by PhpStorm.
 * User: lijingbo
 * Date: 2018/8/21
 * Time: 下午9:53
 */

namespace App\Services\Token;

use Illuminate\Support\Facades\Crypt;
use Carbon\Carbon;

class TokenBase
{
    private $baseData;
    protected $nowTimestamp;
    protected $expirationTimestamp = 3600*2;
    protected $clientIpAddress;

    public function __construct()
    {
        $this->nowTimestamp = Carbon::now()->timestamp;
        $this->clientIpAddress = $this->getClientIpAddress();
    }

    private function getClientIpAddress()
    {
        return $_SERVER['REMOTE_ADDR'] ?? '0.0.0.0';
    }

    protected function createBaseData()
    {
        $this->baseData = [
            'timestamp' => $this->nowTimestamp, 'ip' => $this->clientIpAddress
        ];

        return $this->baseData;
    }

    protected function encrypt(array $data): string
    {
        return Crypt::encryptString(json_encode($data));
    }

    protected function decrypt($string): array
    {
        return json_decode(Crypt::decryptString($string), true);
    }
}
