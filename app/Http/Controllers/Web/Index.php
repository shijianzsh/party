<?php
/**
 * Created by PhpStorm.
 * User: lijingbo
 * Date: 2018/9/26
 * Time: 11:05 PM
 */

namespace App\Http\Controllers\Web;

use Illuminate\Http\Request;
use App\Models\PortalCategory_, App\Models\PortalPost_;

class Index extends \App\Http\Controllers\Controller
{
    public function index($isIframe = 0)
    {
        return view("index.index.index");
    }

    public function category(Request $request, $id)
    {
        try {
            $category = PortalCategory_::getCategory($id);
        } catch (\Exception $e) {
            return $e->getMessage();
        }

        $currentPage = $request->input('current_page', 1);
        $pageSize = $request->input('page_size', 10);
        $posts = PortalPost_::getPublishedPostList($currentPage, $pageSize, ['category_id' => $id]);

        return view("index.category.index", ['category' => $category, 'posts' => $posts['rows'], 'pagination' => $posts['pagination']]);
    }

    public function post($id)
    {
        try {
            $post = PortalPost_::checkPost($id);
        } catch (\Exception $e) {
            return $e->getMessage();
        }

        $nearPosts = PortalPost_::getNearPosts($id);
        return view("index.post.index", ['post' => $post, 'near_posts' => $nearPosts ?? 0]);
    }
}
