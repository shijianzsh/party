<?php
/**
 * Created by PhpStorm.
 * User: lijingbo
 * Date: 2018/8/22
 * Time: 上午11:05
 */

namespace App\Services\Upload;

class Upload
{
    static public function handleUpload(): string
    {
        is_dir('upload') or mkdir('upload');
        $path = 'upload/' . date("Ymd");
        is_dir($path) or mkdir($path);

        if (!file_exists($_FILES["file"]["tmp_name"])) throw new \Exception('handleUpload temp_file !file_exists:'.json_encode($_FILES));

        $move = move_uploaded_file($_FILES["file"]["tmp_name"], $path . "/" . $_FILES["file"]["name"]);

        if (!$move) throw new \Exception('handleUpload move error');
        if (!file_exists($path . "/" . $_FILES["file"]["name"])) throw new \Exception('handleUpload file !file_exists');

        return $url = env('FILE_URL') . '/' . $path . '/' . $_FILES["file"]["name"];
    }
}
