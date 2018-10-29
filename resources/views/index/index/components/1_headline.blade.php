@php
    $category_id=17;
    $posts=getCategoryPublishedPostList($category_id,1)['rows'];
@endphp

<div class="toutiao">
    <h1><a href="{{getPostUrl(!empty($posts)?$posts[0]:'')}}">{{!empty($posts)?$posts[0]['post_title']:'未设置文章'}}</a></h1>
    <h2>{{!empty($posts)?$posts[0]['post_excerpt']:'未设置文章'}}</h2>
</div>
