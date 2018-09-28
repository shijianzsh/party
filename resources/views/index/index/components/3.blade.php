@php
    $category_id=20;
    $posts=getCategoryPublishedPostList($category_id,5)['rows'];
    $top_post=!empty($posts)?$posts[0]:null;
    $rest_posts=count($posts)>1?array_slice($posts,1):[];
@endphp

<a href="{{getCategoryUrl($category_id)}}">
    <div class="title_lxyz"></div>
</a>
<div class="w1180 cleafix">
    <div class="w260" style="width:260px;height: 175px">
        <img src="{{$top_post?$top_post['thumbnail_format']:''}}" width="260" height="175" alt=""/>
    </div>
    <div class="w900">
        <div class="ddjs_nr">
            <a href="{{getPostUrl($top_post)}}" style="color: #515a6e">
                <h1 style="margin-top: 0px;">
                    {{$top_post?$top_post['post_title']:'未设置文章'}}
                </h1>
                <p style="height: 42px">
                    {{$top_post?$top_post['post_excerpt']:'未设置文章'}}
                </p>
            </a>
            <ul>
                @foreach ($rest_posts as $post)
                    <li class="w48b fl"><a href="{{getPostUrl($post['id'])}}">{{$post['post_title']}}</a></li>
                @endforeach
            </ul>
        </div>
    </div>
</div>
