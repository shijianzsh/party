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
                data : ['周一','周二','周三','周四','周五','周六','周日'],
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
                name:'邮件营销',
                type:'line',
                stack: '总量',
                areaStyle: {},
                data:[120, 132, 101, 134, 90, 230, 210]
            },

    };

        let chart = echarts.init(document.getElementById('main-5'), 'monitor');
        chart.setOption(option);
    })()
</script>
