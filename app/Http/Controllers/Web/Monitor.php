<?php
/**
 * Created by PhpStorm.
 * User: lijingbo
 * Date: 2018/9/26
 * Time: 11:05 PM
 */

namespace App\Http\Controllers\Web;

class Monitor extends \App\Http\Controllers\Controller
{
    public function index()
    {
        return view("monitor.index.index");
    }

    public function department($id=0)
    {
        return view("monitor.department.index");
    }

    public function partyMember()
    {
        return view("monitor.party_member.index");
    }

    public function partyBusiness()
    {
        return view("monitor.party_business.index");
    }

    public function meeting()
    {
        return view("monitor.meeting.index");
    }

    public function learning()
    {
        return view("monitor.learning.index");
    }
}
