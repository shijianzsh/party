<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>智慧党建网站</title>
    <link rel="stylesheet" href="/static/index/css/public.css"/>
    <link rel="stylesheet" href="/static/index/css/style.css"/>

    <script type="text/javascript" src="/static/common/lib/vue/vue.min.js"></script>
    <script type="text/javascript" src="/static/index/js/jquery1.42.min.js"></script>

    <link rel="stylesheet" href="/static/common/lib/iview-2.0/dist/styles/iview.css">
    <script src="/static/common/lib/iview-2.0/dist/iview.min.js"></script>
</head>
<body>

@component('index.layout.components.header')
    <strong>Whoops!</strong> Something went wrong!
@endcomponent

@yield('content')

@component('index.layout.components.footer')
    <strong>Whoops!</strong> Something went wrong!
@endcomponent

<script type="text/javascript" src="/static/index/js/jquery.superslide.2.1.1.js"></script>
<script src="/static/index/js/jquery_flexslider.js"></script>

<script type="text/javascript">
    $(".about-history-list").flexslider({
        animation: "slide",
        slideshow: false,
        controlNav: false,
        itemWidth: 240,
        itemMargin: 31,
        prevText: "<",
        nextText: ">",
        move: 1
    });
    jQuery(".slideGroup .slideBox").slide({
        mainCell: "ul",
        vis: 5,
        prevCell: ".sPrev",
        nextCell: ".sNext",
        effect: "leftLoop"
    });
    jQuery(".slideGroup").slide({titCell: ".parHd li", mainCell: ".parBd"});
</script>

<script>
    function jumpToPost(id) {
        window.location.href = "/index/post/" + id;
    }
    function jumpToCategory(id) {
        window.location.href = "/index/category/" + id;
    }
</script>

</body>
</html>
