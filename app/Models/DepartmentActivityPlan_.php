<?php

namespace App\Models;

use DB;

class DepartmentActivityPlan_ extends DepartmentActivityPlan
{
    static public function getActivityPlanList(
        int $currentPage = 0,
        int $pageSize = 0,
        array $filter = [
            'initiate_user_id' => 0,
//            'to_user_id' => 0,
        ],
        array $with = ['attendUsersMiddle']
    ): array
    {
        $initiate_user_id =& $filter['initiate_user_id'];

        $Obj = DepartmentActivityPlan::with(array_merge($with, ['department', 'initiateUser']));

        if ($initiate_user_id !== null) {
            $Obj->where('initiate_user_id', $initiate_user_id);
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

    static public function getActivityPlan(int $ActivityPlanId, array $with = []): array
    {
        return $Obj = DepartmentActivityPlan::with($with)->findOrFail($ActivityPlanId)->toArray();
    }

    static public function createActivityPlan(array $requestData): array
    {
        $validator = \Validator::make($requestData, [
            'title' => 'required',
            'type' => 'required',
            'content' => 'required',
            'attend_user_ids' => 'required',
            'published_at' => 'required',
            'more_files' => 'required',
        ]);

        try {
            if ($validator->fails()) {
                throw new \Exception($validator->errors()->first());
            }

            DB::transaction(function () use ($requestData) {
                $Obj = new DepartmentActivityPlan();
                $Obj->department_id = Department_::getMyId();
                $Obj->initiate_user_id = User_::getMyId();
                $Obj->type = $requestData['type'];
                $Obj->title = $requestData['title'];
                $Obj->content = $requestData['content'];
                $Obj->published_at = $requestData['published_at'] ?? 0;
                $Obj->more = [
                    'files' => $requestData['more_files'] ?? null,
                ];
                $Obj->save();

                $createMany = [];
                for ($i = 0; $i < count($requestData['attend_user_ids']); $i++) {
                    $createMany[] = [
                        'activity_id' => $Obj->id,
                        'user_id' => $requestData['attend_user_ids'][$i],
                        'created_at' => time(),
                        'updated_at' => time(),
                    ];
                }
                DepartmentActivityPlanUser::insert($createMany);
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
            'type' => 'required',
            'title' => 'required',
            'content' => 'required',
            'published_at' => 'required',
            'more_files' => 'required',
        ]);

        try {
            if ($validator->fails()) {
                throw new \Exception($validator->errors()->first());
            }

            DB::transaction(function () use ($ActivityPlanId, $requestData) {
                $Obj = DepartmentActivityPlan::findOrFail($ActivityPlanId);
                $Obj->type = $requestData['type'];
                $Obj->title = $requestData['title'];
                $Obj->content = $requestData['content'];
                $Obj->published_at = $requestData['published_at'] ?? 0;
                $Obj->more = [
                    'files' => $requestData['more_files'] ?? null,
                ];
                $Obj->save();

                $createMany = [];
                for ($i = 0; $i < count($requestData['attend_user_ids']); $i++) {
                    $createMany[] = [
                        'activity_id' => $Obj->id,
                        'user_id' => $requestData['attend_user_ids'][$i],
                        'created_at' => time(),
                        'updated_at' => time(),
                    ];
                }
                DepartmentActivityPlanUser::insert($createMany);

                DepartmentActivityPlanUser
                    ::where('activity_id', $Obj->id)
                    ->whereNotIn('user_id', $requestData['attend_user_ids'])
                    ->delete();
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
