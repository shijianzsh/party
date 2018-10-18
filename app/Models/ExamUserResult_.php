<?php

namespace App\Models;

use App\Services\Exam\Exam;
use Carbon\Carbon;
use DB;

class ExamUserResult_ extends ExamUserResult
{
    public const SubmitDelayTimestamp = 60;

    static public function getExamUserResultList(
        int $currentPage = 0,
        int $pageSize = 0,
        array $filter = [
            'user_id' => null,
            'start_timestamp' => 0,
            'end_timestamp' => 0
        ],
        array $with = []
    ): array
    {
        $userId =& $filter['user_id'];
        $startTimestamp =& $filter['start_timestamp'];
        $endTimestamp =& $filter['end_timestamp'];

        $Obj = ExamUserResult::with($with);

        if (!empty($userId)) {
            $Obj->where('user_id', $userId);
        }

        if ($startTimestamp) {
            $Obj->where('created_at', '>=', $startTimestamp);
        }

        if ($endTimestamp) {
            $Obj->where('created_at', '<=', $endTimestamp);
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

    static public function getExamUserSubmittedResultList(
        int $currentPage = 0,
        int $pageSize = 0,
        array $filter = [
            'user_id' => null,
            'start_timestamp' => 0,
            'end_timestamp' => 0
        ],
        array $with = []
    ): array
    {
        $userId =& $filter['user_id'];
        $startTimestamp =& $filter['start_timestamp'];
        $endTimestamp =& $filter['end_timestamp'];

        $Obj = ExamUserResult::with($with);

        if (!empty($userId)) {
            $Obj->where('user_id', $userId)
                ->where('is_submitted', 1);
        }

        if ($startTimestamp) {
            $Obj->where('created_at', '>=', $startTimestamp);
        }

        if ($endTimestamp) {
            $Obj->where('created_at', '<=', $endTimestamp);
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

    static public function getExamUserResult(int $id, bool $getObject = false)
    {
        $Obj = ExamUserResult::with(['user', 'paper'])->find($id);

        if ($getObject) {
            $result = $Obj;
        } else {
            $result = $Obj ? $Obj->toArray() : $Obj;
        }

        return $result;
    }

    static public function getUserExamResultByPaperId($user_id, $paper_id)
    {
        $Obj = ExamUserResult
            ::where('user_id', $user_id)
            ->where('paper_id', $paper_id)
            ->first();
        return $Obj;
    }

    static public function startExam(int $paperId, int $userId): array
    {
        try {
            $paper = ExamPaper_::getExamPaper($paperId, true);
            if (!$paper->questions_count) {
                throw new \Exception('查询考试题目错误');
            }
            if ($paper->published_at > Carbon::now()->timestamp) {
                throw new \Exception('未到考试时间');
            }
            if ($paper->finished_at < Carbon::now()->timestamp) {
                throw new \Exception('已经错过了考试时间');
            }

            if ($paper->is_restrict_user == ExamPaper::IS_RESTRICT_USER['是']) {
                $paperUser = ExamPaperUser
                    ::where('user_id', $userId)
                    ->where('paper_id', $paperId)
                    ->first();

                if (!$paperUser) {
                    throw new \Exception('您没有考试资格');
                }
            }

            $checkResult = ExamUserResult::where('user_id', $userId)
                ->where('paper_id', $paperId)
                ->first();

            if ($checkResult && $checkResult->is_submitted) {
                throw new \Exception('您已经参加过考试了');
            }

            if ($checkResult) {
                $checkResult->delete();
            }

            $Obj = new ExamUserResult();
            $Obj->user_id = $userId;
            $Obj->paper_id = $paperId;
            $Obj->paper_snapshot = $paper->toArray();
            $success = $Obj->save();

            $data = $Obj;
        } catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
        }

        end:
        return ['success' => (int)($success ?? 1), 'data' => $data ?? null, 'msg' => $msg ?? null];
    }

    static public function submitExam(int $examUserResultId, array $requestData): array
    {
        $validator = \Validator::make($requestData, [
            'answers' => 'required',
            'is_auto_submit' => 'required',
        ]);

        try {
            if ($validator->fails()) {
                throw new \Exception($validator->errors()->first());
            }

            $answers = $requestData['answers'];
            //整理考试结果
            $questionsIdToIndex = [];

            for ($i = 0; $i < count($answers); $i++) {
                if (empty($answers[$i]['user_answers'])) {
                    throw new \Exception('试卷存在未作答的题目');
                }

                $tempId = $answers[$i]['question_id'];
                $questionsIdToIndex[$tempId] = $i;
            }

            $Obj = ExamUserResult::find($examUserResultId);
            if (!$Obj) {
                throw new \Exception('查询考试记录错误');
            }
            if ($Obj->is_submitted) {
                throw new \Exception('您已经参加过考试了');
            }
            $paper = ExamPaper_::getExamPaper($Obj->paper_id, true);
            if (!$paper) {
                throw new \Exception('查询试卷信息错误');
            }
            if ($paper->questions_count !== count($questionsIdToIndex)) {
                throw new \Exception('答案数量错误');
            }

            if (($Obj->created_at->timestamp + $paper->duration * 60 < Carbon::now()->timestamp)
                && !$requestData['is_auto_submit']) {
                throw new \Exception('考试时间到，无法提交试卷。');
            }
            if ($Obj->created_at->timestamp + $paper->duration < Carbon::now()->timestamp + ExamUserResult_::SubmitDelayTimestamp
                && $requestData['is_auto_submit']) {
                throw new \Exception('自动提交失败');
            }

            //评分
            $score = 0;
            foreach ($paper->questions as $question) {
                $key = $question['question_id'];
                if (array_key_exists($key, $questionsIdToIndex)) {
                    $tempAnswer1 = $answers[$questionsIdToIndex[$key]]['user_answers'];
                    $tempAnswer2 = $question['answers'];

                    if (Exam::isSameAnswers($tempAnswer1, $tempAnswer2)) {
                        $score += $question['question_score'];
                        $answers[$questionsIdToIndex[$key]]['is_correct'] = 1;
                    } else {
                        $answers[$questionsIdToIndex[$key]]['is_correct'] = 0;
                    }
                }
            }
            $isPassed = $score >= $paper->pass_score ? 1 : 0;
            $msg = $isPassed ? '恭喜您！考试通过！' : '很遗憾，没有通过考试，请再接再厉！';
            //更新记录
            $Obj->is_submitted = 1;
            $Obj->score = $score;
            $Obj->is_passed = $isPassed;
            $Obj->answers_snapshot = $answers;
            $success = $Obj->save();
            $data = $Obj->toArray();
        } catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
        }

        return ['success' => (int)($success ?? 1), 'data' => $data ?? null, 'msg' => $msg ?? null];
    }
}
