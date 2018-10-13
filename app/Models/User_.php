<?php

namespace App\Models;

use App\Services\Token\Token, App\Services\Token\AccessToken;
use App\Services\Login\Login;
use DB;

class User_ extends User
{
    static public function getUserList(
        int $currentPage = 0,
        int $pageSize = 0,
        array $filter = [
            'department_id' => 0,
            'keyword' => null,
            'start_timestamp' => null,
            'end_timestamp' => null,
        ],
        array $with = []
    )
    {
        $ids =& $filter['ids'];
        $departmentId =& $filter['department_id'];
        $keyword =& $filter['keyword'];
        $startTimestamp =& $filter['start_timestamp'];
        $endTimestamp =& $filter['end_timestamp'];

        $Obj = User::with(array_merge($with, ['department', 'partyExperience']));

        if (!empty($ids)) {
            $Obj->whereIn('id', $ids);
        }

        if (!empty($departmentId)) {
            $Obj->where('department_id', $departmentId);
        }

        if (!empty($keyword)) {
            $Obj->where(function ($query) use ($keyword) {
                $query
                    ->where('name', 'like', "%{$keyword}%")
                    ->orWhere('sex', 'like', "%{$keyword}%")
                    ->orWhere('cellphone', 'like', "%{$keyword}%")
                    ->orWhere('duty', 'like', "%{$keyword}%")
                    ->orWhere('user_excerpt', 'like', "%{$keyword}%");
            });
        }

        if ($startTimestamp) {
            //TODO
//            $Obj->where('established_at', '>=', $startTimestamp);
        }

        if ($endTimestamp) {
            //TODO
//            $Obj->where('established_at', '<=', $endTimestamp);
        }

        $total = $Obj->count();

        if ($currentPage) {
            $pageSize = !$pageSize ? self::PAGE_SIZE : $pageSize;
        } else {
            $pageSize = 0;
        }
        if ($currentPage && $pageSize) {
            $offset = ($currentPage - 1) * $pageSize;
            $Obj->offset($offset)->limit($pageSize);
        }

        $get = $Obj->get();

        return ['rows' => $get->toArray(), 'pagination' => ['current' => $currentPage, 'pageSize' => $pageSize, 'total' => $total ?? 0]];
    }

    /**
     * 获取当前user_id
     * user_id来源于 VerifyAccessToken中间件验证成功后写入session
     *
     * @return int
     */
    static public function getMyId(): int
    {
        $Obj = new AccessToken();
        return $Obj->getUserId();
    }

    static public function getUser(int $userId = 0, bool $getObject = false, array $with = [])
    {
        $Obj = User::with($with)->findOrFail($userId ? $userId : User_::getMyId());
        if ($getObject) {
            return $Obj;
        } else {
            return $Obj->toArray();
        }
    }

    static public function getUserWithPartyInfo(int $userId = 0)
    {
        $with = ['department', 'partyExperience', 'partyRelation' => function ($query) {
            $query->orderBy('sort_order', 'asc');
        }];
        return self::getUser($userId, false, $with);
    }

    /**
     * 新增人员.
     *
     * @param  $requestData
     * @return array
     */
    static public function createUser(array $requestData): array
    {
        $validator = \Validator::make($requestData, [
            'type' => 'required',
            'role_ids' => 'required',
            'department_id' => 'required',
            'name' => 'required',
            'sex' => 'required',
            'duty' => 'required',
            'user_excerpt' => 'required',
//            'user_login' => 'required',
//            'user_password' => 'required',
            'more_thumbnail' => 'required',
        ]);

        try {
            if ($validator->fails()) {
                throw new \Exception($validator->errors()->first());
            }

            DB::transaction(function () use ($requestData) {
                $Obj = new User;
                $Obj->type = $requestData['type'];
                $Obj->department_id = $requestData['department_id'];
                $Obj->name = $requestData['name'];
                $Obj->duty = $requestData['duty'];
                $Obj->user_excerpt = $requestData['user_excerpt'];
//                $Obj->user_login = $requestData['user_login'];
//                $Obj->user_password = Login::getPassword($requestData['user_password']);
                $Obj->more = [
                    'thumbnail' => $requestData['more_thumbnail'] ?? null,
                ];
                $Obj->save();

                $role_ids = $requestData['role_ids'];
                $saveMany = [];
                for ($i = 0; $i < count($role_ids); $i++) {
                    $saveMany[] = new AuthRoleUser(['auth_role_id' => $role_ids[$i]]);
                }
                $Obj->rolesMiddle()->saveMany($saveMany);
            });
        } catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
        }

        return ['success' => (int)($success ?? 1), 'msg' => $msg ?? null];
    }

    static public function updateUser(int $userId, array $requestData): array
    {
        $validator = \Validator::make($requestData, [
            'type' => 'required',
            'role_ids' => 'required',
            'department_id' => 'required',
            'name' => 'required',
            'sex' => 'required',
            'duty' => 'required',
            'user_excerpt' => 'required',
//            'user_login' => 'required',
//            'user_password' => 'required',
            'more_thumbnail' => 'required',
        ]);

        try {
            if ($validator->fails()) {
                throw new \Exception($validator->errors()->first());
            }

            DB::transaction(function () use ($userId, $requestData) {
                $Obj = User::findOrFail($userId);

                $Obj->type = $requestData['type'];
                $Obj->department_id = $requestData['department_id'];
                $Obj->name = $requestData['name'];
                $Obj->duty = $requestData['duty'];
                $Obj->user_excerpt = $requestData['user_excerpt'];
                //$Obj->user_login = $requestData['user_login'];
//                $Obj->user_password = Login::getPassword($requestData['user_password']);
                $Obj->more = [
                    'thumbnail' => $requestData['more_thumbnail'] ?? null,
                ];
                $Obj->save();

                $Obj->rolesMiddle()->delete();

                $role_ids = $requestData['role_ids'];
                $saveMany = [];
                for ($i = 0; $i < count($role_ids); $i++) {
                    $saveMany[] = new AuthRoleUser(['auth_role_id' => $role_ids[$i]]);
                }
                $Obj->rolesMiddle()->saveMany($saveMany);
            });
        } catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
        }

        return ['success' => (int)($success ?? 1), 'msg' => $msg ?? null];
    }

    static public function editUser(int $userId, array $requestData): array
    {
        $validator = \Validator::make($requestData, [
            'name' => '',
            'sex' => '',
            'cellphone' => '',
            'duty' => '',
            'borned_at' => '',
            'more_thumbnail' => '',
        ]);

        try {
            if ($validator->fails()) {
                throw new \Exception($validator->errors()->first());
            }

            foreach ($requestData as $key => $value) {
                switch ($key) {
                    case 'more_thumbnail':
                        $user = User::findOrFail($userId);
                        $more = $user->more;
                        $more['thumbnail']=$value;
                        $user->more=$more;
                        $user->save();
                        return [];
                        break;
                    default:
                        $updateData = [$key => $value];
                        $success = User
                            ::where('id', $userId)
                            ->update($updateData);
                        break;
                }

                break;
            }


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

    static public function changePassword(int $userId, array $requestData): array
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

            $Obj = User::findOrFail($userId);
            if (!$Obj) {
                throw new \Exception('未查询到用户信息');
            }
            if (Login::getPassword($requestData['user_password_old']) !== $Obj->user_password) {
                throw new \Exception('当前密码输入有误');
            }

            $Obj->user_password = Login::getPassword($requestData['user_password']);
            $success = $Obj->save();
        } catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
        }

        return ['success' => (int)($success ?? 1), 'msg' => $msg ?? null, 'getMyId' => User_::getMyId()];
    }

    static public function changeDepartment()
    {

    }

    /**
     * 登录、获取access_token的接口
     */
    static public function getAccessToken(string $token, array $requestData): array
    {
        $validator = \Validator::make($requestData, [
            'user_login' => 'required',
            'user_password' => 'required',
        ]);

        try {
            if ($validator->fails()) {
                throw new \Exception($validator->errors()->first());
            }
            $user_login = $requestData['user_login'];
            $user_password = $requestData['user_password'];

            $TokenObj = new Token();
            $verify = $TokenObj->verify($token);
            if (!$verify['success']) {
                return $verify;
            }

            $user = User
                ::with(['roles' => function ($query) {
                    $query->with(['auths']);
                }])
                ->where('user_login', $user_login)
                ->firstOrFail();
            if (empty($user)) {
                throw new \Exception('用户不存在或密码错误');
            }

            if (empty($user)) {
                throw new \Exception('用户不存在或密码错误');
            }

            $passwordNow = Login::getPassword($user_password);
            if ($passwordNow !== $user['user_password']) {
                throw new \Exception('用户不存在或密码错误');
            }

            $AccessTokenObj = new AccessToken();
            $getAccessToken = $AccessTokenObj->create($token, (int)$user['id']);

            $data = array_merge(
                $getAccessToken['data'],
                ['user' => $user->toArray()],
                ['auths_format' => $user->auths_format]
            );

            $user->access_token = $getAccessToken['data']['access_token'];
            $success = $user->save();
        } catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
        }

        return [
            'success' => (int)($success ?? 1),
            'data' => $data ?? ['user_id' => $user['id'] ?? null],
            'msg' => $msg ?? null,
            '$requestData' => $requestData,
        ];
    }
}
