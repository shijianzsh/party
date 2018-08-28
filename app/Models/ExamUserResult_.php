<?php

namespace App\Models;

use App\Services\Exam\Exam;
use Carbon\Carbon;

class ExamUserResult_ extends ExamUserResult
{
    public const SubmitDelayTimestamp = 60;

    static public function getExamUserResultList(
        int $currPage = 0,
        int $pageNumber = 0,
        array $filter = [
            '' => "",
        ],
        array $with = []
    ): array
    {
        $Obj = ExamUserResult::with($with);

        $total = $Obj->count();

        if ($currPage && $pageNumber) {
            $offset = ($currPage - 1) * $pageNumber;
            $Obj->offset($offset)->limit($pageNumber);
        }

        $get = $Obj->get();

        return ['total' => $total ?? 0, 'rows' => $get->toArray()];
    }

    public function startExam(int $paperId): array
    {
        try {
            $paper = ExamPaper_::getExamPaper($paperId, true);
            if (!$paper) {
                throw new \Exception('查询考试信息错误');
            }
            if (!$paper->questions_count) {
                throw new \Exception('查询考试题目错误');
            }
            if ($paper->published_at > Carbon::now()->timestamp) {
                throw new \Exception('未到考试时间');
            }
            if ($paper->finished_at < Carbon::now()->timestamp) {
                throw new \Exception('已经错过了考试时间');
            }

            if ($paper->is_restrict_user == ExamPaper::IsRestrictUserMap['是']) {
                $paperUser = ExamPaperUser
                    ::where('user_id', User_::getMyId())
                    ->where('paper_id', $paperId)
                    ->first();

                if (!$paperUser) {
                    throw new \Exception('没有考试资格');
                }

                $checkResult = ExamUserResult::where('user_id', User_::getMyId())
                    ->where('paper_id', $paperId)
                    ->first();

                if ($checkResult) {
                    throw new \Exception('已经参加过该考试了');
                }
            }

            $Obj = new ExamPaperUser();
            $Obj->user_id = User_::getMyId();
            $Obj->paper_id = $paperId;
            $Obj->paper_snapshoot = $paper->toArray();
            $success = $Obj->save();
        } catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
        }

        return ['success' => $success ?? 1, 'msg' => $msg ?? null];
    }

    public function submitExam(int $examUserResultId, array $requestData): array
    {
        $validator = Validator::make($requestData, [
            'answers' => 'required',
            'is_auto_submit' => 'required',
        ]);

        //整理考试结果
        $questionsIdToIndex = [];
        for ($i = 0; $i < count($requestData['answers']); $i++) {
            $tempId = $requestData['answers'][$i]['question_id'];
            $questionsIdToIndex[$tempId] = $i;
        }

        try {
            if ($validator->fails()) {
                throw new \Exception($validator->errors()->first());
            }

            $Obj = ExamPaperUser::find($examUserResultId);
            if (!$Obj) {
                throw new \Exception('查询考试记录错误');
            }

            $paper = ExamPaper_::getExamPaper($Obj->paper_id, true);
            if (!$paper) {
                throw new \Exception('查询考试信息错误');
            }
            if (!$paper->questions_count) {
                throw new \Exception('查询考试题目错误');
            }
            if ($Obj->created_at + $paper->duration < Carbon::now()->timestamp
                && !$requestData['is_auto_submit']) {
                throw new \Exception('考试时间到，无法提交试卷。');
            }
            if ($Obj->created_at + $paper->duration < Carbon::now()->timestamp + ExamUserResult_::SubmitDelayTimestamp
                && $requestData['is_auto_submit']) {
                throw new \Exception('自动提交失败');
            }

            //评分
            $score = 0;
            foreach ($paper->questions as $question) {
                if (array_key_exists($question['id'], $questionsIdToIndex)) {
                    $tempAnswer1 = $requestData['answers'][$question['id']]['answer'];
                    $tempAnswer2 = $question['answer'];

                    if (Exam::isSameAnswers($tempAnswer1, $tempAnswer2)) {
                        $score += $question['question_score'];
                        $requestData['answers'][$question['id']]['is_correct'] = 1;
                    } else {
                        $requestData['answers'][$question['id']]['is_correct'] = 0;
                    }
                }
            }
            $isPassed = $score >= $paper->pass_score ? 1 : 0;
            $msg = $isPassed ? '恭喜您！考试通过！' : '很遗憾，没有通过考试，请再接再厉！';

            //更新记录
            $Obj->score = $score;
            $Obj->is_passed = $isPassed;
            $Obj->answers_snapshoot = $requestData['answers'];
            $success = $Obj->save();
            $data = $Obj->toArray();
        } catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
        }

        return ['success' => $success ?? 1, 'data' => $data ?? null, 'msg' => $msg ?? null];
    }
}
