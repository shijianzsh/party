<?php
/**
 * Created by PhpStorm.
 * User: lijingbo
 * Date: 2018/10/3
 * Time: 11:49 PM
 */

namespace App\Http\Controllers\Api;

use App\Services\SMS\SMS;
use App\Services\Socket\Push;
use App\Models\AuthMap_;
use function foo\func;
use DB;

class Test extends \App\Http\Controllers\Controller
{
    function __invoke()
    {
        $data = $this->getData();
        var_dump($data);
        exit;
        $insert = $this->insertToDb($data);
        echo 'finished';
    }

    private function getData(): array
    {
        $getBasis = function (string $str): array {
            $str = str_replace(",", "!!!", $str);
            $str = str_replace("，", "!!!", $str);
            $tempArr = explode('!!!', $str);

            $result = [];
            for ($i = 0; $i < count($tempArr); $i++) {
                $result[] = [
                    'id' => $i,
                    'name' => $tempArr[$i],
                ];
            }
            return $result;
        };
        $getNumber = function (string $str): int {
            return (int)$str;
        };
        $getTimestamp = function (int $num): int {
            return ($num - 70 * 365 - 19) * 86400 - 8 * 3600;
        };
        $get抽样计划和单号 = function (array &$row): string {
            $result = $row['抽样计划 jihua'] . '/' . $row['抽样单编号 bianhao'];
            unset($row['抽样计划 jihua']);
            unset($row['抽样单编号 bianhao']);
            return $result;
        };
        $getBarcode = function (string $str, $row): int {
            if (is_numeric($str)) {
                return (int)$str;
            }

            $str = str_replace("（", "!!!", $str);
            $str = str_replace("）", "!!!", $str);
            $str = str_replace("(", "!!!", $str);
            $str = str_replace(")", "!!!", $str);

            $tempArr = explode('!!!', $str);

            for ($i = 0; $i < count($tempArr); $i++) {
                $temp = (int)$tempArr[$i];
                if ($temp && strlen($temp) === 13) {
                    return $temp;
                }
//                if (strlen($temp) !== 13) {
//                    dump($row['编号 intact_number']);
//                    dump(strlen($temp));
//                    dump($temp);
//                    dump($tempArr);
//                }
            };

            throw new \Exception('$getBarcode 出错了');
        };
        $formatRNumber = function (string $str, &$row) {
            $temp = explode('-', $str);
            if (count($temp) !== 2) {
                throw new \Exception('$formatRNumber error 1');
            }
            if (((int)$temp[0]) != $temp[0]) {
                throw new \Exception('$formatRNumber error 2');
            }
            if (((int)$temp[1]) != $temp[1]) {
                throw new \Exception('$formatRNumber error 3');
            }

            $row['编号 r_number_ending'] = $temp[0];
            $row['编号 r_number_year'] = $temp[1];
        };

        $a = new \App\Services\Exam\Excel();
        $arr = $a->justReadFile('./2018.xlsx');

        for ($i = 0; $i < count($arr); $i++) {
            $row =& $arr[$i];

            foreach ($row as $key => &$value) {
                $keyArr = explode(' ', $key);
                if (count($keyArr) < 2) {
                    unset($row[$key]);
                    continue;
                }
                switch ($key) {
                    case '样品数 sample_size':
                    case '抽样基数 ms_rm_supervise sample_base':
                        $value = $getNumber($value);
                        break;
                    case '检验依据 basis':
//                        $value = json_encode($getBasis($value));
                        $value = $getBasis($value);
                        break;
                    case '要求完成日期 completion_time':
                    case '抽样日期 ms_rm_supervise sampling_date':
                    case '到样日期 sample_date':
                        $value = $getTimestamp((int)$value);
                        break;
                    case '抽样计划/抽样单号 ms_rm_supervise sampling_plan':
                        $value = $get抽样计划和单号($row);
                        break;
                    case '其他资料 barcode':
                        $value = $getBarcode($value, $row);
                        break;
                    case '编号 intact_number':
                        $formatRNumber($value, $row);
                        break;

                }
            }
        }

        for ($i = 0; $i < count($arr); $i++) {
            $row =& $arr[$i];

            $temp = [];

            foreach ($row as $key => &$value) {
                $keyArr = explode(' ', $key);
                $temp[implode(' ', array_slice($keyArr, 1))] = $value;
            }
            $row = $temp;
        }

        return $arr;
    }

    private function insertToDb(array $arr)
    {
        for ($i = 0; $i < count($arr); $i++) {
            $row = $arr[$i];

            $toInsertData_main = [
                'status' => '等待检验',
                'type' => '监督抽查',
                'cost' => 0,
                'time' => $row['sample_date'],
            ];
            $toInsertData_supervise = [
                'r_number' => $row['r_number_prefix'] . $row['intact_number'],
                'time' => $row['sample_date'],
            ];

            foreach ($row as $key => $value) {
                $keyArr = explode(' ', $key);
                if (count($keyArr) === 1) {
                    switch ($key){
                        case 'intact_number':
                            $toInsertData_main[$key] = $row['r_number_prefix'] . $row['intact_number'];
                            break;
                        default:
                            $toInsertData_main[$key] = $value;
                            break;
                    }
                } else {
                    $toInsertData_supervise[$keyArr[1]] = $value;
                }
            }

            $mainId = DB::table('ms_report_master')->insertGetId($toInsertData_main);
            $toInsertData_supervise['rmid'] = $mainId;
            DB::table('ms_rm_supervise')->insert($toInsertData_supervise);
        }
    }
}
