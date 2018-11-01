<?php
/**
 * Created by PhpStorm.
 * User: lijingbo
 * Date: 2018/11/1
 * Time: 4:39 PM
 */

namespace App\Services\Socket\Helper;

trait FlashData
{
    private $flashData = null;

    private function getFlash()
    {
        return $this->flashData;
    }

    private function setFlash($val)
    {
        $this->flashData = $val;
    }

    private function clearFlash()
    {
        $this->flashData = null;
    }
}
