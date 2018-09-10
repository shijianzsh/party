<?php

namespace App\Models;

use DB;

class ExamCategory_ extends ExamCategory
{
    static public function getExamCategoryList(
        int $currentPage = 0,
        int $pageSize = 0,
        array $filter = [
//            'user_id' => 0,
//            'to_user_id' => 0,
        ],
        array $with = []
    ): array
    {
        $Obj = ExamCategory::with($with);

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

    static public function getExamCategory(int $ExamCategoryId, array $with = []): array
    {
        return $Obj = ExamCategory::with($with)->findOrFail($ExamCategoryId)->toArray();
    }

    static public function createExamCategory(array $requestData): array
    {
        $validator = \Validator::make($requestData, [
            'name' => 'required',
        ]);

        try {
            if ($validator->fails()) {
                throw new \Exception($validator->errors()->first());
            }

            DB::transaction(function () use ($requestData) {
                $Obj = new ExamCategory();
                $Obj->name = $requestData['name'];
                $Obj->save();
            });
        } catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
        }

        return ['success' => (int)($success ?? 1), 'msg' => $msg ?? null];
    }

    static public function updateExamCategory(int $ExamCategoryId, array $requestData): array
    {
        $validator = \Validator::make($requestData, [
            'name' => 'required',
        ]);

        try {
            if ($validator->fails()) {
                throw new \Exception($validator->errors()->first());
            }

            DB::transaction(function () use ($ExamCategoryId, $requestData) {
                $Obj = ExamCategory::findOrFail($ExamCategoryId);
                $Obj->name = $requestData['name'];
                $Obj->save();
            });
        } catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
        }

        return ['success' => (int)($success ?? 1), 'msg' => $msg ?? null];
    }

    static public function deleteExamCategory(int $ExamCategoryId): array
    {
        return ['success' => ExamCategory::destroy($ExamCategoryId)];
    }
}
