<?php

namespace App\Models;

use Carbon\Carbon;
use DB;

class ExamPaper_ extends ExamPaper
{
    static public function getExamPaperList(
        int $currentPage = 0,
        int $pageSize = 0,
        array $filter = [
            'attend_user_id' => null,
        ],
        array $with = []
    ): array
    {
        $Obj = ExamPaper::with($with);

        $attendUserId =& $filter['attend_user_id'];

        if ($attendUserId !== null) {
            //获取用户可以参加考试的列表，包含任意时间段
            $Obj->where(function ($query) use ($attendUserId) {
                $query->where('is_restrict_user', 0)
                    ->orWhere(function ($query) use ($attendUserId) {
                        $query->where('is_restrict_user', 1)
                            ->whereHas('attendUsersMiddle', function ($query) use ($attendUserId) {
                                $query->where('exam_paper_user.user_id', $attendUserId);
                            });
                    });
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

        return ['rows' => $get->toArray(), 'pagination' => ['current' => $currentPage, 'pageSize' => $pageSize, 'total' => $total ?? 0]];
    }

    static public function getExamPaper(int $examPaperId, bool $getObject = false)
    {
        $Obj = ExamPaper::with(['questions', 'attendUsers'])->findOrFail($examPaperId);

        if ($getObject) {
            $result = $Obj;
        } else {
            $result = $Obj->toArray();
        }

        return $result;
    }

    static public function createExamPaper(array $requestData): array
    {
        $validator = \Validator::make($requestData, [
            'exam_category_id' => 'required',
            'per_question_score' => 'required',
            'questions_count' => 'required',
            'name' => 'required',
            'duration' => 'required',
            'is_restrict_user' => 'required',
            'user_ids' => 'required',
            'pass_score' => 'required',
            'published_at' => 'required',
            'finished_at' => 'required',
            'more_thumbnail' => 'required',
        ]);

        try {
            if ($validator->fails()) {
                throw new \Exception($validator->errors()->first());
            }

            if ($requestData['published_at'] >= $requestData['finished_at']) {
                throw new \Exception('结束日期不能小于发布日期');
            }
            if ($requestData['published_at'] <= Carbon::now()->timestamp) {
                throw new \Exception('发布日期不可以小于当前时间');
            }

            $exam_category_id =& $requestData['exam_category_id'];
            $questions_count =& $requestData['questions_count'];

            $examCategory = ExamCategory::with('questions')->findOrFail($exam_category_id);
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

                $Obj = new ExamPaper();
                $Obj->name = $name;
                $Obj->duration = $duration;
                $Obj->is_restrict_user = $is_restrict_user;
                $Obj->max_score = $per_question_score * $questions_count;
                $Obj->pass_score = $pass_score;
                $Obj->questions_count = $questions_count;
                $Obj->published_at = $published_at;
                $Obj->finished_at = $finished_at;
                $Obj->more = [
                    'thumbnail' => $requestData['more_thumbnail'] ?? null,
                ];
                $Obj->save();

                $saveMany = [];
                for ($i = 0; $i < count($paperQuestions); $i++) {
                    $paperQuestions[$i]['question_id'] = $paperQuestions[$i]['id'];
                    $paperQuestions[$i]['question_score'] = $per_question_score;
                    $saveMany[] = new ExamPaperQuestion($paperQuestions[$i]);
                }
                $Obj->questions()->saveMany($saveMany);

                if ((bool)$Obj->is_restrict_user) {
                    $saveMany = [];
                    for ($i = 0; $i < count($requestData['user_ids']); $i++) {
                        $paperQuestions[$i]['user_id'] = $requestData['user_ids'][$i];
                        $saveMany[] = new ExamPaperUser($paperQuestions[$i]);
                    }
                    $Obj->attendUsersMiddle()->saveMany($saveMany);
                }
            });
        } catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
        }

        return ['success' => (int)($success ?? 1), 'msg' => $msg ?? null];
    }

    static public function updateExamPaper(int $examPaperId, array $requestData): array
    {
        $validator = \Validator::make($requestData, [
            'per_question_score' => 'required',
            'name' => 'required',
            'duration' => 'required',
//            'is_restrict_user' => 'required',
            'pass_score' => 'required',
            'published_at' => 'required',
            'finished_at' => 'required',
            'more_thumbnail' => 'required',
        ]);

        try {
            if ($validator->fails()) {
                throw new \Exception($validator->errors()->first());
            }

            if ($requestData['published_at'] >= $requestData['finished_at']) {
                throw new \Exception('结束日期不能小于发布日期');
            }
            if ($requestData['published_at'] <= Carbon::now()->timestamp) {
                throw new \Exception('发布日期不可以小于当前时间');
            }

            DB::transaction(function () use ($examPaperId, $requestData) {
                $name =& $requestData['name'];
                $duration =& $requestData['duration'];
                $per_question_score =& $requestData['per_question_score'];
                $is_restrict_user =& $requestData['is_restrict_user'];
                $pass_score =& $requestData['pass_score'];
                $published_at =& $requestData['published_at'];
                $finished_at =& $requestData['finished_at'];

                $Obj = ExamPaper::findOrFail($examPaperId);
                if (!$Obj) {
                    throw new \Exception('updateExamPaper ExamPaper Obj null');
                }

                if ($Obj->published_at <= Carbon::now()->timestamp) {
                    throw new \Exception('已开考了，不允许修改');
                }

                $Obj->name = $name;
                $Obj->duration = $duration;
//                $Obj->is_restrict_user = $is_restrict_user;
                $Obj->max_score = $per_question_score * $Obj->questions_count;
                $Obj->pass_score = $pass_score;
                $Obj->published_at = $published_at;
                $Obj->finished_at = $finished_at;
                $Obj->more = [
                    'thumbnail' => $requestData['more_thumbnail'] ?? null,
                ];
                $Obj->save();

                $Obj->questions()->update(['question_score' => $per_question_score]);
            });
        } catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
        }

        return ['success' => (int)($success ?? 1), 'msg' => $msg ?? null];
    }

    static public function deleteExamPaper(int $examPaperId)
    {
        try {
            DB::transaction(function () use ($examPaperId) {
                $Obj = ExamPaper::findOrFail($examPaperId);
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

        return ['success' => (int)($success ?? 1), 'msg' => $msg ?? null];
    }
}
