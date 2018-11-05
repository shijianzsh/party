<?php

namespace App\Models;

class ExamUserCollectQuestion_ extends ExamUserCollectQuestion
{
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
                    'snapshot' => $questions[$i],
                ]
            );
        }

        return (bool)$user->examCollectQuestions()->saveMany($saveData);
    }
}
