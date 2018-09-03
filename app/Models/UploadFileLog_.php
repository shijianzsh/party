<?php

namespace App\Models;

class UploadFileLog_ extends UploadFileLog
{
    static public function getUploadFileLogList(
        int $currPage = 0,
        int $pageNumber = 0,
        array $filter = [
            '' => "",
        ],
        array $with = []
    ): array
    {
        $Obj = UploadFileLog::with($with);

        $total = $Obj->count();

        if ($currPage && $pageNumber) {
            $offset = ($currPage - 1) * $pageNumber;
            $Obj->offset($offset)->limit($pageNumber);
        }

        $get = $Obj->get();

        return ['total' => $total ?? 0, 'rows' => $get->toArray(), 'pagination' => ['current' => $currPage, 'page_number' => $pageNumber]];
    }

    static public function create(string $url): array
    {
        if (empty($url)) {
            $success = 0;
            goto end;
        }

        $Obj = new UploadFileLog;
        $Obj->user_id = User_::getMyId();
        $Obj->url = $url;
        $success = $Obj->save();

        end:
        return ['success' => (int)$success ?? 1, 'data' => $url];
    }
}
