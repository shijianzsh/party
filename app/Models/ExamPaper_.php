<?php

namespace App\Models;

use Carbon\Carbon;
use DB;

class ExamPaper_ extends ExamPaper
{
    static public function getExamPaperList()
    {
        //TODO
    }

    static public function getExamPaper(int $examPaperId, bool $getObject = false)
    {
        $Obj=ExamPaper::with(['questions','attendUsers'])->find($examPaperId);

        if ($getObject) {
            $result = $Obj;
        } else {
            $result = $Obj->toArray();
        }

        return $result;
    }

    //TODO 如何关联用户
    static public function createExamPaper(array $requestData): array
    {
        $validator = Validator::make($requestData, [
            'exam_category_id' => 'required',
            'per_question_score' => 'required',
            'questions_count' => 'required',
            'name' => 'required',
            'duration' => 'required',
            'is_restrict_user' => 'required',
            'pass_score' => 'required',
            'published_at' => 'required',
            'finished_at' => 'required',
        ]);

        try {
            if ($validator->fails()) {
                throw new \Exception($validator->errors()->first());
            }

            $exam_category_id =& $requestData['exam_category_id'];
            $questions_count =& $requestData['questions_count'];

            $examCategory = ExamCategory::with('questions')->find($exam_category_id);
            if (!$examCategory) {
                throw new \Exception('考题类别不存在');
            }

            $questions = $examCategory->questions->toArray();

            if (count($questions) < $questions_count) {
                throw new \Exception('出题数量大于题库数量');
            }

            shuffle($questions);
            $paperQuestions = array_slice($questions, 0, $questions_count);

            DB::transaction(function () use ($requestData, $paperQuestions) {
                $name =& $requestData['name'];
                $duration =& $requestData['duration'];
                $questions_count =& $requestData['questions_count'];
                $per_question_score =& $requestData['per_question_score'];
                $is_restrict_user =& $requestData['is_restrict_user'];
                $pass_score =& $requestData['pass_score'];
                $published_at =& $requestData['published_at'];
                $finished_at =& $requestData['finished_at'];

                $saveMany = [];
                for ($i = 0; $i < count($paperQuestions); $i++) {
                    $paperQuestions[$i]['question_id'] = $paperQuestions[$i]['id'];
                    $paperQuestions[$i]['question_score'] = $per_question_score;
                    $saveMany[] = new ExamPaperQuestion($paperQuestions[$i]);
                }

                $Obj = new ExamPaper();
                $Obj->name = $name;
                $Obj->duration = $duration;
                $Obj->is_restrict_user = $is_restrict_user;
                $Obj->max_score = $per_question_score * $questions_count;
                $Obj->pass_score = $pass_score;
                $Obj->questions_count = $questions_count;
                $Obj->published_at = $published_at;
                $Obj->finished_at = $finished_at;
                $Obj->save();

                $Obj->questions()->saveMany($saveMany);
            });
        } catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
        }

        return ['success' => $success ?? 1, 'msg' => $msg ?? null];
    }

    //TODO 如何关联用户
    static public function updateExamPaper(int $examPaperId, array $requestData): array
    {
        $validator = Validator::make($requestData, [
            'per_question_score' => 'required',
            'name' => 'required',
            'duration' => 'required',
            'is_restrict_user' => 'required',
            'pass_score' => 'required',
            'published_at' => 'required',
            'finished_at' => 'required',
        ]);

        try {
            if ($validator->fails()) {
                throw new \Exception($validator->errors()->first());
            }

            DB::transaction(function () use ($examPaperId, $requestData) {
                $name =& $requestData['name'];
                $duration =& $requestData['duration'];
                $per_question_score =& $requestData['per_question_score'];
                $is_restrict_user =& $requestData['is_restrict_user'];
                $pass_score =& $requestData['pass_score'];
                $published_at =& $requestData['published_at'];
                $finished_at =& $requestData['finished_at'];

                $Obj = ExamPaper::find($examPaperId);
                if (!$Obj) {
                    throw new \Exception('updateExamPaper ExamPaper Obj null');
                }

                $Obj->name = $name;
                $Obj->duration = $duration;
                $Obj->is_restrict_user = $is_restrict_user;
                $Obj->max_score = $per_question_score * $Obj->questions_count;
                $Obj->pass_score = $pass_score;
                $Obj->published_at = $published_at;
                $Obj->finished_at = $finished_at;
                $Obj->save();

                $Obj->questions()->update(['question_score' => $per_question_score]);
            });
        } catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
        }

        return ['success' => $success ?? 1, 'msg' => $msg ?? null];
    }

    static public function deleteExamPaper(int $examPaperId)
    {
        try {
            DB::transaction(function () use ($examPaperId) {
                $Obj = ExamPaper::find($examPaperId);
                if (!$Obj) {
                    throw new \Exception('deleteExamPaper ExamPaper Obj null');
                }

                if ($Obj->published_at <= Carbon::now()->timestamp) {
                    throw new \Exception('试卷已发布，无法删除！');
                }

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
