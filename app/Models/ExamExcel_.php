<?php

namespace App\Models;

use App\Services\Excel\Excel;
use DB;

class ExamExcel_ extends ExamExcel
{
    static public function getExamExcelList(): array
    {

    }

    static public function getExamExcel(int $examExcelId): array
    {

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

        return ['success' => $success ?? 1, 'msg' => $msg ?? null];
    }

    static public function updateExamExcel(int $examExcelId, int $examCategoryId, string $fileUrl): array
    {
        $analysis = Excel::staticRun($fileUrl);
        if (!$analysis['success']) {
            return $analysis;
        }

        try {
            DB::transaction(function () use ($examExcelId, $examCategoryId, $fileUrl, $analysis) {
                $Obj = ExamExcel::find($examExcelId);
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

        return ['success' => $success ?? 1, 'msg' => $msg ?? null];
    }

    static public function deleteExamExcel(int $examExcelId): array
    {
        try {
            DB::transaction(function () use ($examExcelId) {
                $Obj = ExamExcel::find($examExcelId);
                $Obj->questions()->delete();
                $Obj->delete();
            });
        } catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
        }

        return ['success' => $success ?? 1, 'msg' => $msg ?? null];
    }
}
