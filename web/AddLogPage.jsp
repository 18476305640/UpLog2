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

    <script src="${pageContext.request.contextPath}/js/ueditor/ueditor.config.js"></script>
    <script src="${pageContext.request.contextPath}/js/ueditor/ueditor.all.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/ueditor/lang/zh-cn/zh-cn.js"></script>
    <link rel="stylesheet" href="js/bootstrap/css/bootstrap.css">

    <style type="text/css">
        *,h3,p{
            margin: 0;
            padding: 0;
        }

        body{
            /*background: url("https://dss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2926199504,3558053336&fm=26&gp=0.jpg") center/100%;*/
        }
        #text_box{
            width: 100%;
            height: 60%;



        }

        .main{
            width: 100%;
            height: 100%;
            margin-top:8px ;
            position: relative;
        }
        .mybut{
            position: absolute;
            bottom: 30px;
            z-index: 1000;

        }
    </style>
    <script type="text/javascript">
        $(function(){
            var ue = UE.getEditor('text_box');
            var logContent=$(".mylogcontent").val();
            ue.addListener("ready", function () {

               ue.setContent(logContent);
            });

            var but=$(".toUpdateLogBut")[0];
            but.onclick=function(){
                var content=ue.getContent();//getContentTxt();获取结构文本
                $(".mylogcontent").val(content);

            }
        });

    </script>
</head>
<body>

<div class="main">
    <form method="post" action="${pageContext.request.contextPath}/log/addLogToData">
        <input type="hidden" name="upid" value="${upid}">
        <p>标题</p>
        <input type="text" class="form-control" id="inputEmail3" name="logTitle" placeholder="Nickname">
        <p>内容</p>
        <input type="hidden" class="form-control mylogcontent" id="inputPassword3 " placeholder="Personal signature" name="logContent">
        <div id="text_box" ></div>
        <button type="submit" class="btn btn-default mybut toUpdateLogBut ">添加文章</button>
    </form>

</div>
</body>
</html>

