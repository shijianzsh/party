<div class="w820 data_box rm15">
    <div class="title01">新城区党支部会议开展情况</div>
    <div class="content_nr" id="main-5" style="height:300px;">

    </div>
</div>


<script>
    (function () {
        let mouth = ['十一月', '十二月', '一月', '二月', '三月', '四月', '五月', '六月', '七月', '八月', '九月', '十月'];
        let data = [2, 3, 5, 3, 1, 7, 0, 6, 2, 5, 7, 2];

        let option = {
            tooltip: {
                trigger: 'axis',
            },
            grid: {
                left: '3%',
                right: '4%',
                bottom: '3%',
                containLabel: true
            },
            xAxis:
                {
                    type: 'category',
                    boundaryGap: false,
                    data: mouth,
                    "splitLine": {     //网格线
                        "show": false
                    }
                }
            ,
            yAxis:
                {
                    type: 'value',

                    "splitLine": {     //网格线
                        "show": false
                    }
                }
            ,
            series:
                {
                    name: '会议开展数量',
                    type: 'line',
                    stack: '总量',
                    areaStyle: {},
                    data: data,
                    smooth: true
                },

        };

        let chart = echarts.init(document.getElementById('main-5'), 'monitor');
        chart.setOption(option);

        setInterval(function () {
            let one = mouth[0];
            mouth = mouth.slice(1);
            mouth.push(one);

            one = data[0];
            data = data.slice(1);
            data.push(one);

            option = {
                tooltip: {
                    trigger: 'axis',
                },
                grid: {
                    left: '3%',
                    right: '4%',
                    bottom: '3%',
                    containLabel: true
                },
                xAxis:
                    {
                        type: 'category',
                        boundaryGap: false,
                        data: mouth,
                        "splitLine": {     //网格线
                            "show": false
                        }
                    }
                ,
                yAxis:
                    {
                        type: 'value',

                        "splitLine": {     //网格线
                            "show": false
                        }
                    }
                ,
                series:
                    {
                        name: '会议开展数量',
                        type: 'line',
                        stack: '总量',
                        areaStyle: {},
                        data: data,
                        smooth: true
                    },

            };
            chart.setOption(option);
        }, 2000)
    })()
</script>
