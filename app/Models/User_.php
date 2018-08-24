<?php

namespace App\Models;

use App\Services\Token\Token, App\Services\Token\AccessToken;
use App\Services\Login\Login;

class User_ extends User
{
    static public function getMyId(): int
    {
        $Obj = new AccessToken();
        return $Obj->getUserId();
    }

    static public function getUser(int $userId = 0, bool $getObject = false): array
    {
        $Obj = User::find($userId ? $userId : User_::getMyId());
        if ($getObject) {
            return $Obj;
        } else {
            return $Obj->toArray();
        }
    }

    static public function getUserList(
        int $currPage = 0,
        int $pageNumber = 0,
        array $filter = [
            'department_id' => 0,
        ],
        array $with = []
    )
    {
        $departmentId =& $filter['department_id'];

        $Obj = User::with($with);

        if ($departmentId) {
            $Obj->where('department_id', $departmentId);
        }

        $total = $Obj->count();

        if ($currPage && $pageNumber) {
            $offset = ($currPage - 1) * $pageNumber;
            $Obj->offset($offset)->limit($pageNumber);
        }

        $get = $Obj->get();

        return ['total' => $total ?? 0, 'rows' => $get->toArray()];
    }

    static public function createUser(array $requestData): array
    {
        $validator = Validator::make($requestData, [
            'department_id' => 'required',
            'user_login' => 'required',
            'user_password' => 'required',
        ]);

        try {
            if ($validator->fails()) {
                throw new \Exception($validator->errors()->first());
            }

            $Obj = new User;
            $Obj->department_id = $requestData['department_id'];
            $Obj->user_login = $requestData['user_login'];
            $Obj->user_password = $requestData['user_password'];
            $success = $Obj->save();

        } catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
        }

        return ['success' => $success ?? 1, 'msg' => $msg ?? null];
    }

    static public function editUser(int $userId, array $requestData): array
    {
        $validator = Validator::make($requestData, [
            'department_id' => 'required',
            'user_login' => 'required',
            'user_password' => 'required',
        ]);

        try {
            if ($validator->fails()) {
                throw new \Exception($validator->errors()->first());
            }

            $Obj = new User;
            $Obj->find($userId);
            $Obj->department_id = $requestData['department_id'];
            $Obj->user_login = $requestData['user_login'];
            $Obj->user_password = $requestData['user_password'];
            $success = $Obj->save();
        } catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
        }

        return ['success' => $success ?? 1, 'msg' => $msg ?? null];
    }

    static public function deleteUser(int $userId): array
    {
        $Obj = User::find($userId);
        $delete = $Obj->delete();

        return ['success' => $delete];
    }

    /**
     * 登录、获取access_token的接口
     */
    static public function getAccessToken(string $token, string $account, string $password): array
    {
        $TokenObj = new Token();
        $verify = $TokenObj->verify($token);
        if (!$verify['success']) {
            return $verify;
        }

        $user = User::where('user_login', $account)->first();
        if (empty($user)) {
            return ['success' => 0, 'msg' => '用户不存在或密码错误'];
        }

        $passwordNow = Login::getPassword($password);
        if ($passwordNow !== $user['user_password']) {
            return ['success' => 0, 'msg' => '用户不存在或密码错误'];
        }

        $AccessTokenObj = new AccessToken();
        $getAccessToken = $AccessTokenObj->create($token, (int)$user['id']);

        $user->access_token = $getAccessToken['data'];
        return $getAccessToken;
    }
}
