<?php
/**
 * Created by PhpStorm.
 * User: lijingbo
 * Date: 2018/11/1
 * Time: 2:30 AM
 */

namespace App\Services\Socket\Helper;

use App\Services\Socket\MainWorker;

trait Learning
{
    private $LEARNING_SEND_KEY_MAP = [
        '记录' => 'learning_record',
    ];

    private function learningRecordRequest(int $type, int $userId, int $targetId)
    {
        return RequestHelper::post("api/user_learning_records",
            ['data' => ['type' => $type, 'user_id' => $userId, 'target_id' => $targetId]]);
    }

    public function learningRecord(array $data = ['type' => null, 'target_id' => null])
    {
        try {
            if (!($data['target_id'] ?? null) || !($data['type'] ?? null))
                throw new \Exception('learningRecord');

            $userId = $this->uid()->get();
            $request = $this->learningRecordRequest($data['type'], $userId, $data['target_id']);

            $this->sendToEventUid(MainWorker::ON_MESSAGE_REQUEST_KEY_EVENT['学习'],
                $userId,
                ['key' => $this->LEARNING_SEND_KEY_MAP['记录'], 'request' => $request]);
        } catch (\Exception $e) {
            var_export([
                $e->getMessage(),
                $e->getFile(),
                $e->getLine(),
            ]);
        }

    }
}
