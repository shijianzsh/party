<?php

namespace App\Models;

use App\Services\Exam\Excel;
use DB;

class ExamExcel_ extends ExamExcel
{
    static public function getExamExcelList(
        int $currentPage = 0,
        int $pageSize = 0,
        array $filter = [
            'user_id' => null
        ],
        array $with = []
    ): array
    {
        $Obj = ExamExcel::with($with);

        $userId =& $filter['user_id'];

        if ($userId !== null) {
            $Obj->where('user_id', $userId);
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

        return ['rows' => $get->toArray(), 'pagination' =>getPagination($currentPage, $pageSize, $total)];
    }

    static public function getExamExcel(int $examExcelId, bool $getObject = false)
    {
        $Obj = ExamExcel::with([])->findOrFail($examExcelId);

        if ($getObject) {
            $result = $Obj;
        } else {
            $result = $Obj->toArray();
        }

        return $result;
    }

    static public function createExamExcel(array $requestData): array
    {
        $validator = \Validator::make($requestData, [
//            'user_id' => 'user_id',
            'category_id' => 'required',
            'more_file' => 'required',
        ]);
        try {
            if ($validator->fails()) {
                throw new \Exception($validator->errors()->first());
            }

            $analysis = Excel::staticRun(public_path() . $requestData['more_file'][0]['url']);
            if (!$analysis['success']) {
                return $analysis;
            }

            DB::transaction(function () use ($requestData, $analysis) {
                $Obj = new ExamExcel();
                $Obj->user_id = $requestData['user_id'];
                $Obj->category_id = $requestData['category_id'];
                $Obj->file_url = $requestData['more_file'][0]['url'];
                $Obj->question_count = count((array)$analysis['data']);
                $Obj->more = [
                    'file' => $requestData['more_file'],
                ];
                $Obj->save();

                $saveMany = [];
                for ($i = 0; $i < count($analysis['data']); $i++) {
                    $saveMany[] = new ExamQuestion($analysis['data'][$i]);
                }
                $Obj->questions()->saveMany($saveMany);
            });
        } catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
        }

        return ['success' => (int)($success ?? 1), 'msg' => $msg ?? null];
    }

    static public function updateExamExcel(int $examExcelId, array $requestData): array
    {
        $validator = \Validator::make($requestData, [
            'user_id' => 'required',
            'category_id' => 'required',
            'more_file' => 'required',
        ]);

        try {
            if ($validator->fails()) {
                throw new \Exception($validator->errors()->first());
            }

            $analysis = Excel::staticRun(public_path() . $requestData['more_file'][0]['url']);
            if (!$analysis['success']) {
                return $analysis;
            }

            DB::transaction(function () use ($examExcelId, $requestData, $analysis) {
                $Obj = ExamExcel::findOrFail($examExcelId);
                $Obj->user_id = $requestData['user_id'];
                $Obj->category_id = $requestData['category_id'];
                $Obj->file_url = $requestData['more_file'][0]['url'];
                $Obj->question_count = count((array)$analysis['data']);
                $Obj->more = [
                    'file' => $requestData['more_file'],
                ];
                $Obj->save();

                $Obj->questions()->delete();

                $saveMany = [];
                for ($i = 0; $i < count($analysis['data']); $i++) {
                    $saveMany[] = new ExamQuestion($analysis['data'][$i]);
                }
                $Obj->questions()->saveMany($saveMany);
            });
        } catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
        }

        return ['success' => (int)($success ?? 1), 'msg' => $msg ?? null];
    }

    static public function deleteExamExcel(int $examExcelId): array
    {
        try {
            DB::transaction(function () use ($examExcelId) {
                $Obj = ExamExcel::findOrFail($examExcelId);
                $Obj->questions()->delete();
                $Obj->delete();
            });
        } catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
        }

        return ['success' => (int)($success ?? 1), 'msg' => $msg ?? null];
    }
}
