<?php
/**
 * Created by PhpStorm.
 * User: lijingbo
 * Date: 2018/11/5
 * Time: 10:56 PM
 */

namespace App\Models;

use App\Models\UserActivist;
use App\Services\Login\Login;
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

        $get = $Obj->get()->toArray();

        for ($i = 0; $i < count($get); $i++) {
            $row =& $get[$i];
            unset($row['activist']['audit_user']);
            unset($row['activist']['chat_user']);
            unset($row['activist']['recommend_user']);
        }

        return ['rows' => $get, 'pagination' => getPagination($currentPage, $pageSize, $total)];
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

    static public function auditActivist(int $user_id, array $requestData)
    {
        $validator = \Validator::make($requestData, [
            'chat_user_id' => 'required',
            'audit_status' => 'required',
            'audit_reason' => 'required',
            'more_audit_files' => 'required',
        ]);

        try {
            if ($validator->fails()) {
                throw new \Exception($validator->errors()->first());
            }

            $User = self::getActivist($user_id);
            if ($User->activist->audit_user_id !== User_::getMyId()) {
                throw new \Exception('您没有审核权限');
            }

            if ($User->activist->audit_status !== UserActivist::AUDIT_STATUS['未初审']) {
                throw new \Exception('当前状态不允许初审');
            }

            $Activist = UserActivist::where('user_id', $user_id)->firstOrFail();
            $Activist->chat_user_id = $requestData['chat_user_id'];
            $Activist->audit_status = $requestData['audit_status'];
            $Activist->audit_reason = $requestData['audit_reason'];
            $Activist->more = is_array($Activist->more)
                ? array_merge($Activist->more, ['audit_files' => $requestData['more_audit_files']])
                : ['audit_files' => $requestData['more_audit_files']];
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
                $Activist->more = is_array($Activist->more)
                    ? array_merge($Activist->more, ['chat_files' => $requestData['more_chat_files']])
                    : ['chat_files' => $requestData['more_audit_files']];
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

                $checkUnique = User::where('user_login', $requestData['user_login'])
                    ->get()
                    ->toArray();
                if (count($checkUnique) !== 1) throw new \Exception('用户名不可用');
            });
        } catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
        }

        return ['success' => (int)($success ?? 1), 'msg' => $msg ?? null, 'data' => $userId ?? null];
    }

    static public function deleteActivist(int $userId): array
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
}
