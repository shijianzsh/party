<?php

namespace App\Models;

use DB;

class DepartmentWorkPlan_ extends DepartmentWorkPlan
{
    static public function getWorkPlanList(
        int $currentPage = 0,
        int $pageSize = 0,
        array $filter = [
            'initiate_user_id' => 0,
            'keyword' => null,
            'start_timestamp' =>null,
            'end_timestamp' => null,
        ],
        array $with = []
    ): array
    {
        $initiate_user_id =& $filter['initiate_user_id'];
        $keyword =& $filter['keyword'];
        $startTimestamp =& $filter['start_timestamp'];
        $endTimestamp =& $filter['end_timestamp'];

        $Obj = DepartmentWorkPlan::with(array_merge($with, ['department', 'initiateUser']));
        $Obj->orderBy('updated_at', 'desc');

        if ($initiate_user_id !== null) {
            $Obj->where('initiate_user_id', $initiate_user_id);
        }

        if (!empty($keyword)) {
            $Obj->where(function ($query) use ($keyword) {
                $query
                    ->where('title', 'like', "%{$keyword}%")
                    ->orWhere('content', 'like', "%{$keyword}%");
            });
        }

        if (!empty($startTimestamp)) {
            $Obj->where('published_at', '>=', $startTimestamp);
        }

        if (!empty($endTimestamp)) {
            $Obj->where('published_at', '<=', $endTimestamp);
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

    static public function getWorkPlan(int $WorkPlanId, array $with = []): array
    {
        return $Obj = DepartmentWorkPlan::with($with)->findOrFail($WorkPlanId)->toArray();
    }

    static public function createWorkPlan(array $requestData): array
    {
        $validator = \Validator::make($requestData, [
            'title' => 'required',
            'content' => 'required',
            'published_at' => 'required',
            'more_files' => 'required',
        ]);

        try {
            if ($validator->fails()) {
                throw new \Exception($validator->errors()->first());
            }

            DB::transaction(function () use ($requestData) {
                $Obj = new DepartmentWorkPlan();
                $Obj->department_id = Department_::getMyId();
                $Obj->initiate_user_id = User_::getMyId();
                $Obj->title = $requestData['title'];
                $Obj->content = $requestData['content'];
                $Obj->published_at = $requestData['published_at'] ?? 0;
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

    static public function updateWorkPlan(int $WorkPlanId, array $requestData): array
    {
        $validator = \Validator::make($requestData, [
            'title' => 'required',
            'content' => 'required',
            'published_at' => 'required',
            'more_files' => 'required',
        ]);

        try {
            if ($validator->fails()) {
                throw new \Exception($validator->errors()->first());
            }

            DB::transaction(function () use ($WorkPlanId, $requestData) {
                $Obj = DepartmentWorkPlan::findOrFail($WorkPlanId);
                $Obj->title = $requestData['title'];
                $Obj->content = $requestData['content'];
                $Obj->published_at = $requestData['published_at'] ?? 0;
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

    static public function deleteWorkPlan(int $WorkPlanId): array
    {
        return ['success' => DepartmentWorkPlan::destroy($WorkPlanId)];
    }
}
