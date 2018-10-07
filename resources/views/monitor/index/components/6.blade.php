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
        let chart = echarts.init(document.getElementById('main-6'), 'monitor');
        chart.setOption(option);
    })()
</script>
