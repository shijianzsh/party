<?php

namespace App\Models;

use DB;

class UserInfoPartyRelation_ extends UserInfoPartyRelation
{
    static public function getUserInfoPartyRelationList(
        int $currentPage = 0,
        int $pageSize = 0,
        array $filter = [
            'keyword' => null,
        ],
        array $with = []
    ): array
    {
        $keyword =& $filter['keyword'];

        $Obj = UserInfoPartyRelation::with($with);

        if (!empty($keyword)) {
            $Obj->where(function ($query) use ($keyword) {
                $query->where('department_name', 'like', "%{$keyword}%");
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

        return ['rows' => $get->toArray(),
            'pagination' =>getPagination($currentPage, $pageSize, $total)
        ];
    }

    static public function getUserInfoPartyRelation(int $userInfoPartyRelationId, array $with = []): array
    {
        return $Obj = UserInfoPartyRelation::with($with)->findOrFail($userInfoPartyRelationId)->toArray();
    }

    static public function createUserInfoPartyRelation(array $requestData): array
    {
        $validator = \Validator::make($requestData, [
            'user_id' => 'required',
            'started_at' => 'required',
            'ended_at' => 'required',
            'department_name' => 'required',
            'guarantor' => 'required',
        ]);

        try {
            if ($validator->fails()) {
                throw new \Exception($validator->errors()->first());
            }

            DB::transaction(function () use ($requestData) {
                $Obj = new UserInfoPartyRelation();
                $Obj->user_id = $requestData['user_id'];
                $Obj->started_at = $requestData['started_at'];
                $Obj->ended_at = $requestData['ended_at'];
                $Obj->department_name = $requestData['department_name'];
                $Obj->save();
            });
        } catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
        }

        return ['success' => (int)($success ?? 1), 'msg' => $msg ?? null];
    }

    static public function updateUserInfoPartyRelation(int $userInfoPartyRelationId, array $requestData): array
    {
        $validator = \Validator::make($requestData, [
            'user_id' => 'required',
            'started_at' => 'required',
            'ended_at' => 'required',
            'department_name' => 'required',
            'guarantor' => 'required',
        ]);

        try {
            if ($validator->fails()) {
                throw new \Exception($validator->errors()->first());
            }

            DB::transaction(function () use ($userInfoPartyRelationId, $requestData) {
                $Obj = UserInfoPartyRelation::findOrFail($userInfoPartyRelationId);
                $Obj->user_id = $requestData['user_id'];
                $Obj->started_at = $requestData['started_at'];
                $Obj->ended_at = $requestData['ended_at'];
                $Obj->department_name = $requestData['department_name'];
                $Obj->save();
            });
        } catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
        }

        return ['success' => (int)($success ?? 1), 'msg' => $msg ?? null];
    }

    static public function deleteUserInfoPartyRelation(int $userInfoPartyRelationId): array
    {
        return ['success' => UserInfoPartyRelation::destroy($userInfoPartyRelationId)];
    }
}
