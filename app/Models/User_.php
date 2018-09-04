<?php

namespace App\Models;

use App\Services\Token\Token, App\Services\Token\AccessToken;
use App\Services\Login\Login;

class User_ extends User
{
    public const UserTypeMap = [
        '超级管理员' => 0,
        '单位超级管理员' => 1,
        '单位领导' => 2,
        '单位党员' => 3,
        '入党积极分子' => 4,
        '群众' => 4,
    ];

    static public function getMyId(): int
    {
        $Obj = new AccessToken();
        return $Obj->getUserId();
    }

    static public function getUser(int $userId = 0, bool $getObject = false): array
    {
        $Obj = User::findOrFail($userId ? $userId : User_::getMyId());
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

        return ['total' => $total ?? 0, 'rows' => $get->toArray(), 'pagination' => ['current' => $currPage, 'page_number' => $pageNumber]];
    }

    static public function createUser(array $requestData): array
    {
        $validator = \Validator::make($requestData, [
            'type' => 'required',
            'department_id' => 'required',
            'user_login' => 'required',
            'user_password' => 'required',
        ]);

        try {
            if ($validator->fails()) {
                throw new \Exception($validator->errors()->first());
            }

            $Obj = new User;
            $Obj->type = $requestData['type'];
            $Obj->department_id = $requestData['department_id'];
            $Obj->user_login = $requestData['user_login'];
            $Obj->user_password = $requestData['user_password'];
            $success = $Obj->save();

        } catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
        }

        return ['success' => (int)($success ?? 1), 'msg' => $msg ?? null];
    }

    static public function editUser(int $userId, array $requestData): array
    {
        return ['success' => 0, 'msg' => '功能未开放'];

        $validator = \Validator::make($requestData, [
            'type' => 'required',
            'department_id' => 'required',
            'user_login' => 'required',
            'user_password' => 'required',
        ]);

        try {
            if ($validator->fails()) {
                throw new \Exception($validator->errors()->first());
            }

            $Obj = new User;
            $Obj->findOrFail($userId);
            $Obj->type = $requestData['type'];
            $Obj->department_id = $requestData['department_id'];
            $Obj->user_login = $requestData['user_login'];
            $Obj->user_password = $requestData['user_password'];
            $success = $Obj->save();
        } catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
        }

        return ['success' => (int)($success ?? 1), 'msg' => $msg ?? null];
    }

    static public function deleteUser(int $userId): array
    {
        $Obj = User::findOrFail($userId);
        $delete = $Obj->delete();

        return ['success' => $delete];
    }

    static public function changePassword(array $requestData): array
    {
        $validator = \Validator::make($requestData, [
            'user_password_old' => 'required',
            'user_password' => 'required',
            'user_password2' => 'required',
        ]);

        try {
            if ($validator->fails()) {
                throw new \Exception($validator->errors()->first());
            }
            if ($requestData['user_password'] !== $requestData['user_password2']) {
                throw new \Exception('两次密码输入不一致');
            }

            $Obj = User::findOrFail(User_::getMyId());
            if (!$Obj) {
                throw new \Exception('未查询到用户信息');
            }
            if (Login::getPassword($requestData['user_password']) !== $Obj->user_password) {
                throw new \Exception('当前密码输入有误');
            }

            $Obj->user_password = Login::getPassword($requestData['user_password']);
            $success = $Obj->save();
        } catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
        }

        return ['success' => (int)($success ?? 1), 'msg' => $msg ?? null];
    }

    static public function changeDepartment()
    {

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
