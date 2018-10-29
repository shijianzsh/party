<div class="w1360 h312 data_box">
    <div class="title01"><span><i class="colour02"></i>已完成任务数量</span><span><i
                class="colour01"></i>所有任务数量</span>新城区帮扶工作统计
    </div>
    <div class="content_nr" id="main-8" style="height: 255px;width: 100%;">
    </div>
</div>

<script>
    (function(){
        let data1 = [11, 16, 18, 23, 5, 22, 13, 6, 23, 4, 12];
        let data2 = [4, 5, 11, 6, 23, 23, 5, 22, 16, 18, 13];

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
                    data: data1
                },
                {
                    name: '已完成任务数量',
                    type: 'bar',
                    data: data2
                }
            ]
        };
        let chart = echarts.init(document.getElementById('main-8'), 'monitor');
        chart.setOption(option);

        setInterval(function () {
            for (let i = 0; i < data1.length; i++) {
                data1[i]+=Math.random()*10;
                data2[i]+=Math.random()*10;
            }
            chart.setOption(option);
        }, 2000)
    })()
</script>
