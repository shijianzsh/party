@extends('index.layout.index')

@section('content')
    <div class="containWrap">
        <div class="w1180">
            <div class="content">
                <div class="content_tp">
                    <div class="shouye">
                        <img src="/static/index/picture/ico5.png"/>
                        <a href="/index">首页</a> <em>></em>
                        <a href="{{getCategoryUrl($post['category_id'])}}" class="cur">{{$post['category_name']}}</a>
                    </div>
                </div>
                <div class="content_com">
                    <h2>{{$post['post_title']}}</h2>

                    @if (!empty($post['post_excerpt']))
                        <h3>{{$post['post_excerpt']}}</h3>
                    @endif

                    <div class="con_xx">
                        <span>发布日期：{{$post['published_at_format']}}</span>

                        @if (!empty($post['post_source']))
                            <span>来源：{{$post['post_source']}}</span>
                        @endif

                        <span>浏览量: {{$post['post_hits']}}</span>
                    </div>

                   <div style="min-height: 100px">
                       {!! $post['post_content'] !!}
                   </div>

                    <div class="con_bm cleafix">
                        <a href="javascript:goTop();" class="gotop">顶部</a>
                    </div>
                </div>
                <div class="sxy">
                    <p>上一篇：<a href="{{getPostUrl($near_posts['last'])}}">{{$near_posts['last']?$near_posts['last']['post_title']:'没有了'}}</a></p>
                    <p>下一篇：<a href="{{getPostUrl($near_posts['next'])}}">{{$near_posts['next']?$near_posts['next']['post_title']:'没有了'}}</a></p>
                </div>
            </div>
        </div>
    </div>
@endsection
