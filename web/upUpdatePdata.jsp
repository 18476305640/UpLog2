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
    <link rel="stylesheet" href="/js/bootstrap/css/bootstrap.css">

    <style type="text/css">
        *,h3,p{
            margin: 0;
            padding: 0;
        }
        .main{
            width: 400px;
            margin: 50px auto;
        }
        body{

            /*background: url("https://dss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2926199504,3558053336&fm=26&gp=0.jpg") center/100%;*/
        }
        .imgInput{
            width: 0px;
            height: 0px;

            padding: 0px;
            margin: 0px;
            border: none;
        }
        .my_fileStyle_box{
            position: relative;

        }
        .my_fileStyle{
            width: 328px;
            height: 34px;
            background: #f3f3f3;
            position: absolute;
            left: 87px;
            top: 0px;
            border-radius: 4px;
            line-height: 34px;
            font-size: 14px;
            text-align: center;
            font-weight: 700;
            cursor: pointer;
        }
        .my_fileStyle>img{
            position: absolute;
            right: -100px;
            width: 90px;
            top: 0px;
            display: none;
        }



    </style>
    <script type="text/javascript">
        $(function(){
            $(".imgInput").change(function(){
                $(".headImg").attr("src",URL.createObjectURL($(this)[0].files[0]));
                $(".imgInput").css("display","none");
                $(".my_fileStyle>img").css("display","block");

            });
            $(".my_fileStyle").click(function(){
                $(".imgInput").click();
            });
        });

    </script>
</head>
<body>
<div class="main">
    <form class="form-horizontal" action="/up/updateUpPdata" method="post" enctype="multipart/form-data">
        <input type="hidden" name="upid" value="${upid}">

        <div class="form-group my_fileStyle_box">
            <label for="my_head" class="col-sm-2 control-label">头像</label>

            <!--用来显示图片的div，自定义样式-->
            <div class="my_fileStyle">
                <p>点击上传头像</p>
                <img src=""  class="headImg" />
            </div>
            <div class="col-sm-10">
                <input type="file" class="form-control imgInput" accept="image/*" id="my_head" name="up_headImg"  placeholder="Nickname" >
            </div>
        </div>

        <div class="form-group">
            <label for="inputEmail3" class="col-sm-2 control-label">昵称</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="inputEmail3" name="pname" placeholder="Nickname" value="${up.up_pname}">
            </div>
        </div>
        <div class="form-group">
            <label for="inputPassword3" class="col-sm-2 control-label">个性签名</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="inputPassword3" placeholder="Personal signature" name="ptext" value="${up.up_ptext}">

            </div>
        </div>

        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-default ">修改</button>
            </div>
        </div>
    </form>
</div>
</body>
</html>

