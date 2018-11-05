<?php

namespace App\Models;

class ChatUserMessage_ extends ChatUserMessage
{
    static public function getMessageList(
        int $currentPage = 0,
        int $pageSize = 0,
        array $filter = [
            'from_user_id' => null,
            'to_user_id' => null,
            'start_timestamp' => null,
            'end_timestamp' => null,
        ],
        array $with = []
    ): array
    {
        $from_user_id =& $filter['from_user_id'];
        $to_user_id =& $filter['to_user_id'];
        $startTimestamp =& $filter['start_timestamp'];
        $endTimestamp =& $filter['end_timestamp'];

        $Obj = ChatUserMessage::with($with);

        $Obj->where('from_user_id', $from_user_id);
        $Obj->where('to_user_id', $to_user_id);

        if ($startTimestamp) {
            $Obj->where('created_at', '>=', $startTimestamp);
        }

        if ($endTimestamp) {
            $Obj->where('created_at', '<=', $endTimestamp);
        }

        $total = $Obj->count();

        if ($currentPage) {
            $pageSize = !$pageSize ? Department::PAGE_SIZE : $pageSize;
        } else {
            $pageSize = 0;
        }
        if ($currentPage && $pageSize) {
            $offset = ($currentPage - 1) * $pageSize;
            $Obj->offset($offset)->limit($pageSize);
        }

        $get = $Obj->get();

        return [
            'rows' => $get->toArray(),
            'pagination' => ['current' => $currentPage, 'pageSize' => $pageSize, 'total' => $total ?? 0]
        ];
    }

    //将一条聊天记录写入数据库
    static public function createMessage(int $fromUserId, int $toUserId, array $requestData): array
    {
        $validator = \Validator::make($requestData, [
            'type' => 'required',
            'message' => 'required',
        ]);

        try {
            if ($validator->fails()) {
                throw new \Exception($validator->errors()->first());
            }

            $Obj = new ChatUserMessage;
            $Obj->from_user_id = $fromUserId;
            $Obj->to_user_id = $toUserId;
            $Obj->type = $requestData['type'];
            $Obj->message = $requestData['message'];
            $Obj->save();
        } catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
        }

        return ['success' => (int)($success ?? 1), 'msg' => $msg ?? null, 'data' => $Obj->toArray() ?? null];
    }

    //将目标人员的所有聊天记录标记为已读
    static public function markChecked(int $fromUserId, int $toUserId): array
    {
        try {
            ChatUserMessage
                ::where('from_user_id', $fromUserId)
                ->where('to_user_id', $toUserId)
                ->where('is_checked', 0)
                ->update(['is_checked' => 1]);

            $data = ChatUserMessage
                ::where(function ($query) use ($fromUserId, $toUserId) {
                    $query
                        ->orWhere('from_user_id', $fromUserId)
                        ->orWhere('from_user_id', $toUserId)
                        ->orWhere('to_user_id', $fromUserId)
                        ->orWhere('to_user_id', $toUserId);
                })
                ->get()
                ->toArray();

        } catch (\Exception $e) {
            $success = 0;
            $msg = $e->getMessage();
        }

        return ['success' => (int)($success ?? 1), 'msg' => $msg ?? null, 'data' => $data ?? null];
    }
}
