<?php
/**
 * Created by PhpStorm.
 * User: lijingbo
 * Date: 2018/8/21
 * Time: 下午9:57
 */

namespace App\Services\Token;

use App\Models\User_;

class AccessToken extends TokenBase
{
    private $userId;

    public function create(string $token, int $userId): array
    {
        if (empty($token)) {
            throw new \Exception('AccessToken create param error,code 1');
        }
        if (empty($userId)) {
            throw new \Exception('AccessToken create param error,code 2');
        }

        $baseData = $this->createBaseData();
        $baseData['token'] = $token;
        $baseData['user_id'] = $userId;
        return ['success' => 1, 'data' => ['access_token' => $this->encrypt($baseData), 'user_id' => $userId]];
    }

    public function verifyAndSetToSession(string $accessToken): array
    {
        if (empty($accessToken)) {
            throw new \Exception('access token null');
        }

        $TokenObj = new Token();
        $verifyAccessToken = $TokenObj->verify($accessToken);

        if (!$verifyAccessToken['success']) {
            switch ($verifyAccessToken['msg']){
                case 'token令牌过期':
                    break;
                default:
                    $verifyAccessToken['msg'] = 'AccessToken ' . $verifyAccessToken['msg'];
                    break;
            }
            return $verifyAccessToken;
        }
        $data = $verifyAccessToken['data'];

        if (!array_key_exists('token', $data)) {
            throw new \Exception('AccessToken verify error,code 2');
        }

        if (!array_key_exists('user_id', $data)) {
            throw new \Exception('AccessToken verify error,code 3');
        }

        $this->userId = $data['user_id'];

        $verifyToken = $TokenObj->verify($data['token']);
        if (!$verifyToken['success']) {
            return $verifyToken;
        }
        $data['token'] = $verifyToken['data'];

        if ($data['ip'] !== $data['token']['ip']) {
            throw new \Exception('AccessToken verify different ip error');
        }

        $user = User_::getUser($data['user_id'],true);
        if (empty($user)) {
            throw new \Exception('AccessToken verify empty user error');
        }

        if ($user->access_token !== $accessToken) {
            throw new \Exception('access_token error,please login again.');
        }

        $this->setUserIdToSession($data['user_id']);

        return ['success' => 1, 'data' => $data];
    }

    private function setUserIdToSession($userId)
    {
        session()->flash('user_id', $userId);
    }

    public function getUserId(): int
    {
        if ($this->userId) {
            return $this->userId;
        }

        if (session()->get('user_id')) {
            return session()->get('user_id');
        }

        return 0;
    }
}
