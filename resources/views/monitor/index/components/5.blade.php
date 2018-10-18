<div class="w820 data_box rm15">
    <div class="title01">新城区党支部会议开展情况</div>
    <div class="content_nr" id="main-5" style="height:300px;">

    </div>
</div>


<script>
    (function(){
        let option = {
        tooltip : {
            trigger: 'axis',
        },
        grid: {
            left: '3%',
            right: '4%',
            bottom: '3%',
            containLabel: true
        },
        xAxis :
            {
                type : 'category',
                boundaryGap : false,
                data : ['十一月','十二月','一月','二月','三月','四月','五月','六月','七月','八月','九月'],
                "splitLine": {     //网格线
                    "show": false
                }
            }
        ,
        yAxis :
            {
                type : 'value',

                "splitLine": {     //网格线
                    "show": false
                }
            }
        ,
        series :
            {
                name:'会议开展数量',
                type:'line',
                stack: '总量',
                areaStyle: {},
                data:[2, 3, 5, 3, 1, 7, 0,6,2,5,7,2]
            },

    };

        let chart = echarts.init(document.getElementById('main-5'), 'monitor');
        chart.setOption(option);
    })()
</script>
