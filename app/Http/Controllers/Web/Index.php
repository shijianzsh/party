<?php
/**
 * Created by PhpStorm.
 * User: lijingbo
 * Date: 2018/9/26
 * Time: 11:05 PM
 */

namespace App\Http\Controllers\Web;

use App\Models\PortalPost_;

class Index extends \App\Http\Controllers\Controller
{
    public function index($isIframe = 0)
    {
        return view("index.index");
    }

    public function category($id)
    {
        return view("index.category");
    }

    public function post($id)
    {
        try {
            $data = PortalPost_::checkPost($id);
        } catch (\Exception $e) {
            return $e->getMessage();
        }
        $nearPosts = PortalPost_::getNearPosts($id);
        return view("index.post", ['data' => $data, 'near_posts' => $nearPosts ?? 0]);
    }
}
