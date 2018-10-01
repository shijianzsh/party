<?php

namespace App\Models;

class AuthMap_ extends AuthMap
{
    static public function getAuthMapList(
        int $currentPage = 0,
        int $pageSize = 0,
        array $filter = [
            'keyword' => null,
        ],
        array $with = []
    ): array
    {
        $keyword =& $filter['keyword'];

        $Obj = AuthMap::with($with);

        if (!empty($keyword)) {
            $Obj->where(function ($query) use ($keyword) {
                $query->where('method', 'like', "%{$keyword}%")
                    ->orWhere('namespace', 'like', "%{$keyword}%")
                    ->orWhere('entrance', 'like', "%{$keyword}%")
                    ->orWhere('param_1', 'like', "%{$keyword}%")
                    ->orWhere('param_2', 'like', "%{$keyword}%")
                    ->orWhere('param_3', 'like', "%{$keyword}%")
                    ->orWhere('description', 'like', "%{$keyword}%");
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

    static public function getAuthMap(int $AuthMapId, array $with = []): array
    {
        return $Obj = AuthMap::with($with)->findOrFail($AuthMapId)->toArray();
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

    static public function createAuthMap(array $requestData): array
    {
        $validator = \Validator::make($requestData, [
            'method' => 'required',
            'namespace' => 'required',
            'entrance' => 'required',
            'param_1' => '',
            'param_2' => '',
            'param_3' => '',
            'description' => 'required',
        ]);

        try {
            if ($validator->fails()) {
                throw new \Exception($validator->errors()->first());
            }

            DB::transaction(function () use ($requestData) {
                $Obj = new AuthMap();
                $Obj->method = $requestData['method'];
                $Obj->namespace = $requestData['namespace'];
                $Obj->entrance = $requestData['entrance'];
                $Obj->param_1 = $requestData['param_1'] ?? '';
                $Obj->param_2 = $requestData['param_2'] ?? '';
                $Obj->param_3 = $requestData['param_3'] ?? '';
                $Obj->description = $requestData['description'] ?? '';
                $Obj->save();
            });
        } catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
        }

        return ['success' => (int)($success ?? 1), 'msg' => $msg ?? null];
    }

    static public function updateAuthMap(int $AuthMapId, array $requestData): array
    {
        $validator = \Validator::make($requestData, [
            'method' => 'required',
            'namespace' => 'required',
            'entrance' => 'required',
            'param_1' => '',
            'param_2' => '',
            'param_3' => '',
            'description' => 'required',
        ]);

        try {
            if ($validator->fails()) {
                throw new \Exception($validator->errors()->first());
            }

            DB::transaction(function () use ($AuthMapId, $requestData) {
                $Obj = AuthMap::findOrFail($AuthMapId);
                $Obj->method = $requestData['method'];
                $Obj->namespace = $requestData['namespace'];
                $Obj->entrance = $requestData['entrance'];
                $Obj->param_1 = $requestData['param_1'] ?? '';
                $Obj->param_2 = $requestData['param_2'] ?? '';
                $Obj->param_3 = $requestData['param_3'] ?? '';
                $Obj->description = $requestData['description'] ?? '';
                $Obj->save();
            });
        } catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
        }

        return ['success' => (int)($success ?? 1), 'msg' => $msg ?? null];
    }

    static public function deleteAuthMap(int $AuthMapId): array
    {
        return ['success' => AuthMap::destroy($AuthMapId)];
    }

}
