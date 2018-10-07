<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <title>智慧党建大数据管理系统</title>
    <link rel="stylesheet" href="/static/monitor/css/reset.css">
    <script type="text/javascript" src="/static/monitor/js/date.js"></script>
    <script type="text/javascript" src="/static/common/lib/echarts/echarts.min.js"></script>
    <script type="text/javascript" src="/static/common/lib/echarts/themes/monitor.js"></script>
    <style>
        .content_nr{
            padding: 0 !important;
        }
    </style>
    @stack('scripts')
</head>
<body>

@component('monitor.components.header')
    <strong>Whoops!</strong> Something went wrong!
@endcomponent

@yield('content')

</body>
</html>
