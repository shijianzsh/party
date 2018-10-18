<div class="w1360 h312 data_box">
    <div class="title01"><span><i class="colour02"></i>已完成任务数量</span><span><i
                class="colour01"></i>所有任务数量</span>新城区帮扶工作统计
    </div>
    <div class="content_nr" id="main-8" style="height: 255px;width: 100%;">
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
                top: 0,
                width: '100%',
                bottom: 0 ,
                left: 10,
                right: 10,
                containLabel: true
            },
                yAxis: {
                type: 'value',
                "splitLine": {     //网格线
                    "show": false
                }

            },
            xAxis: {
                type: 'category',
                data: ['新城区', '赛罕区', '玉泉区', '回民区', '金桥', '金山', '鄂尔多斯大街', '海东路', '陶思浩村', '如意开发区', '乌兰察布路街道'],
                "splitLine": {     //网格线
                    "show": false
                }

            },
            series: [
                {
                    name: '所有任务数量',
                    type: 'bar',
                    data: [18203, 23489, 29034, 104970, 131744, 30230,23489, 29034, 104970,
                        131744, 60230]
                },
                {
                    name: '已完成任务数量',
                    type: 'bar',
                    data: [19325, 23438, 31000, 121594, 134141, 81807, 23438, 31000,
                        121594, 134141, 81807]
                }
            ]
        };
        let chart = echarts.init(document.getElementById('main-8'), 'monitor');
        chart.setOption(option);
    })()
</script>
