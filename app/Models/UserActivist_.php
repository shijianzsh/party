<?php
/**
 * Created by PhpStorm.
 * User: lijingbo
 * Date: 2018/11/5
 * Time: 10:56 PM
 */

namespace App\Models;

use DB;

class UserActivist_ extends User
{
    static public function getActivistList(
        int $currentPage = 0,
        int $pageSize = 0,
        array $filter = [
            'department_id' => null,
            'keyword' => null,
        ],
        array $with = []
    )
    {
        $keyword =& $filter['keyword'];

        $Obj = User::with(array_merge($with, ['department', 'activist', 'partyExperience']));
        $Obj->whereHas('activist', function ($query) {
            $query->where('activist_department_id', Department_::getMyId());
        });

        if (!empty($keyword)) {
            $Obj->where(function ($query) use ($keyword) {
                $query
                    ->where('user_name', 'like', "%{$keyword}%")
                    ->orWhere('user_sex', 'like', "%{$keyword}%")
                    ->orWhere('user_cellphone', 'like', "%{$keyword}%")
                    ->orWhere('user_duty', 'like', "%{$keyword}%")
                    ->orWhere('user_excerpt', 'like', "%{$keyword}%");
            });
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

    static public function getActivist(int $user_id): User
    {
        $activist = User
            ::with(['partyExperience', 'partyRelations', 'activist'])
//            ->where('type', self::TYPE['群众'])
            ->find($user_id);
        if (empty($activist)) throw new \Exception('查找积极分子失败，此人不存在');
        if ($activist->type !== User::TYPE['群众']) throw new \Exception('此人不是积极分子身份');
        return $activist;
    }

    static public function getActivistByCode(string $code): User
    {
        $user = User
            ::with(['partyExperience', 'partyRelations', 'activist'])
            ->where('type', self::TYPE['群众'])
            ->whereHas('activist', function ($query) use ($code) {
                $query->where('code', $code);
            })
            ->first();
        if (empty($user)) throw new \Exception('查询码不存在或已过期');

        if ($user->type !== User::TYPE['群众']) throw new \Exception('查询码不存在或已过期');

        return $user;
    }

    static public function createActivist(array $requestData): array
    {
        $validator = \Validator::make($requestData, [
            'department_id' => 'required',
            'user_name' => 'required',
            'user_sex' => 'required',
            'user_birthplace' => 'required',
            'user_nation' => 'required',
            'user_cellphone' => 'required',
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

            $userId = null;
            DB::transaction(function () use (&$userId, $requestData) {
                $Obj = new User;
                $Obj->type = self::TYPE['群众'];

                $Obj->department_id = $requestData['department_id'];
                $Obj->user_name = $requestData['user_name'];
                $Obj->user_sex = $requestData['user_sex'];
                $Obj->user_birthplace = $requestData['user_birthplace'];
                $Obj->user_nation = $requestData['user_nation'];
                $Obj->user_cellphone = $requestData['user_cellphone'];
                $Obj->user_duty = $requestData['user_duty'];
                $Obj->user_excerpt = $requestData['user_excerpt'];

                $Obj->more = [
                    'thumbnail' => $requestData['more_thumbnail'] ?? null,
                ];
                $Obj->save();

                $activist = new UserActivist([
                    'code' => rand_str(),
                    'status' => UserActivist::AUDIT_STATUS['未初审'],
                    'audit_user_id' => $requestData['audit_user_id'],
                    'recommend_user_id' => $requestData['recommend_user_id'],
                ]);
                $Obj->activist()->save($activist);
                $userId = $Obj->id;

//                createNotification([
//                    'user_id' => $userId,
//                    'related_type' => \App\Models\UserNotification::RELATED_TYPE['积极分子'],
//                    'related_id' => $Obj->id,
//                    'operate_type' => \App\Models\UserNotification::OPERATE_TYPE['注册成功'],
//                ]);
            });
        } catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
        }

        return ['success' => (int)($success ?? 1), 'msg' => $msg ?? null, 'data' => $userId ?? null];
    }

    static public function auditActivist(int $user_id, int $status, $reason = '', array $files = [])
    {
        try {
            $User = self::getActivist($user_id);
            if ($User->activist->audit_user_id !== User_::getMyId()) {
                throw new \Exception('您没有审核权限');
            }

            if ($User->activist->audit_status !== UserActivist::AUDIT_STATUS['未初审']) {
                throw new \Exception('当前状态不允许初审');
            }

            $Activist = UserActivist::where('user_id', $user_id)->firstOrFail();
            $Activist->audit_status = $status;
            $Activist->reason = $reason;
            $Activist->more['audit_files'] = $files;
            $success = $Activist->save();
        } catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
        }

        return ['success' => (int)($success ?? 1), 'msg' => $msg ?? null];
    }

    static public function submitAppointmentChat(int $user_id, array $requestData)
    {
        $validator = \Validator::make($requestData, [
            'more_chat_files' => 'required',
        ]);

        try {
            if ($validator->fails()) {
                throw new \Exception($validator->errors()->first());
            }

            $User = self::getActivist($user_id);

            if ($User->activist->audit_status !== UserActivist::AUDIT_STATUS['初审通过']) {
                throw new \Exception('当前状态不允许该操作');
            }

            DB::transaction(function () use ($user_id, $requestData) {
                $Activist = UserActivist::where('user_id', $user_id)->firstOrFail();
                $Activist->audit_status = UserActivist::AUDIT_STATUS['约谈通过'];
                $Activist->more['chat_files'] = $requestData['more_chat_files'];
                $Activist->save();
            });
        } catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
        }

        return ['success' => (int)($success ?? 1), 'msg' => $msg ?? null, 'data' => $userId ?? null];
    }

    static public function createActivistAccount(int $user_id, array $requestData)
    {
        $validator = \Validator::make($requestData, [
            'user_login' => 'required',
            'user_password' => 'required',
        ]);

        try {
            if ($validator->fails()) {
                throw new \Exception($validator->errors()->first());
            }

            $User = self::getActivist($user_id);

            if ($User->activist->audit_status !== UserActivist::AUDIT_STATUS['约谈通过']) {
                throw new \Exception('当前状态不允许该操作');
            }

            $success = 0;
            DB::transaction(function () use (&$success, $User, $user_id, $requestData) {
                $Activist = UserActivist::where('user_id', $user_id)->firstOrFail();
                $Activist->audit_status = UserActivist::AUDIT_STATUS['成为积极分子'];
                $Activist->save();

                $User->type = User::TYPE['积极分子'];
                $User->user_login = $requestData['user_login'];
                $User->user_password = Login::getPassword($requestData['user_password']);
                $success = $User->save();
            });
        } catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
        }

        return ['success' => (int)($success ?? 1), 'msg' => $msg ?? null, 'data' => $userId ?? null];
    }
}
