<?php

namespace App\Models;
use DB;

class DepartmentActivityPlan_ extends DepartmentActivityPlan
{
    static public function getActivityPlanList(
        int $currentPage = 0,
        int $pageSize = 0,
        array $filter = [
//            'user_id' => 0,
//            'to_user_id' => 0,
        ],
        array $with = []
    ): array
    {
        $Obj = DepartmentActivityPlan::with(array_merge($with,['department','user']));

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

    static public function getActivityPlan(int $ActivityPlanId, array $with = []): array
    {
        return $Obj = DepartmentActivityPlan::with($with)->findOrFail($ActivityPlanId)->toArray();
    }

    static public function createActivityPlan(array $requestData): array
    {
        $validator = \Validator::make($requestData, [
            'name' => 'required',
        ]);

        try {
            if ($validator->fails()) {
                throw new \Exception($validator->errors()->first());
            }

            DB::transaction(function () use ($requestData) {
                $Obj = new ActivityPlan();
                $Obj->name = $requestData['name'];
                $Obj->save();
            });
        } catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
        }

        return ['success' => (int)($success ?? 1), 'msg' => $msg ?? null];
    }

    static public function updateActivityPlan(int $ActivityPlanId, array $requestData): array
    {
        $validator = \Validator::make($requestData, [
            'name' => 'required',
        ]);

        try {
            if ($validator->fails()) {
                throw new \Exception($validator->errors()->first());
            }

            DB::transaction(function () use ($ActivityPlanId, $requestData) {
                $Obj = DepartmentActivityPlan::findOrFail($ActivityPlanId);
                $Obj->name = $requestData['name'];
                $Obj->save();
            });
        } catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
        }

        return ['success' => (int)($success ?? 1), 'msg' => $msg ?? null];
    }

    static public function deleteActivityPlan(int $ActivityPlanId): array
    {
        return ['success' => DepartmentActivityPlan::destroy($ActivityPlanId)];
    }
}
