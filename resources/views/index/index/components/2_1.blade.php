@php
    $category_id=18;
    $get=getCategoryPublishedPostList($category_id,4);
    $category=$get['category'];
    $posts=$get['rows'];
    $top_post=!empty($posts)?$posts[0]:null;
    $rest_posts=count($posts)>1?array_slice($posts,1):[];
@endphp

<div class="w400">
    <div class="title_st01">
        <b><a href="{{getCategoryUrl($category['id'])}}" style="color: white">{{$category['name']}}</a></b>
    </div>
    <div class="ddjs_nr">
        <a href="{{getPostUrl($top_post)}}" style="color: #515a6e">
            <h1>{{format_string($top_post?$top_post['post_title']:'未设置文章')}}</h1>
            <p style="height: 63px">{{$top_post?$top_post['post_excerpt']:'未设置文章'}}</p>
        </a>

        <ul>
            @foreach ($rest_posts as $post)
                <li><a href="{{getPostUrl($post['id'])}}">{{$post['post_title']}}</a></li>
            @endforeach
        </ul>

    </div>
</div>
