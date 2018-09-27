@extends('monitor.layout.index')

@push('scripts')
    <script type="text/javascript" src="/static/monitor/js/jquery.min.js" ></script>
    <script type="text/javascript" src="/static/monitor/js/jquery.superslide.2.1.1.js" ></script>
@endpush

@section('content')
    <div class="content_box clearfix" style="padding: 0 40px 20px 40px;">
        <div style="width: 3760px; margin-bottom: 10px;">
            <div class="data_box">
                <div class="title01">各支部党务任务进度</div>
                <div class="content_nr" style="height: 500px;">
                    <!--<div style="width: 385px; height: 455px;"></div>-->
                    <div class="ladyScroll">
                        <div class="scrollWrap">
                            <div class="dlList">
                                <dl>
                                    <dt>
                                        <p>成吉思汗大街党支部<br>
                                            总任务数189项 已完成102项</p>
                                        <a href="#"><img src="/static/monitor/picture/pic16.png"></a></dt>
                                </dl>
                                <dl>
                                    <dt>
                                        <p>成吉思汗大街党支部<br>
                                            总任务数189项 已完成102项</p>
                                        <a href="#"><img src="/static/monitor/picture/pic16.png"></a></dt>
                                </dl>
                                <dl>
                                    <dt>
                                        <p>成吉思汗大街党支部<br>
                                            总任务数189项 已完成102项</p>
                                        <a href="#"><img src="/static/monitor/picture/pic16.png"></a></dt>
                                </dl>
                                <dl>
                                    <dt>
                                        <p>成吉思汗大街党支部<br>
                                            总任务数189项 已完成102项</p>
                                        <a href="#"><img src="/static/monitor/picture/pic16.png"></a></dt>
                                </dl>
                                <dl>
                                    <dt>
                                        <p>成吉思汗大街党支部<br>
                                            总任务数189项 已完成102项</p>
                                        <a href="#"><img src="/static/monitor/picture/pic16.png"></a></dt>
                                </dl>
                                <dl>
                                    <dt>
                                        <p>成吉思汗大街党支部<br>
                                            总任务数189项 已完成102项</p>
                                        <a href="#"><img src="/static/monitor/picture/pic16.png"></a></dt>
                                </dl>
                                <dl>
                                    <dt>
                                        <p>成吉思汗大街党支部<br>
                                            总任务数189项 已完成102项</p>
                                        <a href="#"><img src="/static/monitor/picture/pic16.png"></a></dt>
                                </dl>
                                <dl>
                                    <dt>
                                        <p>成吉思汗大街党支部<br>
                                            总任务数189项 已完成102项</p>
                                        <a href="#"><img src="/static/monitor/picture/pic16.png"></a></dt>
                                </dl>
                                <dl>
                                    <dt>
                                        <p>成吉思汗大街党支部<br>
                                            总任务数189项 已完成102项</p>
                                        <a href="#"><img src="/static/monitor/picture/pic16.png"></a></dt>
                                </dl>
                            </div>
                        </div>
                        <a class="next" href="javascript:void(0)"></a> </div>
                    <script type="text/javascript">
                        jQuery(".ladyScroll").slide({ mainCell:".dlList", effect:"leftLoop",vis:9, autoPlay:true});
                    </script> </div>
            </div>
        </div>
        <div style="width: 3760px;">
            <div class="data_box">
                <div class="title01"><span><i class="colour02"></i>已完成任务数量</span><span><i class="colour01"></i>帮扶工作总数量</span>新城区党支部帮扶工作统计</div>
                <div class="content_nr"><img src="/static/monitor/picture/pic15.png" width="3710" height="346" alt=""/></div>
            </div>
        </div>
    </div>
@endsection

