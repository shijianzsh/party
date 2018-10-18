<div class="w1360 h246 data_box bm15">
    <div class="title01"><span><i class="colour03"></i>已完成任务数量</span><span><i
                class="colour02"></i>所有任务数量</span>新城区党员数量统计
    </div>
    <div class="content_nr">
        <div style="width: 190px;height:190px;float:left;" id="main-7"></div>
        <div style="width: 190px;height:190px;float:left;" id="main-7-2"></div>
        <div style="width: 190px;height:190px;float:left;" id="main-7-3"></div>
        <div style="width: 190px;height:190px;float:left;" id="main-7-4"></div>
        <div style="width: 190px;height:190px;float:left;" id="main-7-5"></div>
        <div style="width: 190px;height:190px;float:left;" id="main-7-6"></div>
        <div style="width: 190px;height:190px;float:left;" id="main-7-7"></div>
        {{--<img src="/static/monitor/picture/pic05.png"/>--}}
    </div>
</div>

<script>
    (function () {
        var option = {
            title:  {
                text: '新城区',
                x: '50%',
                y: '80%',
                textAlign: 'center'
            },
            tooltip: {
                trigger: 'item',
                formatter: "{b}: {c} ({d}%)"
            },
            // legend: {
            //     orient: 'vertical',
            //     x: 'left',
            //     data:['直接访问','邮件营销']
            // },
            series: [
                {
                    name:'访问来源',
                    type:'pie',
                    radius: ['30%', '65%'],
                    center: ['50%', '45%'],
                    avoidLabelOverlap: false,
                    label: {
                        normal: {
                            show: false,
                            position: 'center'
                        },
                        emphasis: {
                            show: true,
                            textStyle: {
                                fontSize: '20',
                                fontWeight: 'bold'
                            }
                        }
                    },
                    labelLine: {
                        normal: {
                            show: false
                        }
                    },
                    data:[
                        {value:5, name:'党员', selected:true},
                        {value:95, name:'其他'},
                    ]
                }
            ]
        };

        let chart = echarts.init(document.getElementById('main-7'), 'monitor');
        chart.setOption(option);
    })();
    (function () {
        var option = {
            title:  {
                text: '赛罕区',
                x: '50%',
                y: '80%',
                textAlign: 'center'
            },
            tooltip: {
                trigger: 'item',
                formatter: "{b}: {c} ({d}%)"
            },
            // legend: {
            //     orient: 'vertical',
            //     x: 'left',
            //     data:['直接访问','邮件营销']
            // },
            series: [
                {
                    name:'访问来源',
                    type:'pie',
                    radius: ['30%', '65%'],
                    center: ['50%', '45%'],
                    avoidLabelOverlap: false,
                    label: {
                        normal: {
                            show: false,
                            position: 'center'
                        },
                        emphasis: {
                            show: true,
                            textStyle: {
                                fontSize: '20',
                                fontWeight: 'bold'
                            }
                        }
                    },
                    labelLine: {
                        normal: {
                            show: false
                        }
                    },
                    data:[
                        {value:14, name:'党员', selected:true},
                        {value:86, name:'其他'},
                    ]
                }
            ]
        };

        let chart = echarts.init(document.getElementById('main-7-2'), 'monitor');
        chart.setOption(option);
    })();
    (function () {
        var option = {
            title:  {
                text: '乌兰察布路街道',
                x: '50%',
                y: '80%',
                textAlign: 'center'
            },
            tooltip: {
                trigger: 'item',
                formatter: "{b}: {c} ({d}%)"
            },
            // legend: {
            //     orient: 'vertical',
            //     x: 'left',
            //     data:['直接访问','邮件营销']
            // },
            series: [
                {
                    name:'访问来源',
                    type:'pie',
                    radius: ['30%', '65%'],
                    center: ['50%', '45%'],
                    avoidLabelOverlap: false,
                    label: {
                        normal: {
                            show: false,
                            position: 'center'
                        },
                        emphasis: {
                            show: true,
                            textStyle: {
                                fontSize: '20',
                                fontWeight: 'bold'
                            }
                        }
                    },
                    labelLine: {
                        normal: {
                            show: false
                        }
                    },
                    data:[
                        {value:20, name:'党员', selected:true},
                        {value:80, name:'其他'},
                    ]
                }
            ]
        };

        let chart = echarts.init(document.getElementById('main-7-3'), 'monitor');
        chart.setOption(option);
    })();
    (function () {
        var option = {
            title:  {
                text: '回民区',
                x: '50%',
                y: '80%',
                textAlign: 'center'
            },
            tooltip: {
                trigger: 'item',
                formatter: "{b}: {c} ({d}%)"
            },
            // legend: {
            //     orient: 'vertical',
            //     x: 'left',
            //     data:['直接访问','邮件营销']
            // },
            series: [
                {
                    name:'访问来源',
                    type:'pie',
                    radius: ['30%', '65%'],
                    center: ['50%', '45%'],
                    avoidLabelOverlap: false,
                    label: {
                        normal: {
                            show: false,
                            position: 'center'
                        },
                        emphasis: {
                            show: true,
                            textStyle: {
                                fontSize: '20',
                                fontWeight: 'bold'
                            }
                        }
                    },
                    labelLine: {
                        normal: {
                            show: false
                        }
                    },
                    data:[
                        {value:29, name:'党员', selected:true},
                        {value:71, name:'其他'},
                    ]
                }
            ]
        };

        let chart = echarts.init(document.getElementById('main-7-4'), 'monitor');
        chart.setOption(option);
    })();
    (function () {
        var option = {
            title:  {
                text: '玉泉区',
                x: '50%',
                y: '80%',
                textAlign: 'center'
            },
            tooltip: {
                trigger: 'item',
                formatter: "{b}: {c} ({d}%)"
            },
            // legend: {
            //     orient: 'vertical',
            //     x: 'left',
            //     data:['直接访问','邮件营销']
            // },
            series: [
                {
                    name:'访问来源',
                    type:'pie',
                    radius: ['30%', '65%'],
                    center: ['50%', '45%'],
                    avoidLabelOverlap: false,
                    label: {
                        normal: {
                            show: false,
                            position: 'center'
                        },
                        emphasis: {
                            show: true,
                            textStyle: {
                                fontSize: '20',
                                fontWeight: 'bold'
                            }
                        }
                    },
                    labelLine: {
                        normal: {
                            show: false
                        }
                    },
                    data:[
                        {value:16, name:'党员', selected:true},
                        {value:84, name:'其他'},
                    ]
                }
            ]
        };

        let chart = echarts.init(document.getElementById('main-7-5'), 'monitor');
        chart.setOption(option);
    })();
    (function () {
        var option = {
            title:  {
                text: '海东路街道',
                x: '50%',
                y: '80%',
                textAlign: 'center'
            },
            tooltip: {
                trigger: 'item',
                formatter: "{b}: {c} ({d}%)"
            },
            // legend: {
            //     orient: 'vertical',
            //     x: 'left',
            //     data:['直接访问','邮件营销']
            // },
            series: [
                {
                    name:'访问来源',
                    type:'pie',
                    radius: ['30%', '65%'],
                    center: ['50%', '45%'],
                    avoidLabelOverlap: false,
                    label: {
                        normal: {
                            show: false,
                            position: 'center'
                        },
                        emphasis: {
                            show: true,
                            textStyle: {
                                fontSize: '20',
                                fontWeight: 'bold'
                            }
                        }
                    },
                    labelLine: {
                        normal: {
                            show: false
                        }
                    },
                    data:[
                        {value:21, name:'党员', selected:true},
                        {value:79, name:'其他'},
                    ]
                }
            ]
        };

        let chart = echarts.init(document.getElementById('main-7-6'), 'monitor');
        chart.setOption(option);
    })();
    (function () {
        var option = {
            title:  {
                text: '金山开发区',
                x: '50%',
                y: '80%',
                textAlign: 'center'
            },
            tooltip: {
                trigger: 'item',
                formatter: "{b}: {c} ({d}%)"
            },
            // legend: {
            //     orient: 'vertical',
            //     x: 'left',
            //     data:['直接访问','邮件营销']
            // },
            series: [
                {
                    name:'访问来源',
                    type:'pie',
                    radius: ['30%', '65%'],
                    center: ['50%', '45%'],
                    avoidLabelOverlap: false,
                    label: {
                        normal: {
                            show: false,
                            position: 'center'
                        },
                        emphasis: {
                            show: true,
                            textStyle: {
                                fontSize: '20',
                                fontWeight: 'bold'
                            }
                        }
                    },
                    labelLine: {
                        normal: {
                            show: false
                        }
                    },
                    data:[
                        {value:11, name:'党员', selected:true},
                        {value:89, name:'其他'},
                    ]
                }
            ]
        };

        let chart = echarts.init(document.getElementById('main-7-7'), 'monitor');
        chart.setOption(option);
    })();
</script>
