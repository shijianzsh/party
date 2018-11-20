<?php

namespace App\Models;

use DB;
use phpDocumentor\Reflection\Types\Parent_;

class UserLearningRecord_ extends UserLearningRecord
{
    static public function getLearningRecordList(
        int $currentPage = 0,
        int $pageSize = 0,
        array $filter = [
            'user_id' => 0,
            'start_timestamp' => 0,
            'end_timestamp' => 0,
        ],
        array $with = []
    ): array
    {
        $userId =& $filter['user_id'];
        $startTimestamp =& $filter['start_timestamp'];
        $endTimestamp =& $filter['end_timestamp'];

        $Obj = UserLearningRecord::with($with);

        if ($userId) {
            $Obj->where('user_id', $userId);
        }

        if ($startTimestamp) {
            $Obj->where('updated_at', '>=', $startTimestamp);
        }

        if ($endTimestamp) {
            $Obj->where('updated_at', '<=', $endTimestamp);
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

//        $Obj->orderBy('updated_at', 'desc');
        $get = $Obj->get();

        return ['rows' => $get->toArray(), 'pagination' => getPagination($currentPage, $pageSize, $total)
        ];
    }

    static public function getLearningRecord(int $learningRecordId, array $with = []): array
    {
        return $Obj = UserLearningRecord::with($with)->findOrFail($learningRecordId)->toArray();
    }

    static public function recordLearningRecord(int $learningRecordId, array $requestData): array
    {
        $validator = \Validator::make($requestData, [
            'user_id' => 'required',
            'type' => 'required',
            'target_id' => 'required',
        ]);

        try {
            if ($validator->fails()) {
                throw new \Exception($validator->errors()->first());
            }

            $update = -1;
            $save = -1;
            DB::transaction(function () use ($learningRecordId, $requestData, &$update, &$save) {
                switch ($requestData['type']) {
                    case self::TYPE['图文']:
                    case self::TYPE['视频']:
                        $post_id = $requestData['target_id'];
                        $live_id = 0;
                        break;
                    case self::TYPE['直播']:
                        $post_id = 0;
                        $live_id = $requestData['target_id'];
                        break;
                    default:
                        throw new \Exception('recordLearningRecord error code:1');
                }


                $Obj = new parent();
                $update = $Obj->increment('duration_record', 1,
                    [
                        'type' => $requestData['type'],
                        'user_id' => $requestData['user_id'],
                        'post_id' => $post_id,
                        'live_id' => $live_id,
                    ]);

                if ($learningRecordId && !$update) {
                    throw new \Exception('recordLearningRecord error code:2');
                }

                if (!$learningRecordId && !$update) {
                    $Obj = new parent();
                    $Obj->type = $requestData['type'];
                    $Obj->user_id = $requestData['user_id'];
                    $Obj->post_id = $post_id;
                    $Obj->live_id = $live_id;
                    $Obj->duration_record = 1;
                    $save = $Obj->save();
                }
            });
        } catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
        }

        return ['success' => (int)($success ?? 1), 'msg' => $msg ?? null, 'data' => [$update, $save]];
    }

    static public function deleteLearningRecord(int $learningRecordId): array
    {
        try {
            $success = UserLearningRecord::destroy($learningRecordId);
        } catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
        }

        return ['success' => (int)($success ?? 1), 'msg' => $msg ?? null];
    }

    static public function getLearningRecordDuration(int $userId)
    {
        try {
            $temp = [];
            $types = array_values(UserLearningRecord::TYPE);
            for ($i = 0; $i < count($types); $i++) {
                $type = $types[$i];
                $temp[$type] = 0;
            }

            $record = self::getLearningRecordList(0, 0, ['user_id' => $userId], [])['rows'];
            for ($i = 0; $i < count($record); $i++) {
                $row = $record[$i];
                if (!array_key_exists($row['type'], $temp)) {
                    throw new \Exception('getLearningRecordDuration key exist error 1');
                }
                $temp[$row['type']] += $row['duration_record'];
            }

            $typeFlip = array_flip(UserLearningRecord::TYPE);
            $result = [];
            $sumDuration = 0;
            foreach ($temp as $type => $duration) {
                if (!array_key_exists($type, $typeFlip)) {
                    throw new \Exception('getLearningRecordDuration key exist error 2');
                }
                $result[] = [
                    'type' => $type,
                    'type_format' => $typeFlip[$type],
                    'duration_record' => $duration,
                ];
                $sumDuration += $duration;
            }
            $result[]=[
                'type' => null,
                'type_format' => '总计',
                'duration_record' => $sumDuration,
            ];
        } catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
        }

        return ['success' => (int)($success ?? 1), 'msg' => $msg ?? null, 'data' => $result ?? null];
    }
}
