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
            return ['success' => 0, 'msg' => 'AccessToken create param error,code 1'];
        }
        if (empty($userId)) {
            return ['success' => 0, 'msg' => 'AccessToken create param error,code 2'];
        }

        $baseData = $this->createBaseData();
        $baseData['token'] = $token;
        $baseData['user_id'] = $userId;
        return ['success' => 1, 'data' => $this->encrypt($baseData)];
    }

    public function verifyAndSetToSession(string $accessToken): array
    {
        if (empty($accessToken)) {
            return ['success' => 0, 'msg' => 'AccessToken verify error,code 1'];
        }

        $TokenObj = new Token();
        $verifyAccessToken = $TokenObj->verify($accessToken);
        if (!$verifyAccessToken['success']) {
            $verifyAccessToken['msg'] = 'AccessToken ' . $verifyAccessToken['msg'];
            return $verifyAccessToken;
        }
        $data = $verifyAccessToken['data'];

        if (!array_key_exists('token', $data)) {
            return ['success' => 0, 'msg' => 'AccessToken verify error,code 2'];
        }

        if (!array_key_exists('user_id', $data)) {
            return ['success' => 0, 'msg' => 'AccessToken verify error,code 3'];
        }
        $this->userId = $data['user_id'];

        $verifyToken = $TokenObj->verify($data['token']);
        if (!$verifyToken['success']) {
            return $verifyToken;
        }
        $data['token'] = $verifyToken['data'];

        if ($data['ip'] !== $data['token']['ip']) {
            return ['success' => 0, 'msg' => 'AccessToken verify different ip error'];
        }

        $user = User_::getUser($data['user_id']);
        if (empty($user)) {
            return ['success' => 0, 'msg' => 'AccessToken verify empty user error'];
        }

        if ($user->access_token !== $accessToken) {
            return ['success' => 0, 'msg' => 'AccessToken verify access_token changed error'];
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

        if (session()->get('user_id')){
            return session()->get('user_id',0);
        }

        return 0;
    }
}
