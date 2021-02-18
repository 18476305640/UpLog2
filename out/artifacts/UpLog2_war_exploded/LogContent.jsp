<%--
  Created by IntelliJ IDEA.
  User: Admin_yfdsou
  Date: 2020/12/31
  Time: 21:23
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<html>
<head>
    <title>猿记网</title>
    <script src="/js/jquery-2.0.0.min.js"></script>
    <script src="/js/cookie-utils.js"></script>
    <link rel="stylesheet" href="/js/bootstrap/css/bootstrap.css">
    <style type="text/css">
        *,h3,p{
            margin: 0;
            padding: 0;
        }

        .my_context{
            width: 86%;
            margin: 10px auto;
            background-color: #ffffff;
            padding:5px ;
        }
        .my_context>article{
            width: 100%;
            cursor: pointer;


        }
        .my_context>article>h3{
            width: 100%;
            height: 40px;
            box-sizing: border-box;
            border-left: 3px solid red;

            line-height: 40px;
            text-indent: 5px;
            background-color: #f8f8f8;

        }

        body{
            background-color: #e6e6e6;
        }
        .my_context>article>div{
            width: 100%;
            min-height: 300px;
            background: #ffffff;
            box-sizing: border-box;
            padding: 5px ;
            margin: 15px 0px;
        }
        .ping{

          position: relative;
        }

        .ping>h3{
            width: 100%;
            background: #f8f8f8;
            line-height: 40px;
            font-size: 20px !important;
            box-sizing: border-box;
            border-left: 3px solid red;
            text-indent: 5px;
        }
        .ping>.comment_box{
            width: 100%;
            min-height: 400px;


        }
        .ping>.comment_box>div{
            width: 100%;
            height: 71px;
            padding-top: 20px;
            position: relative;
            background: #ffffff;
            margin: 8px 0px;
            box-sizing: border-box;
            border-bottom: 1px solid #dddddd;

        }
        .ping>.comment_box>div>p:nth-child(1){
            max-width: 150px;
            position: absolute;
            left: 0px;
            top: 5px;
            text-indent: 5px;

        }
        .ping>.comment_box>div>p:nth-child(2){
            min-width: 78%;
            line-height: 20px;
            position: absolute;
            left: 155px;
            top: 5px;

            border-bottom: 1px solid #f0f0f0;

        }
        /*.ping>.comment_controller{*/
        /*    min-width: 100px;*/
        /*    height: 48px;*/
        /*    position: absolute;*/
        /*    right: 0px;*/
        /*    top: 0px;*/
        /*    padding-top: 3px !important;*/
        /*}*/
        /*.ping>.comment_controller>button{*/
        /*    float: right;*/
        /*    background: #f8f8f8;*/
        /*    margin-left: 12px;*/
        /*}*/
        .ping_title{
            position: relative;
        }
        .ping_title>.comment_controller{
            min-width: 300px;
            height: 40px;
            z-index: 1000;
            position: absolute;
            padding: 0px;
            margin: 0px;
            right: 0px;
            top: 0px;
            background: none;


        }
        .ping_title>.comment_controller>button{
            float: right;
            background: #f8f8f8;
            color: #333333;
            margin-left: 12px;

        }
        .commentToLog_box{
            position: absolute;
            right: 0;
            top: 54px;
            width: 350px;
            border: 1px solid #4f4f4f;
            border-radius: 10px;
            background: #ffffff;
            box-sizing: border-box;
            padding: 10px 10px 0px 10px;
            display: none;

        }
        .commentToLog_box>textarea{
            width: 100%;
            height:150px;
            border: 2px solid #101010;
            margin-bottom: 10px;

        }
        .commentToLog_box>div>button{
            width: 60px;
            height:30px;
            background: #ffffff;
            margin-bottom: 10px;
            border-radius: 3px;
            border: 1px solid #4f4f4f;
        }
        .comment_box{
            width: 100%;
            min-height:400px;
        }
        .logToBottom{
            border: 1px solid gray ;
            height: 28px;
            line-height: 28px;
            width: 54px;
            padding: 0px !important;
            border-radius:0px 17px 17px 0px/0px 17px 17px 0px !important; ;
            margin-left: 0 !important;
            margin-top: 5px !important;
            font-weight: 700;

        }
        .logToTop{
            height: 28px;
            width: 54px;
            line-height: 28px;
            margin-top: 5px !important;
            padding: 0px !important;
            border-radius:17px 0px 0px 17px/17px 0px 0px 17px !important;
            background: #24de7d !important;
            color: #f8f8f8 !important;
            font-weight: 700;
        }
        .log_noOk{
            border: none !important;
            background: #f6f6f6 !important;

        }
        .toComment_btn{
            border: none !important;
            background: #0ac662 !important;
            font-weight: 700;
            color: #ffffff !important;
        }
        .comment_tips{
            color: red;
            font-size: 12px;
            text-indent: 8px;
        }
    </style>

    <script type="text/javascript">
        $(function(){
            $(".comment_controller>.commentToLog").click(function(){
                var user=$.getCookie("user");
                var scode=$.getCookie("scode");
                if(user!=null && scode != null){
                    $(".commentToLog_box").css("display","block");
                }else{
                    if(confirm("你未登录，是否去登录?")){
                        window.location.href="/up/tologin"
                    }
                }


            });
            $(".commentToLog_box>div>button:nth-child(2)").click(function(){
                $(".commentToLog_box").css("display","none");
                $(".comment_tips").text("");

            });

            //去博客主页
            $(".toUpHome").click(function(){
                var upid=$("#upid").val();
                if(upid!=null){
                    window.location.href="/up/toUpHome?upid="+upid;
                }


            });
            var commentLogId=$(".logidInput").val();

            $(".commentToLog_box>div>button:nth-child(1)").click(function(){
                //commentLogId=$(".logidInput").val();
                var commentContent=$(".commentToLog_box>textarea").val();

                console.log("携带："+commentContent+";评论到："+commentLogId);
                $.ajax({
                       url:"/comment/addCommentByLog?commentLogId="+commentLogId+"&commentContent="+commentContent,
                       type:"get",
                       dataType:"json",
                       success:function (data,states,xhr){
                           if(data.commentIsAdd==1){
                                $(".commentToLog_box>textarea").val("");
                                $(".commentToLog_box").css("display","none");
                                getCommentByLogId();
                           }else{
                                alert("添加过程中出现错误！");
                           }


                       },
                       error:function (xhr,status,error){
                           console.log("添加出错了..");
                       }
                });

            });
            getCommentByLogId();
            function getCommentByLogId(){
                $.ajax({
                       url:"/comment/queryByLogId?commentLogId="+commentLogId,
                       type:"get",
                       dataType:"json",
                       success:function (data,states,xhr){
                            console.log("前端获取到了...");
                            console.log(data);
                            $(".comment_box").html("");
                            $.each(data,function (index,value){
                                $(".comment_box").append("<div><p>"+value.up_pname+"：<br/><time>（"+(Math.floor((new Date().getTime()-value.comment_date)/1000/60/24/24)-1)+"天前）</time></p><p>"+value.comment_content+"</p></div>");

                            });
                            console.log("评论更新完成！");




                       },
                       error:function (xhr,status,error){
                           console.log("获取评论出错了..");
                       }
                });
            }
            //点赞或踩
            var upid=$("#upid").val();
            var logid=$(".logidInput").val();
            $(".logToTop").click(function(){
                PointLog(upid,logid,1);

            })
             $(".logToBottom").click(function(){
                PointLog(upid,logid,-1);
            })
            function PointLog(upid,log_id,type){
                $.ajax({
                       url:"/pointLog/updatePointLog?upid="+upid+"&log_id="+logid+"&type="+type,
                       type:"get",
                       dataType:"json",
                       success:function (data,states,xhr){
                            console.log("前端获取到了点赞结果...");
                            var pointData=data.showData;

                            alert(pointData);

                       },
                       error:function (xhr,status,error){
                           console.log("获取评论出错了..");
                       }
                });

            }
            $(".log_noOk").click(function(){
                var reportContent= $(".commentToLog_box>textarea").val();
                if(reportContent!=""){
                    var user=$.getCookie("user");
                    var scode=$.getCookie("scode");
                    if(user!=null && scode != null){
                        <%--已登录可举报--%>
                        $(".comment_tips").text("");
                        if (confirm("确认举报该Log吗？")) {
                            <%--开始处理举报信息--%>
                            $.ajax({
                                   url:"/report/toAddReport?logid="+logid+"&reportContent="+reportContent,
                                   type:"get",
                                   dataType:"json",
                                   success:function (data,states,xhr){
                                        console.log("前端获取举报提交的结果了...");
                                        var info=data.info;
                                        switch(info){
                                            case "1":
                                                $(".commentToLog_box>textarea").val("");
                                                $(".commentToLog_box").css("display","none");
                                                break;
                                            case "0":
                                                <%--举报出错时！前端在以下写处理代码--%>
                                                break;
                                            case "-1":
                                                <%--用户登记信息失效！--%>
                                                window.location.href="/up/tologin";
                                                break;
                                        }



                                   },
                                   error:function (xhr,status,error){
                                       console.log("获取评论出错了..");
                                   }
                            });
                        }

                    }else{
                        <%--未登录不能提交举报--%>
                        window.location.href="/up/tologin";
                    }



                }else{
                    $(".comment_tips").text("举报内容不能为空！");

                }

            });
            $(".letter_you").click(function(){
                alert("后续推出，敬请期待~");
            });


        });

    </script>
</head>
<body>
<main class="my_context">

    <article class="ping_title">
        <div class="comment_controller">
            <button type="button" class="btn commentToLog">文章见解</button>&nbsp;
            <div class="commentToLog_box">
                <textarea></textarea>
                <div>
                    <button class="toComment_btn">发送</button>
                    <button>隐藏</button>
                    <button class="log_noOk">举报</button>
                    <span class="comment_tips"></span>
                </div>

            </div>
            <button type="button" class="btn letter_you">私&nbsp;&nbsp;信</button>&nbsp;
            <button type="button" class="btn toUpHome">博主主页</button>
            <input type="hidden" id="upid" value="${logContent.up_id}">&nbsp;
            <button type="button" class="btn logToBottom">踩</button>
            <button type="button" class="btn logToTop">点赞</button>&nbsp;

        </div>
        <%--用于评论的时候--%>
        <input type="hidden" class="logidInput" value="${logContent.log_id}">
        <h3>${logContent.log_title}</h3>
        <div>
            <p>${logContent.log_content}</p>
        </div>
    </article>
    <div class="ping clearfix">
        <h3>猿评论</h3>
        <div class="comment_box">

        </div>

    </div>

</main>
</body>
</html>

