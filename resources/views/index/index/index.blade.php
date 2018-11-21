@extends('index.layout.index')

@section('content')
    <div class="top_bg"></div>

    <!--页面主体部分-->
    <div class="containWrap">
        <!--直播两会-->
        <div class="box_bg01">
            <div class="w1180">
                @component('index.index.components.1_headline')
                    <strong>Whoops!</strong> Something went wrong!
                @endcomponent

                <div class="title_ddjs cleafix"></div>
                <div class="w1180 cleafix">

                    @component('index.index.components.2_1')
                        <strong>Whoops!</strong> Something went wrong!
                    @endcomponent

                    @component('index.index.components.2_2')
                        <strong>Whoops!</strong> Something went wrong!
                    @endcomponent

                    @component('index.index.components.2_3')
                        <strong>Whoops!</strong> Something went wrong!
                    @endcomponent
                </div>

                @component('index.index.components.3')
                    <strong>Whoops!</strong> Something went wrong!
                @endcomponent


                <div class="w1180 cleafix" style="padding-bottom: 30px;">
                    @component('index.index.components.4_1')
                        <strong>Whoops!</strong> Something went wrong!
                    @endcomponent

                    @component('index.index.components.4_2')
                        <strong>Whoops!</strong> Something went wrong!
                    @endcomponent
                </div>
            </div>
        </div>

        @component('index.index.components.5_党员分布')
            <strong>Whoops!</strong> Something went wrong!
        @endcomponent

        <div class="box_bg03" style="width: 100%;">

            @component('index.index.components.6_党建展览')
                <strong>Whoops!</strong> Something went wrong!
            @endcomponent

            @component('index.index.components.7_红色展览')
                <strong>Whoops!</strong> Something went wrong!
            @endcomponent

            @component('index.index.components.8_领导人')
                <strong>Whoops!</strong> Something went wrong!
            @endcomponent

        </div>

        <div style="height: 340px"></div>
        {{--@component('index.index.components.9_comment')--}}
            {{--<strong>Whoops!</strong> Something went wrong!--}}
        {{--@endcomponent--}}
    </div>

    <script>
        window.addEventListener('message',function(event){
            top.postMessage("init ready", '*')
        }, false);
    </script>
@endsection


