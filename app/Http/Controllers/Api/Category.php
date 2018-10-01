<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Models\PortalCategory_, App\Models\PortalPost_;

class Category extends \App\Http\Controllers\Controller
{
    /**
     * 根据category_id获取子categories以及子categories各自的已发布的文章
     *
     * @param  \Illuminate\Http\Request $request
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function getCategoryChildrenAndPublishedArticleList(Request $request, $id)
    {
        $result = PortalCategory_::getCategoryChildrenAndPublishedArticleList($id);
        return response()->json($result);
    }
}
