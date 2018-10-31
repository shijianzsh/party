<?php
/**
 * Created by PhpStorm.
 * User: lijingbo
 * Date: 2018/11/1
 * Time: 1:40 AM
 */

namespace App\Services\Socket\Helper;

use App\Services\Socket\Server;
use Curl\Curl;
use Illuminate\Support\Facades\Crypt;
use Carbon\Carbon;

class RequestHelper
{
    const SOCKET_REQUEST_KEY = 'fdafdasfa4213213vdf';
    const SOCKET_REQUEST_SECRET = 'fdsafchytjy';
    private $nowTimestamp;

    public function __construct()
    {
        $this->nowTimestamp = Carbon::now()->timestamp;
    }

    //getEncryptionParams子方法 生成签名
    private function getEncryptedSign(): string
    {
        $data = [
            'socket_request_key' => self::SOCKET_REQUEST_KEY,
            'socket_request_secret' => self::SOCKET_REQUEST_SECRET,
            'socket_request_timestamp' => $this->nowTimestamp,
        ];
        return Crypt::encryptString(json_encode($data));
    }

    //socket请求服务器携带加密秘钥 生成秘钥
    private function getEncryptionParams(): array
    {
        return [
            'socket_request_key' => self::SOCKET_REQUEST_KEY,
            'socket_request_sign' => $this->getEncryptedSign(),
            'socket_request_timestamp' => $this->nowTimestamp,
        ];
    }

    //暴露给中间件验证是否为socket服务器的请求
    static public function verifyEncryptionParams(array $params):bool
    {
        if (!array_key_exists('socket_request_key', $params)) return false;
        if (!array_key_exists('socket_request_sign', $params)) return false;
        if (!array_key_exists('socket_request_timestamp', $params)) return false;

        if ($params['socket_request_key'] !== self::SOCKET_REQUEST_KEY) return false;

        $sign = json_decode(Crypt::decryptString($params['socket_request_sign']), true);
        if (!array_key_exists('socket_request_key', $sign)) return false;
        if (!array_key_exists('socket_request_secret', $sign)) return false;
        if (!array_key_exists('socket_request_timestamp', $sign)) return false;

        if ($sign['socket_request_key'] !== $params['socket_request_key']) return false;
        if ($sign['socket_request_secret'] !== self::SOCKET_REQUEST_SECRET) return false;
        if ((int)$sign['socket_request_timestamp'] !== (int)$params['socket_request_timestamp']) return false;

        return true;
    }

    //请求方法的子方法 通过base_url和传入url构建请求url
    private function getUrl(string $url, array $params = [])
    {
        $base_url = substr(env('APP_URL'), -1) === '/' ? env('APP_URL') : env('APP_URL') . '/';

        return count($params)
            ? $base_url . $url . '?' . http_build_query($params)
            : $base_url . $url;
    }

    //请求方法的子方法 对response进行处理 如果是json 进行decode返回array
    private function getResponse($response)
    {
        if (is_json($response)) {
            return json_decode($response, true);
        } else {
            return $response;
        }
    }

    static public function get($url, $params = [])
    {
        $self = new self;

        $curl = new Curl();
        $curl->get($self->getUrl($url), array_merge($self->getEncryptionParams(), $params));
        return $self->getResponse($curl->response);
    }

    static public function post($url, $data = [])
    {
        $self = new self;

        $curl = new Curl();
        $curl->post($self->getUrl($url, $self->getEncryptionParams()), $data);
        return $self->getResponse($curl->response);
    }
}
