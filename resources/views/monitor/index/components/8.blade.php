<div class="w1360 h312 data_box">
    <div class="title01"><span><i class="colour02"></i>已完成任务数量</span><span><i
                class="colour01"></i>所有任务数量</span>新城区党支部帮扶工作统计
    </div>
    <div class="content_nr" id="main-8" style="height: 255px">
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
            yAxis: {
                type: 'value',
                "splitLine": {     //网格线
                    "show": false
                }

            },
            xAxis: {
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
        let chart = echarts.init(document.getElementById('main-8'), 'monitor');
        chart.setOption(option);
    })()
</script>
