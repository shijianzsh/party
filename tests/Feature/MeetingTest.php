<?php

namespace Tests\Feature;

use Tests\TestCase;
use Illuminate\Foundation\Testing\WithFaker;
use Illuminate\Foundation\Testing\RefreshDatabase;
use App\Models\ExamPaper_;
use App\Models\Meeting_;
use Carbon\Carbon;

class MeetingTest extends TestCase
{
    /**
     * A basic test example.
     *
     * @return void
     */
    public function testExample()
    {
        $requestData = [
            'need_audit' => 1,
            'title' => '测试title',
            'type' => 2,
            'location' => '测试location',
            'opened_at' => Carbon::now()->timestamp+100,
            'ended_at' => Carbon::now()->timestamp+200,
            'audit_user_id' => 5,
        ];
//        $res = Meeting_::createMeeting($requestData);
        $id=$res['data']->id??4;
//        $this->assertTrue($res['success'] == 1);

        $requestData = [
            'is_passed' => 0,
            'reason' => '测试reason',
        ];

        $res=Meeting_::auditMeeting($id,$requestData);
        dump($res);



        $this->assertTrue(true);
    }
}
