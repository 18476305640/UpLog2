<%--
  Created by IntelliJ IDEA.
  User: Admin_yfdsou
  Date: 2021/1/10
  Time: 8:52
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<html>
<head>
    <title>Title</title>
    <meta charset="utf-8" />
    <title>猿记网</title>
    <link rel="stylesheet" href="/js/bootstrap/css/bootstrap.css">
    <script src="/js/jquery-2.0.0.min.js"></script>
    <script type="text/javascript">
        $(function(){
            var upid=$("#inUpid").val();
            if(upid!=null){
                //自动发起ajax，获取按点赞数排名的数据与最新博客的数据
                $(function(){
                    $.ajax({
                            url:"/log/getUpLog?upid="+upid,
                            dataType:"json",
                            type:"get",
                            success:function (data,states,xhr){
                                console.log("前端获取到了博主的全部文章...");
                                console.log(data);
                                $.each(data,function (index,value){
                                    $(".logsBox").append("<div><a href='/log/queryByLogId?logid="+value.log_id+"'>"+value.log_title+"</a><span>"+value.log_content+"<a href='/log/queryByLogId?logid="+value.log_id+"'>查看全文</a></span></div>");
                                });


                            },
                            error:function (xhr,status,error){
                                console.log("出错了..");
                            }
                    });
                });

            }

        });

    </script>
    <style type="text/css">
        body{
            background: #f5f5f5;
        }
        .upHome_box{
            width: 85%;
            min-height: 800px;

            margin: 10px auto;
            background: #ffffff;
        }
        .upHome_headBox{
            width: 100%;
            height: 60px;
            background: #0d84c1;
            border-bottom:3px solid black ;
            position: relative;
            color: #ffffff;

        }
        .upHome_headBox>img{
            width: 50px;
            height: 50px;
            position: absolute;
            left: 3px;
            top: 50%;
            transform: translateY(-50%);

        }
        .upHome_headBox>h3{
            margin: 0;
            padding: 0;
            height: 30px;
            font-size: 25px;
            line-height: 30px;
            position: absolute;
            left: 60px;
            top: 5px;
        }
        .upHome_headBox>span{
            display: block;
            margin: 0;
            padding: 0;
            height: 30px;
            font-size: 14px;
            line-height: 30px;
            position: absolute;
            left: 150px;
            top: 28px;
        }
        .upHome_bodyBox{
            width: 100%;
            min-height:500px ;

        }
        .upHome_bodyBox>p{
            width: 100%;
            height: 30px;
            line-height: 30px;
            font-size: 20px;
            border-bottom: 1px solid #ededed ;
            text-indent: 3px;
            background: #ededed;
        }
        /*一条帖子*/
        .logsBox>div{
            width: 100%;
            height: 60px;
            padding: 24px 18px 13px;
            box-sizing: border-box;
            position: relative;
            border-bottom: 1px solid #ededed ;
            margin-bottom: 25px;

        }
        .logsBox>div>a{
            display: block;
            margin: 0;
            padding: 0;
            width: 90%;
            height: 25px;
            line-height: 25px;
            font-size: 18px;
            position: absolute;
            left: 18px;
            top: 0px;
            font-weight: 700;
            color: #66667f;

            cursor: pointer;
            overflow: hidden;
            text-overflow:ellipsis;
            white-space: nowrap;
        }
        .logsBox>div>span{
            display: block;
            margin: 0;
            padding: 0;
            width: 90%;
            height: 24px;
            line-height: 24px;
            font-size: 15px;
            color: gray;
            position: absolute;
            left: 18px;
            top: 28px;

            white-space: nowrap;
            overflow: hidden;
            text-overflow:ellipsis;

        }
        .logsBox>div>span>a{
            display: block;
            height: 100%;
            width: 80px;
            text-align: right;
            font-size: 15px;
            background: #ffffff;
            position: absolute;
            right: 0px;
            top: 0px;
            color: gray;
            cursor: pointer;

        }

    </style>
</head>
<body>
    <div class="upHome_box">
        <div class="upHome_headBox">
            <img src="${upData.up_headImg}" />
            <input type="hidden" id="inUpid" value="${upData.up_id}">
            <h3>${upData.up_pname}</h3>
            <span>${upData.up_ptext}</span>
        </div>
        <div class="upHome_bodyBox">
            <p>文章</p>
            <div class="logsBox">


            </div>
        </div>


    </div>
</body>
</html>
