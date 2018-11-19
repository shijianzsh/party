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
                    ->where('user_name', 'like', "%{$keyword}%")
                    ->orWhere('user_sex', 'like', "%{$keyword}%")
                    ->orWhere('user_cellphone', 'like', "%{$keyword}%")
                    ->orWhere('user_duty', 'like', "%{$keyword}%")
                    ->orWhere('user_excerpt', 'like', "%{$keyword}%")
                    ->orWhere('user_email', 'like', "%{$keyword}%");
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

        return ['rows' => $get->toArray(), 'pagination' => getPagination($currentPage, $pageSize, $total)];
    }

    static public function getDepartmentUserList(
        int $currentPage = 0,
        int $pageSize = 0,
        array $filter = [
            'ids' => [],
            'department_id' => 0,
            'descendant_id' => 0,
            'keyword' => null,
            'start_timestamp' => null,
            'end_timestamp' => null,
        ],
        array $with = []
    )
    {
        $ids =& $filter['ids'];
        $departmentId = $filter['department_id'];
        $descendant_id = &$filter['descendant_id'];
        $keyword =& $filter['keyword'];
        $startTimestamp =& $filter['start_timestamp'];
        $endTimestamp =& $filter['end_timestamp'];

        $Obj = User::with(array_merge($with, ['department', 'partyExperience']));

        if (!empty($descendant_id)) {
            $Obj->where('department_id', $descendant_id);
        } else {
            $Obj->whereIn('department_id', Department_::getDescendants($departmentId)['ids']);
        }

        if (!empty($ids)) {
            $Obj->whereIn('id', $ids);
        }

        if (!empty($keyword)) {
            $Obj->where(function ($query) use ($keyword) {
                $query
                    ->where('user_name', 'like', "%{$keyword}%")
                    ->orWhere('user_sex', 'like', "%{$keyword}%")
                    ->orWhere('user_cellphone', 'like', "%{$keyword}%")
                    ->orWhere('user_duty', 'like', "%{$keyword}%")
                    ->orWhere('user_excerpt', 'like', "%{$keyword}%")
                    ->orWhere('user_email', 'like', "%{$keyword}%");
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

        return ['rows' => $get->toArray(), 'pagination' => getPagination($currentPage, $pageSize, $total)];
    }

    static public function getDepartmentTransferUserList(
        int $currentPage = 0,
        int $pageSize = 0,
        array $filter = [
            'department_id' => 0,
            'keyword' => null,
            'start_timestamp' => null,
            'end_timestamp' => null,
        ],
        array $with = ['transfers']
    )
    {
        $departmentId = $filter['department_id'];
        $keyword =& $filter['keyword'];
        $startTimestamp =& $filter['start_timestamp'];
        $endTimestamp =& $filter['end_timestamp'];

        $Obj = User::with(array_merge($with, ['department', 'partyExperience']));

        if (!empty($keyword)) {
            $Obj->where(function ($query) use ($keyword) {
                $query
                    ->where('user_name', 'like', "%{$keyword}%")
                    ->orWhere('user_sex', 'like', "%{$keyword}%")
                    ->orWhere('user_cellphone', 'like', "%{$keyword}%")
                    ->orWhere('user_duty', 'like', "%{$keyword}%")
                    ->orWhere('user_excerpt', 'like', "%{$keyword}%")
                    ->orWhere('user_email', 'like', "%{$keyword}%");
            });
        }

        $Obj->where(function ($query) use ($departmentId) {
            $query
                ->whereHas('transfers', function ($query) use ($departmentId) {
                    $query->where('from_department_id', $departmentId);
                })
                ->orWhere('department_id', $departmentId);
        });

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

        return ['rows' => $get->toArray(), 'pagination' => getPagination($currentPage, $pageSize, $total)];
    }

    static public function getDepartmentReceiveUserList(
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
        $departmentId = $filter['department_id'];
        $keyword =& $filter['keyword'];
        $startTimestamp =& $filter['start_timestamp'];
        $endTimestamp =& $filter['end_timestamp'];

        $Obj = User::with(array_merge($with, ['department', 'transfers']));

        $Obj->where('department_id', $departmentId);

        $Obj->whereHas('transfers', function ($query) use ($departmentId) {
            $query
                ->where('to_department_id', $departmentId)
                ->where('audit_status', '<>', UserTransferDepartment::AUDIT_STATUS['通过']);
        });

        if (!empty($keyword)) {
            $Obj->where(function ($query) use ($keyword) {
                $query
                    ->where('user_name', 'like', "%{$keyword}%")
                    ->orWhere('user_sex', 'like', "%{$keyword}%")
                    ->orWhere('user_cellphone', 'like', "%{$keyword}%")
                    ->orWhere('user_duty', 'like', "%{$keyword}%")
                    ->orWhere('user_excerpt', 'like', "%{$keyword}%")
                    ->orWhere('user_email', 'like', "%{$keyword}%");
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

        return ['rows' => $get->toArray(), 'pagination' => getPagination($currentPage, $pageSize, $total)];
    }

    static public function getCommunication(
        array $filter = [
            'user_id' => 0,
            'keyword' => null,
        ],
        array $with = []
    )
    {
        try {
            $userId =& $filter['user_id'];
            $keyword =& $filter['keyword'];

            $User = self::getUser($userId, true);
            $departmentId = $User->department_id;

            $Obj = User::with($with);

            $Obj->where('department_id', $departmentId);
            $Obj->where('id', '<>', $User);

            if (!empty($keyword)) {
                $Obj->where(function ($query) use ($keyword) {
                    $query
                        ->where('user_name', 'like', "%{$keyword}%")
                        ->orWhere('user_sex', 'like', "%{$keyword}%")
                        ->orWhere('user_cellphone', 'like', "%{$keyword}%")
                        ->orWhere('user_duty', 'like', "%{$keyword}%")
                        ->orWhere('user_excerpt', 'like', "%{$keyword}%")
                        ->orWhere('user_email', 'like', "%{$keyword}%");
                });
            }
            $Obj->orderBy('user_name', 'asc');

            $total = $Obj->count();

            $get = $Obj->get();

            $result = [];
            for ($i = 0; $i < count($get); $i++) {
                $row =& $get[$i];
                $firstLetter = get_first_charter($row->user_name);

                if (!array_key_exists($firstLetter, $result)) {
                    $result[$firstLetter] = [];
                }

                $result[$firstLetter][] = [
                    'id' => $row->id,
                    'user_name' => $row->user_name,
                    'thumbnail_format' => $row->thumbnail_format,
                    'user_duty' => $row->user_duty,
                    'user_email' => $row->user_email,
                    'user_cellphone' => $row->user_cellphone,
                    'user_borned_at_format' => $row->user_borned_at_format,
                    'user_nation' => $row->user_nation,
                ];
            }
        } catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
        }

        return ['success' => (int)($success ?? 1), 'data' => ['rows' => $result, 'pagination' => getPagination(0, 0, $total)], 'msg' => $msg ?? null];
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
        $userId = $Obj->getUserId();
        if (!$userId) throw new \Exception('user getMyId error:user_id null');

        return $userId;
    }

    static public function getUser(int $userId = 0, bool $getObject = false, array $with = [])
    {
        $Obj = User::with($with)->find($userId ? $userId : User_::getMyId());
        if ($getObject) {
            $result = $Obj;
        } else {
            $result = $Obj ? $Obj->toArray() : $Obj;
        }

        return $result;
    }

    static public function getUserWithPartyInfo(int $userId = 0)
    {
        $with = ['department', 'partyExperience', 'partyRelations' => function ($query) {
            $query->orderBy('sort_order', 'asc');
        }];
        return self::getUser($userId, false, $with);
    }

    static public function getUserThumbnail(int $userId = 0)
    {
        $user = self::getUser($userId);
        return $user['thumbnail_format'] ?? null;
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
            'user_name' => 'required',
            'user_sex' => 'required',
            'user_birthplace' => 'required',
            'user_nation' => 'required',
            'user_cellphone' => 'required',
            'user_duty' => 'required',
            'user_excerpt' => 'required',
            'user_login' => 'required',
            'user_password' => 'required',
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
                $Obj->user_name = $requestData['user_name'];
                $Obj->user_sex = $requestData['user_sex'];
                $Obj->user_birthplace = $requestData['user_birthplace'];
                $Obj->user_nation = $requestData['user_nation'];
                $Obj->user_cellphone = $requestData['user_cellphone'];
                $Obj->user_duty = $requestData['user_duty'];
                $Obj->user_excerpt = $requestData['user_excerpt'];
                $Obj->user_login = $requestData['user_login'];
                $Obj->user_password = Login::getPassword($requestData['user_password']);

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

                $checkUnique = User::where('user_login', $requestData['user_login'])
                    ->get()
                    ->toArray();
                if (count($checkUnique) !== 1) throw new \Exception('用户名不可用');
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
            'user_name' => 'required',
            'user_sex' => 'required',
            'user_duty' => 'required',
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
                $Obj->user_name = $requestData['user_name'];
                $Obj->user_sex = $requestData['user_sex'];
                $Obj->user_duty = $requestData['user_duty'];
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
            'user_name' => '',
            'user_sex' => '',
            'user_cellphone' => '',
            'user_duty' => '',
            'user_borned_at' => '',
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
                        $more['thumbnail'] = $value;
                        $user->more = $more;
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
        try {
            $Obj = User::findOrFail($userId);
            if ($Obj->type !== User::TYPE['群众']) throw new \Exception('账户类型错误，不允许删除');
            $success = $Obj->delete();
        } catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
        }
        return ['success' => (int)($success ?? 1), 'msg' => $msg ?? null, 'data' => $userId ?? null];
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
            $data = User_::getMyId();
        } catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
        }

        return ['success' => (int)($success ?? 1), 'msg' => $msg ?? null, 'data' => $data];
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
                ->first();

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

            $user_format = $user->toArray();

            foreach ($user_format as $key => $value) {
                switch ($key) {
                    case 'id':
                    case 'type':
                    case 'type_format':
                    case 'department_id':
                        continue;
                    default:
                        unset($user_format[$key]);
                        break;
                }
            }

            $data = array_merge(
                $getAccessToken['data'],
                ['user' => $user_format],
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
            'data' => $data ?? null,
            'msg' => $msg ?? null,
        ];
    }
}
