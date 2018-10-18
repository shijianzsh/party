<div class="w521 data_box">
    <div class="title01">新城区党支部在线考评通过率排名</div>
    <div class="content_nr" id="main-6" style="height:300px;">

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
                data: ['新城区党支部', '赛罕区党支部', '玉泉区党支部', '回民区党支部', '金桥开发区党支部', '金山开发区党支部', '鄂尔多斯大街党支部', '海东路党支部', '陶思浩村党支部', '如意开发区党支部', '乌兰察布路街道党支部'],
                "splitLine": {     //网格线
                    "show": false
                }

            },
            series: [
                {
                    name: '所有任务数量',
                    type: 'bar',
                    data: [18203, 23489, 29034, 104970, 131744,
                        30230,23489, 29034, 104970, 131744, 63020]
                },
                {
                    name: '已完成任务数量',
                    type: 'bar',
                    data: [19325, 23438, 31000, 121594,
                        134141, 61807, 23438, 31000, 121594, 134141, 61807]
                }
            ]
        };
        let chart = echarts.init(document.getElementById('main-6'), 'monitor');
        chart.setOption(option);
    })()
</script>
