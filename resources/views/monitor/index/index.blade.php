@extends('monitor.layout.index')

@section('content')
    <div class="content_box clearfix" style="padding: 0 40px 0 40px;">
        @component('monitor.index.components.1')
            <strong>Whoops!</strong> Something went wrong!
        @endcomponent

        <div class="w653 rm15">
            @component('monitor.index.components.2')
                <strong>Whoops!</strong> Something went wrong!
            @endcomponent
            @component('monitor.index.components.3')
                <strong>Whoops!</strong> Something went wrong!
            @endcomponent
        </div>
        @component('monitor.index.components.4_map')
            <strong>Whoops!</strong> Something went wrong!
        @endcomponent
        <div class="w1360">
            <div class="w1360 h356 bm15">

                @component('monitor.index.components.5')
                    <strong>Whoops!</strong> Something went wrong!
                @endcomponent
                @component('monitor.index.components.6')
                    <strong>Whoops!</strong> Something went wrong!
                @endcomponent

            </div>
            @component('monitor.index.components.7')
                <strong>Whoops!</strong> Something went wrong!
            @endcomponent
            @component('monitor.index.components.8')
                <strong>Whoops!</strong> Something went wrong!
            @endcomponent
        </div>
    </div>
@endsection


