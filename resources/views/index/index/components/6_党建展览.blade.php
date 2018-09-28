@php
    $category_id=23;
    $get=getCategoryPublishedPostList($category_id);
    $category=$get['category'];
    $posts=$get['rows'];
@endphp

<div class="title_djzl cleafix" style="margin: 40px auto 0 auto"></div>
<div class="about-history" id="fzlc">
    <div class="about-history-list wow zoomIn" data-wow-delay=".4s"
         style="visibility: visible; animation-delay: 0.4s; animation-name: zoomIn;">
        <div class="flex-viewport" style="overflow: hidden; position: relative;">
            <ul class="slides clearfix list"
                style="width: 2600%; transition-duration: 0s; transform: translate3d(0px, 0px, 0px);">

                @foreach ($posts as $post)
                    <li style="float: left; display: block;">
                        <div class="item">
                            <h3>{{$post['post_title']}}</h3>
                            <div class="desc" onclick="jumpToPost($post['id'])">
                                <p>
                                    <img src="{{$post['thumbnail_format']}}"
                                         width="240" height="160"
                                         alt=""/>
                                </p>
                            </div>
                        </div>
                    </li>
                @endforeach

            </ul>
        </div>
        <ul class="flex-direction-nav">
            <li class="flex-nav-prev"><a class="flex-prev" href="#">&lt;</a></li>
            <li class="flex-nav-next"><a class="flex-next" href="#">&gt;</a></li>
        </ul>
    </div>
</div>
