<?php
/**
 * Created by PhpStorm.
 * User: lijingbo
 * Date: 2018/10/3
 * Time: 10:13 AM
 */

namespace App\Services\SMS;

class Query extends Base
{
    static public function sendDetails(
        int $currentPage = 0,
        int $pageSize = 10,
        array $filter = [
            'PhoneNumber' => null,
            'SendDate' => null,
        ]
    )
    {

    }
}
