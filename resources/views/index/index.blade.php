@extends('index.layout.index')

@section('content')

    <!--页面主体部分-->
    <div class="containWrap">
        <!--直播两会-->
        <div class="box_bg01">
            <div class="w1180">
                @component('index.components.1_headline', ['category_id' => 0])
                    <strong>Whoops!</strong> Something went wrong!
                @endcomponent

                <div class="title_ddjs cleafix"></div>
                <div class="w1180 cleafix">

                    @component('index.components.2_1', ['category_id' => 0])
                        <strong>Whoops!</strong> Something went wrong!
                    @endcomponent

                    @component('index.components.2_2', ['category_id' => 0])
                        <strong>Whoops!</strong> Something went wrong!
                    @endcomponent

                    @component('index.components.2_3', ['category_id' => 0])
                        <strong>Whoops!</strong> Something went wrong!
                    @endcomponent
                </div>

                @component('index.components.3', ['category_id' => 0])
                    <strong>Whoops!</strong> Something went wrong!
                @endcomponent


                <div class="w1180 cleafix" style="padding-bottom: 30px;">
                    @component('index.components.4_1', ['category_id' => 0])
                        <strong>Whoops!</strong> Something went wrong!
                    @endcomponent

                    @component('index.components.4_2', ['category_id' => 0])
                        <strong>Whoops!</strong> Something went wrong!
                    @endcomponent
                </div>
            </div>
        </div>

        @component('index.components.5_党员分布', ['category_id' => 0])
            <strong>Whoops!</strong> Something went wrong!
        @endcomponent

        <div class="box_bg03" style="width: 100%;">

            @component('index.components.6_党建展览', ['category_id' => 0])
                <strong>Whoops!</strong> Something went wrong!
            @endcomponent

            @component('index.components.7_红色展览', ['category_id' => 0])
                <strong>Whoops!</strong> Something went wrong!
            @endcomponent

            @component('index.components.8_领导人', ['category_id' => 0])
                <strong>Whoops!</strong> Something went wrong!
            @endcomponent

        </div>

        @component('index.components.9_comment')
            <strong>Whoops!</strong> Something went wrong!
        @endcomponent
    </div>
    </div>

@endsection
