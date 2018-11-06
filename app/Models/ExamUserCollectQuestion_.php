<?php

namespace App\Models;

class ExamUserCollectQuestion_ extends ExamUserCollectQuestion
{
    static public function getCollectQuestionList(
        int $currentPage = 0,
        int $pageSize = 0,
        array $filter = [
            'keyword' => null,
            'user_id' => null,
            'paper_id' => null,
            'start_timestamp' =>null,
            'end_timestamp' =>null,
        ],
        array $with = []
    ): array
    {
        $Obj = ExamUserCollectQuestion::with($with);

        $keyword =& $filter['keyword'];
        $userId =& $filter['user_id'];
        $paperId =& $filter['paper_id'];
        $startTimestamp =& $filter['start_timestamp'];
        $endTimestamp =& $filter['end_timestamp'];

        $Obj->where(function ($query) use ($keyword) {
            $query
                ->where('title', 'like', "%{$keyword}%");
        });

        if (!empty($userId)) {
            $Obj->where('user_id', $userId);
        }

        if (!empty($paperId)) {
            $Obj->where('paper_id', $paperId);
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

    static public function createCollectQuestion(int $userId, array $question)
    {

    }

    static public function createCollectQuestions(int $userId, array $questions): bool
    {
        $user = User::find($userId);

        $saveData = [];
        for ($i = 0; $i < count($questions); $i++) {
            $saveData[] = new ExamUserCollectQuestion(
                [
                    'paper_id' => $questions[$i]['paper_id'],
                    'question_id' => $questions[$i]['paper_id'],
                    'title' => $questions[$i]['title'],
                    'snapshot' => $questions[$i],
                ]
            );
        }

        return (bool)$user->examCollectQuestions()->saveMany($saveData);
    }

    static public function deleteCollectQuestion(int $id): array
    {
        try {
            $Obj = ExamUserCollectQuestion::findOrFail($id);
            $Obj->delete();
        } catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
        }

        return ['success' => (int)($success ?? 1), 'msg' => $msg ?? null];
    }
}
