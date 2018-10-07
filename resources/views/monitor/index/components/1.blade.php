<div class="w677 rm15 data_box">
    <div class="title01">
        <span><i class="colour02"></i>已完成任务数量</span><span><i class="colour01"></i>所有任务数量</span>各支部党务工作进度</div>
    <div class="content_nr" style="height: 855px" id="main-1">

    </div>
</div>

<script>
    (function(){
        let option = {
            tooltip: {
                trigger: 'axis',
                axisPointer: {
                    type: 'shadow'
                }
            },
            grid: {
                left: '3%',
                right: '4%',
                bottom: '3%',
                containLabel: true
            },
            xAxis: {
                type: 'value',
                "splitLine": {     //网格线
                    "show": false
                }
            },
            yAxis: {
                type: 'category',
                data: ['巴西','印尼','美国','印度','中国','世界'],
                "splitLine": {     //网格线
                    "show": false
                }
            },
            series: [
                {
                    name: '所有任务数量',
                    type: 'bar',
                    data: [18203, 23489, 29034, 104970, 131744, 630230]
                },
                {
                    name: '已完成任务数量',
                    type: 'bar',
                    data: [19325, 23438, 31000, 121594, 134141, 681807]
                }
            ]
        };
        let chart = echarts.init(document.getElementById('main-1'), 'monitor');
        chart.setOption(option);
    })()
</script>
