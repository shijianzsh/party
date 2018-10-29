@php
    $category_id=22;
    $get=getCategoryPublishedPostList($category_id,10);
    $category=$get['category'];
    $posts=$get['rows'];
@endphp

<div class="w595">
    <div class="title_st03">
        <b><a href="{{getCategoryUrl($category['id'])}}" style="color: white">{{$category['name']}}</a></b>
    </div>
    <div class="fpzy_nr" style="height: 330px">
        <ul class="fr">
            @foreach ($posts as $post)
                <li>
                    <a href="{{getPostUrl($post)}}">
                        @if (time()-$post['published_at']<=86400*3)
                            <span class="sty01">最新</span>
                        @endif
                        {{format_string($post['post_title'],30)}}
                    </a>
                </li>
            @endforeach
        </ul>
    </div>
</div>
