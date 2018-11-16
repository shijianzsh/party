<?php
/**
 * Created by PhpStorm.
 * User: lijingbo
 * Date: 2018/8/21
 * Time: 下午9:53
 */

namespace App\Services\Exam;

use PFinal\Excel\Excel as ExcelClass;
use App\Services\CheckParams\CheckParams;

class Excel
{
    public const Map = [
        'excel_index' => '序号',
        'title' => '题目',
        'options' => '选项',
        'answers' => '答案',
        'disabled' => '是否禁用'
    ];

    private $data;

    private function readFile($file,$titleRow=1): Excel
    {
        if (!file_exists($file)) {
            throw new \Exception('Excel readFile file does not exists');
        }

        $this->data = ExcelClass::readExcelFile($file, Excel::Map, $titleRow);
        return $this;
    }

    private function analyzeData(): Excel
    {
        $data = $this->data;

        $checkParams = CheckParams::checkParams($data, array_keys(Excel::Map));
        if (!$checkParams['success']) {
            throw new \Exception($checkParams['msg']);
        }

        for ($i = 0; $i < count($data); $i++) {
            $data[$i]['excel_index'] = (int)$data[$i]['excel_index'];
            $data[$i]['disabled'] = (int)$data[$i]['disabled'];
        }

        $index = array_column($data, '序号');

        if (count($index) !== count(array_unique($index))) {
            throw new \Exception('存在重复或不合法的序号');
        }

        $this->data = $data;

        return $this;
    }

    private function analyzeDataOptions(): Excel
    {
        $data = $this->data;

        for ($i = 0; $i < count($data); $i++) {
            $data[$i]['options'] = explode(';', $data[$i]['options']);

            $length = count($data[$i]['options']);

            if (!$length) {
                $msg = "解析选项错误1：请检查序号为 {$data[$i]['excel_index']} 的题目";
                throw new \Exception($msg);
            }

            $tempArr = [];
            for ($j = 0; $j < count($data[$i]['options']); $j++) {
                $temp = explode(':', $data[$i]['options'][$j]);
                $tempLength = count($temp);

                if ($tempLength !== 2) {
                    $msg = "解析选项错误2：请检查序号为 {$data[$i]['excel_index']} 的题目";
                    throw new \Exception($msg);
                }
                $tempArr[$temp[0]] = $temp[1];
            }
            if (count($tempArr) !== $length) {
                $msg = "解析选项错误3：请检查序号为 {$data[$i]['excel_index']} 的题目";
                throw new \Exception($msg);
            }

            $data[$i]['options'] = $tempArr;
        }

        $this->data = $data;
        return $this;
    }

    private function analyzeDataAnswers(): Excel
    {
        $data = $this->data;

        for ($i = 0; $i < count($data); $i++) {
            $data[$i]['answers'] = explode(';', $data[$i]['answers']);

            for ($j = 0; $j < count($data[$i]['answers']); $j++) {
                if (strlen($data[$i]['answers'][$j]) !== 1) {
                    $msg = "解析答案错误：请检查序号为 {$data[$i]['excel_index']} 的题目";
                    throw new \Exception($msg);
                }
            }
        }
        $this->data = $data;
        return $this;
    }

    private function getData()
    {
        if (empty($this->data)) {
            throw new \Exception('Excel getData data empty');
        }
        return $this->data;
    }

    public function run($file): array
    {
        try {
            $data = $this
                ->readFile($file,3)
                ->analyzeData()
                ->analyzeDataOptions()
                ->analyzeDataAnswers()
                ->getData();
        } catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
        }

        return ['success' => $success ?? 1, 'data' => $data ?? null, 'msg' => $msg ?? null];
    }

    static public function staticRun($file): array
    {
        $Obj = new Excel;
        return $Obj->run($file);
    }

    public function justReadFile($file): array
    {
        $this->readFile($file);
        return $this->data;
    }
}
