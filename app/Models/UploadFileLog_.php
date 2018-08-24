<?php

namespace App\Models;

class UploadFileLog_ extends UploadFileLog
{
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
        return ['success' => $success];
    }
}
