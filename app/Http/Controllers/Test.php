<?php
/**
 * Created by PhpStorm.
 * User: lijingbo
 * Date: 2018/8/22
 * Time: 下午4:38
 */

namespace App\Http\Controllers;
use App\Services\Excel\Excel;
use App\Models\ExamExcel_;

class Test
{
    public function __invoke()
    {
        $a= ExamExcel_::updateExamExcel(9,11,'./2.xlsx');
        dump($a);
    }
}
