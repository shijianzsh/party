@php
    $category_id=21;
    $get=getCategoryPublishedPostList($category_id,2);
    $category=$get['category'];
    $posts=$get['rows'];
@endphp

<div class="w565">
    <div class="title_st02">
        <b><a href="{{getCategoryUrl($category['id'])}}" style="color: white">{{$category['name']}}</a></b>
    </div>
    <div class="djhd_nr" style="height: 320px">
        @foreach ($posts as $post)
            <img src="{{$post['thumbnail_format']}}" width="565" height="160"/>
        @endforeach
    </div>
</div>
