@extends('index.layout.index')

@section('content')
    <div class="containWrap">
        <div class="w1180">
            <div class="list">
                <div class="list_tp">
                    <i class="ico"></i> <span>{{$category['name']}}</span>
                    <div class="shouye fr">
                        <img src="/static/index/picture/ico5.png" />
                        <a href="/index">首页</a>
                        <em>></em>
                        <a class="cur">{{$category['name']}}</a>
                    </div>
                </div>

                <div class="list_bm">

                    @component('index.category.components.list',
                  ['posts' => $posts])
                        <strong>Whoops!</strong> Something went wrong!
                    @endcomponent

                    @component('index.category.components.pagination',['category_id' => $category['id'],'pagination'=>$pagination])
                        <strong>Whoops!</strong> Something went wrong!
                    @endcomponent

                </div>
            </div>
        </div>
    </div>
@endsection
