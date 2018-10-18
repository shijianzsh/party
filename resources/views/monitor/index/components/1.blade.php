<div class="w677 rm15 data_box">
    <div class="title01">
        <span><i class="colour02"></i>已完成任务数量</span><span><i class="colour01"></i>所有任务数量</span>各支部党务工作进度
    </div>
    <div class="content_nr" style="height: 855px" id="main-1">

    </div>
</div>

<script>
    (function () {
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
                data: ['新城区党支部', '赛罕区党支部', '玉泉区党支部', '回民区党支部', '金桥开发区党支部', '金山开发区党支部', '鄂尔多斯大街党支部', '海东路党支部', '陶思浩村党支部', '如意开发区党支部', '乌兰察布路街道党支部'],
                "splitLine": {     //网格线
                    "show": false
                }
            },
            series: [
                {
                    name: '所有任务数量',
                    type: 'bar',
                    data: [11, 16, 18, 23, 5, 22, 13, 6, 23, 4, 12]
                },
                {
                    name: '已完成任务数量',
                    type: 'bar',
                    data: [4, 5, 11, 6, 23,23, 5, 22, 16, 18,  13, ]
                }
            ]
        };
        let chart = echarts.init(document.getElementById('main-1'), 'monitor');
        chart.setOption(option);
    })()
</script>
