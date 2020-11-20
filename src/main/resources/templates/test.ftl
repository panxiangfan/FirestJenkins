<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>销量图</title>
    <script src="js/echarts.js"></script>
    <script src="js/china.js"></script>
    <script src="js/jquery-3.2.1.js"></script>

    <style>
        *{margin:0;padding:0}
        html,body{
            width:100%;
            height:100%;
        }
        .aa{
            /*width: 200px;*/
            /*height: 200px;*/
            text-align: center;
            background: #000;
            color: #fff;
            font-size: 28px;
        }
    </style>
</head>
<script type="text/javascript">
$(document).ready(function () {
    // 新建productName与nums数组来接受数据，因为我们
    var Name = [];
    var nums = [];
    var datatemp = [];
    //AJAX接收数据主体
    $.ajax({
        type:"GET",
        url:"/getdata",
        dataType:"json",
        async:false,
        success:function (result) {
            for (var i = 0; i < result.length; i++){
                Name.push(result[i].name);
                nums.push(result[i].nums);
                var ob = {name:"",nums:""};
                ob.name = result[i].name;
                ob.nums = result[i].nums;

                datatemp.push(ob);
            }

        },
        error :function(errorMsg) {
            alert("获取后台数据失败！");
        }
    });

    //触发按钮
    $(".aaa").click(function () {
        let aaa = $(this).attr("value");
        if (aaa == "柱状图") {
            zhu();
        }else if (aaa == "扇形图"){
            shan();
        }
    })

    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('main'));

    // 指定图表的配置项和数据
    function zhu(){
        const option = {
            title : {
                text: '下半年新款车辆销量统计',
                subtext: '',
                x:'center'
            },
            color: ['#3398db'],
            tooltip: {
                trigger: 'axis',
                axisPointer: {            // 坐标轴指示器，坐标轴触发有效
                    type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                }
            },
            grid: {
                left: '3%',
                right: '4%',
                bottom: '3%',
                containLabel: true
            },
            xAxis: [
                {
                    type: 'category',
                    data: ['奔驰V260', '别克GL8', '本田CR-V', '丰田埃尔法', '凌尚'],
                    axisTick: {
                        alignWithLabel: true
                    }
                }
            ],
            yAxis: [
                {
                    type: 'value'
                }
            ],
            series: [
                {
                    name: '销量',
                    type: 'bar',
                    barWidth: '60%',
                    data: nums
                }
            ]
        };

        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option,true);
    }

    var myChart2 = echarts.init(document.getElementById('main'));

    function shan() {
        const option2 = {
            title : {
                text: '下半年新款车辆销量统计',
                subtext: '',
                x:'center'
            },
            tooltip : {
                trigger: 'item',
                formatter: "{a} <br/>{b} : {c} ({d}%)"
            },
            legend: {
                orient: 'vertical',
                left: 'left',
                data: ['奔驰V260', '别克GL8', '本田CR-V', '丰田埃尔法', '凌尚']
            },
            series : [
                {
                    name: '销量来源',
                    type: 'pie',
                    radius : '55%',
                    center: ['50%', '40%'],
                    data:(function () {

                        var datas = [];
                        $.ajax({
                            type:"POST",
                            url:"/getdata",
                            dataType:"json",
                            async:false,
                            success:function (result) {

                                for (var i = 0; i < result.length; i++){
                                    datas.push({
                                        "value":result[i].nums, "name":result[i].name
                                    })
                                }

                            }
                        })
                        return datas;

                    })(),
                    itemStyle: {
                        emphasis: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    }
                }
            ]

        };
        myChart2.setOption(option2,true);
    }
    zhu();
});
</script>

<body>
<!-- 为 ECharts 准备一个具备大小（宽高）的 DOM -->
<div id="main"
     style="width: 1000px; height: 500px; position: absolute; top: 20%; left: 50%; margin-top: -100px; margin-left: -700px;">
</div>

    <img src="js/aa.png" value="柱状图" class="aaa" width="50" height="50"/>&nbsp;&nbsp;
    <img src="js/bb.png" value="扇形图" class="aaa" width="50" height="50"/>
</body>
</html>
                                                                                                                                                     