<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<html>
<head>
    <title>猿记网</title>
    <script src="/js/jquery-2.0.0.min.js"></script>

    <link rel="stylesheet" href="/js/bootstrap/css/bootstrap.css">
    <style type="text/css">
        *,h3,p,main{
            margin: 0;
            padding: 0;

        }
        main{
            width: 100%;
            height: 100%;
        }
        .my_pagetitle{
            width: 100%;
            height: 30px;
            font-size: 15px;
            line-height: 30px;
            background:#f8f8f8 ;
            border-bottom: 1px solid #cccccc;
            color: gray;
            text-indent: 5px;
        }
        .my_addPageMain{
            width: 100%;
            height: 760px !important;

        }
        .my_addPageMain{
            width: 100%;
            position: relative;
        }
        .pageing{
            width: 100%;
            height: 85px;
            background: #f5f5f6;

            box-sizing: border-box;
            padding: 10px 10px;

        }
        tbody{
            overflow:auto;
        }
        .my_tbody{
            overflow: auto;
        }
        .toPage_input{
            width: 20px;
            height: 20px;
            border: 1px solid black;
        }
        .my_tbody>tr>td:nth-child(3){
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;

        }
        .my_tbody>tr>td:nth-child(2){
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;

        }

        .oneLog_controll{
            width: 160px !important;
            margin-right: 20px;
        }
        .oneLog_controll>button{
            margin-right:10px ;
            float: left;

        }
        .oneLog_content{
            white-space: normal;
            overflow: hidden;
            text-overflow: ellipsis;

        }
    </style>
    <script type="text/javascript">
        $(function(){

            $("tbody").on("click",".oneLog_controll>button:nth-child(1)",function (){
           　　　　var logid=$(this).parent("td").siblings(".logInfo").text();
                if(logid!=""){
                    window.location.href="/log/toLogUpdate?logid="+logid
                }
            });
            $("tbody").on("click",".oneLog_controll>button:nth-child(2)",function (){
           　　　var logid=$(this).parent("td").siblings(".logInfo").text();
                if(logid!=""){
                    window.location.href="/log/toDeleteLog?logid="+logid
                }
            });
            $(".my_addBut").click(function(){
                //去添加log页面，携带up_id
               window.location.href="/log/toAddLog";
            });



            //分页程序开始！！
            //总页面数（未初始化，页数是0）
            var pageNumber=0;
            //现在页数
            var thisPage=1;
            //每页数是
            var onePageNumber=10;

            function PageingFun(){
                 //监听如果获取到更新管理按钮上的链接
                 var isGetUpid=setInterval(function(){
                        console.log("正在检测");
                        if(pageNumber!=0){
                            clearInterval(isGetUpid);

                             console.log("检测到了，值是="+pageNumber);
                            //获取到了页数，开始发ajax请求获取，初始化页面（thisPage=1）数据
                            $.ajax({
                            url:"/log/myPageing?pageNumber="+onePageNumber+"&nextPage="+thisPage,
                            dataType:"json",
                            type:"get",
                            success:function (data,states,xhr){
                                $(".my_tbody").html("");
                                console.log("前端分页程序接收到了..");
                                console.log(data);

                                $.each(data,function (index,value){
                                    //获取到指定页数数据后，同步到页面
                                    console.log("正在把数据放在页面~");
                                    var logContent=value.log_content;
                                    var reg = /<[^<>]+>/g;
                                    logContent=logContent.replace(reg, '');

                                    var oneLog=$("<tr><td style='display: none' class='logInfo'>"+value.log_id+"</td><td>"+((thisPage-1)*10+index+1)+"</td><td>"+value.log_title+"</td><td class='oneLog_content'>"+value.log_content+"</td><td class='oneLog_controll'><button type='button' class='btn btn-success'>修改</button><button type='button' class='btn btn-warning'>删除</button></td></tr>");
                                    $(".my_tbody").append(oneLog);

                                    $(".toPage_input").val(thisPage);
                                    $(".pageing>span").text(pageNumber);
                                    console.log("放置结束~");

                                });

                            },
                            error:function (xhr,status,error){
                                console.log("出错了..");
                            }
                            });

                       }

                 },50);

            };
            //初始化调用
            PageingFun();
            $.ajax({
                    url:"/log/getPageNumber?onePageNumber="+onePageNumber,
                    dataType:"json",
                    type:"get",

                    success:function (data,states,xhr){
                       pageNumber=data.pageNumber;
                        console.log("总数据数="+data.pageNumber);

                    },
                    error:function (xhr,status,error){
                        console.log("出错了..");
                    }
            });

            //分页控制按钮

            $(".pageing>.toTop").click(function(){
                //去顶部页面
                thisPage=1;PageingFun();
            });
            $(".pageing>.toBottom").click(function(){
                //去底部页面
                thisPage=pageNumber;PageingFun();

            });
            $(".pageing>.UpperPage").click(function(){
                //去上一页
                if((thisPage-1)>0){
                    thisPage=(--thisPage);PageingFun();
                }


            });
            $(".pageing>.nextPage").click(function(){
                 if((thisPage+1)<=pageNumber){
                    thisPage=(++thisPage);PageingFun();

                }

            });
            $(".pageing>.toInputPage").click(function(){
                //去指定页面
                var topage=$(".toPage_input").val();

                if(topage>0 && topage<=pageNumber){
                    thisPage=topage;PageingFun();
                }

            });


        });

    </script>
<html>
<head>
    <title></title>
</head>
<body>


    <main>
        <div class="my_pagetitle">
            <span>Log管理页面</span>
        </div>
        <div class="my_addPageMain">
            <table class="table table-hover">
                <thead>
                    <tr>
                        <td>#</td>
                        <td>标题</td>
                        <td>内容</td>
                        <td><button type="button" class="btn my_addBut">添加</button>&nbsp;操作</td>
                    </tr>
                </thead>
                <tbody class="my_tbody">


                </tbody>
            </table>
            <div class="pageing">
                <button type="button" class="btn toTop">首页</button>
                <button type="button" class="btn UpperPage">上一页</button>
                <input type="text" onkeyup = "value=value.replace(/[^\d]/g,'')" value="00" class="toPage_input" >&nbsp;/&nbsp;<span>00</span>
                <button type="button" class="btn toInputPage">跳转</button>
                <button type="button" class="btn nextPage">下一页</button>
                <button type="button" class="btn toBottom">尾页</button>

            </div>
        </div>
    </main>
</body>
</html>
