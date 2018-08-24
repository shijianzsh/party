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

        move_uploaded_file($_FILES["file"]["tmp_name"], $path . "/" . $_FILES["file"]["name"]);
        return $url = '/' . $path . '/' . $_FILES["file"]["name"];
    }
}
