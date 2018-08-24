<?php

namespace Tests\Feature;

use Tests\TestCase;
use Illuminate\Foundation\Testing\WithFaker;
use Illuminate\Foundation\Testing\RefreshDatabase;
use App\Models\ExamPaper_;

class PaperTest extends TestCase
{
    /**
     * A basic test example.
     *
     * @return void
     */
    public function testExample()
    {
        $requestData = [
            'exam_category_id' => 1,
            'name' => '测试paper111',
            'duration' => 501,
            'is_restrict_user' => 0,
            'pass_score' => 88,
            'questions_count' => 2,
            'per_question_score' => 18,
            'published_at' => '55115',
            'finished_at' => '55115',
        ];
//        $res = ExamPaper_::createExamPaper($requestData);
//        $res = ExamPaper_::updateExamPaper(16,$requestData);
        $res = ExamPaper_::deleteExamPaper(6);
        $this->assertTrue(true);
    }
}
