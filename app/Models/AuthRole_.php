<?php

namespace App\Models;

use DB;

class AuthRole_ extends AuthRole
{
    static public function getAuthRoleList(
        int $currentPage = 0,
        int $pageSize = 0,
        array $filter = [
            'keyword' => null,
        ],
        array $with = []
    ): array
    {
        $keyword =& $filter['keyword'];

        $Obj = AuthRole::with(array_merge($with, ['users']));

        if (!empty($keyword)) {
            $Obj->where(function ($query) use ($keyword) {
                $query->where('name', 'like', "%{$keyword}%");
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
            'pagination' => ['current' => $currentPage, 'pageSize' => $pageSize, 'total' => $total ?? 0]
        ];
    }

    static public function getAuthRole(int $AuthRoleId, array $with = []): array
    {
        return $Obj = AuthRole::with($with)->findOrFail($AuthRoleId)->toArray();
    }

    static public function getUserAuth(int $userId)
    {
        $get = AuthRole::with(['userMiddle', 'auths'])
            ->whereHas('userMiddle', function ($query) use ($userId) {
                $query->where('auth_role_user.user_id', $userId);
            })
            ->get()
            ->toArray();

        $temp = array_column($get, 'auths');

        $result = [];
        for ($i = 0; $i < count($temp); $i++) {
            for ($j = 0; $j < count($temp[$i]); $j++) {
                $result[$temp[$i][$j]['id']] = $temp[$i][$j];
            }
        }

        return array_values($result);
    }

    static public function createAuthRole(array $requestData): array
    {
        $validator = \Validator::make($requestData, [
            'name' => 'required',
            'map_ids' => 'required',
        ]);

        try {
            if ($validator->fails()) {
                throw new \Exception($validator->errors()->first());
            }

            DB::transaction(function () use ($requestData) {
                $Obj = new AuthRole();
                $Obj->name = $requestData['name'];
                $Obj->save();

                $map_ids = $requestData['map_ids'];
                $saveMany = [];
                for ($i = 0; $i < count($map_ids); $i++) {
                    $saveMany[] = new AuthRoleMap(['auth_map_id' => $map_ids[$i]]);
                }
                $Obj->authMiddle()->saveMany($saveMany);
            });
        } catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
        }

        return ['success' => (int)($success ?? 1), 'msg' => $msg ?? null];
    }

    static public function updateAuthRole(int $AuthRoleId, array $requestData): array
    {
        $validator = \Validator::make($requestData, [
            'name' => 'required',
            'map_ids' => 'required',
        ]);

        try {
            if ($validator->fails()) {
                throw new \Exception($validator->errors()->first());
            }

            DB::transaction(function () use ($AuthRoleId, $requestData) {
                $Obj = AuthRole::findOrFail($AuthRoleId);
                $Obj->name = $requestData['name'];
                $Obj->save();

                $Obj->authMiddle()->delete();

                $map_ids = $requestData['map_ids'];
                $saveMany = [];
                for ($i = 0; $i < count($map_ids); $i++) {
                    $saveMany[] = new AuthRoleMap(['auth_map_id' => $map_ids[$i]]);
                }
                $Obj->authMiddle()->saveMany($saveMany);
            });
        } catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
        }

        return ['success' => (int)($success ?? 1), 'msg' => $msg ?? null];
    }

    static public function deleteAuthRole(int $AuthRoleId): array
    {
        try {
            DB::transaction(function () use ($AuthRoleId) {
                $Obj = AuthRole::with(['users'])->findOrFail($AuthRoleId);
                if (count($Obj->users)) {
                    throw new \Exception('存在拥有该角色的用户，禁止删除');
                }
                $Obj->authMiddle()->delete();
                $Obj->delete();
            });
        } catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
        }

        return ['success' => (int)($success ?? 1), 'msg' => $msg ?? null];
    }

}
