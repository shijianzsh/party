<?php

namespace App\Models;

use DB;

class UserTransferDepartment_ extends UserTransferDepartment
{
    static public function getTransferList(
        int $currentPage = 0,
        int $pageSize = 0,
        array $filter = [
            'user_id' => 0,
            'audit_user_id' => 0,
            'old_department_id' => 0,
            'new_department_id' => 0,
        ],
        array $with = []
    ): array
    {
        $userId =& $filter['user_id'];
        $auditUserId =& $filter['audit_user_id'];
        $oldDepartmentId =& $filter['old_department_id'];
        $newDepartmentId =& $filter['new_department_id'];

        $Obj = UserTransferDepartment::with($with);
        $Obj->orderBy('updated_at', 'desc');

        if (!empty($userId)) {
            $Obj->where('user_id', $userId);
        }

        if (!empty($auditUserId)) {
            $Obj->where('audit_user_id', $auditUserId);
        }

        if (!empty($oldDepartmentId)) {
            $Obj->where('old_department_id', $oldDepartmentId);
        }

        if (!empty($newDepartmentId)) {
            $Obj->where('new_department_id', $newDepartmentId);
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

        return ['rows' => $get->toArray(),
            'pagination' => getPagination($currentPage, $pageSize, $total)
        ];
    }

    static public function getTransfer(int $transferId, bool $getObject = false, array $with = []): array
    {
        $Obj = UserTransferDepartment::with($with)->findOrFail($transferId);
        return $getObject ? $Obj : $Obj->toArray();
    }

    static public function createTransfer(array $requestData): array
    {
        $validator = \Validator::make($requestData, [
            'user_id' => 'required',
//            'audit_user_id' => 'required',
            'from_department_id' => 'required',
            'to_department_id' => 'required',
            'more_files' => 'required',
        ]);

        try {
            if ($validator->fails()) {
                throw new \Exception($validator->errors()->first());
            }

            DB::transaction(function () use ($requestData) {
                $check = UserTransferDepartment
                    ::where('user_id', $requestData['user_id'])
                    ->where('audit_status', '<>', self::AUDIT_STATUS['通过'])
                    ->get()
                    ->toArray();
                if (!empty($check)) throw new \Exception('该党员存在状态为"未通过"的转移记录，请联系管理员');

                $Obj = new UserTransferDepartment();
                $Obj->user_id = $requestData['user_id'];
//                $Obj->audit_user_id = $requestData['audit_user_id'];
                $Obj->from_department_id = $requestData['from_department_id'];
                $Obj->to_department_id = $requestData['to_department_id'];
                $Obj->more = [
                    'files' => $requestData['more_files'] ?? null,
                ];
                $Obj->save();
            });
        } catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
        }

        return ['success' => (int)($success ?? 1), 'msg' => $msg ?? null];
    }

    static public function deleteTransfer(int $userId): array
    {
        try {
            $Obj = UserTransferDepartment
                ::where('user_id', $userId)
                ->where('audit_status', '<>', self::AUDIT_STATUS['通过']);

            if (empty($Obj->get()->toArray())) throw new \Exception('错误：未找到记录');

            $success = $Obj->delete();
        } catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
        }
        return ['success' => (int)($success ?? 1), 'msg' => $msg ?? null];
    }

    static public function auditTransfer(int $userId, array $requestData)
    {
        try {
            $success = null;
            DB::transaction(function () use (&$success, $userId, $requestData) {
                $User = User_::getUser($userId, true);
                if (empty($User)) throw new \Exception('错误:获取用户信息失败');

                $Obj = UserTransferDepartment
                    ::where('user_id', $userId)
                    ->where('from_department_id', $User['department_id'])
                    ->where('audit_status', self::AUDIT_STATUS['未审核'])
                    ->firstOrFail();

                if (!empty($Obj->audit_user_id) && $Obj->audit_user_id !== User_::getMyId()) throw new \Exception('错误:您没有审核该党员的权限');

                $Obj->audit_user_id = User_::getMyId();
                $Obj->audit_status = $requestData['status'];
                $Obj->audit_reject_reason = $requestData['reason'];
                $success = $Obj->save();
                if (!$success) throw new \Exception('错误:操作失败');

                if ($requestData['status'] === self::AUDIT_STATUS['通过']) {
                    $User->department_id = $Obj->to_department_id;
                    $success = $User->save();
                }
            });
        } catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
        }

        return ['success' => (int)($success ?? 1), 'msg' => $msg ?? null];
    }
}
