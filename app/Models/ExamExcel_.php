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
            '' => "",
        ],
        array $with = []
    ): array
    {
        $Obj = ExamExcel::with($with);

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

        return ['rows' => $get->toArray(), 'pagination' => ['current' => $currentPage, 'pageSize' => $pageSize, 'total' => $total ?? 0]];
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

    static public function createExamExcel(int $examCategoryId, string $fileUrl): array
    {
        $analysis = Excel::staticRun($fileUrl);
        if (!$analysis['success']) {
            return $analysis;
        }

        try {
            DB::transaction(function () use ($examCategoryId, $fileUrl, $analysis) {
                $Obj = new ExamExcel();
                $Obj->examCategoryId = $examCategoryId;
                $Obj->url = $fileUrl;
                $Obj->question_count = count((array)$analysis['data']);
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

    static public function updateExamExcel(int $examExcelId, int $examCategoryId, string $fileUrl): array
    {
        $analysis = Excel::staticRun($fileUrl);
        if (!$analysis['success']) {
            return $analysis;
        }

        try {
            DB::transaction(function () use ($examExcelId, $examCategoryId, $fileUrl, $analysis) {
                $Obj = ExamExcel::findOrFail($examExcelId);
                $Obj->examCategoryId = $examCategoryId;
                $Obj->url = $fileUrl;
                $Obj->question_count = count((array)$analysis['data']);
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
