@php
    $category_ids=[26,27,28,29];
    $gets=[];
    for($i=0;$i<count($category_ids);$i++){
        $gets[]=getCategoryPublishedPostList($category_ids[$i]);
    }
@endphp

<div class="slideGroup" style="margin:0 auto">
    <div class="parHd">
        <ul>
            @foreach ($gets as $get)

                @php
                    $category=$get['category'];
                @endphp

                <li>
                    <a href="{{getCategoryUrl($category['id'])}}" style="color: white">
                        {{$category['name']}}
                    </a>
                </li>
            @endforeach
        </ul>
    </div>
    <div class="parBd" style="height: 352px">

        @foreach ($gets as $get)

            @php
                $posts=$get['rows'];
            @endphp

            <div class="slideBox">
                <a class="sPrev" href="javascript:void(0)"></a>
                <ul>

                    @foreach ($posts as $post)

                        <li>
                            <div class="pic">
                                <a href="{{getPostUrl($post['id'])}}">
                                    <img src="{{$post['thumbnail_format']}}" alt=""/>
                                </a>
                            </div>
                            <div class="title"  style="text-align: center">
                                <a href="{{getPostUrl($post['id'])}}">
                                    {{$post['post_title']}}
                                    {{--<br>--}}
{{--                                    {{$post['post_excerpt']}}--}}
                                </a>
                            </div>
                        </li>

                    @endforeach

                </ul>
                <a class="sNext" href="javascript:void(0)"></a>
            </div>
        @endforeach

    </div>
</div>
