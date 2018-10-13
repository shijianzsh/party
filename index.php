<?php
/**
 * Created by PhpStorm.
 * User: lijingbo
 * Date: 2018/9/29
 * Time: 11:31 AM
 */



$pregs = '/\{|\}/';
$str="{";

if(preg_match($pregs,$str)){
    echo 'yes';
}else{
    echo 'no';
}

