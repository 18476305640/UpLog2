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
            background: url("/img/k7.jpg") center/100% 100% no-repeat;

        }
        .form-group{
            display: block;
            width: 550px;
            margin: 30px auto;
        }
        .form-group>.control-label{
            width: 100px !important;
            float: left;
            text-align: right;
        }
        .form-group>.myInput{
            width: 400px !important;
            float: left;
        }
        .mysubmit{
            margin-left: 99px;

        }

    </style>
    <script type="text/javascript">
        $(function(){

        });

    </script>
</head>
<body>
<div class="main">
    <form class="form-horizontal" action="/up/logon" method="post">

        <div class="form-group">
            <label for="my_name" class="col-sm-2 control-label">账&nbsp;&nbsp;&nbsp;号:</label>
            <div class="col-sm-10 myInput">
                <input type="text" id="my_name" class="form-control"  required placeholder="User" name="user" value="${errorUpData.up_name}">
            </div>
        </div>
        <div class="form-group">
            <label for="my_password" class="col-sm-2 control-label">密&nbsp;&nbsp;&nbsp;码:</label>
            <div class="col-sm-10 myInput" >
                <input type="password" id="my_password" class="form-control" placeholder="Password" name="password" required value="${errorUpData.up_password}">
            </div>
        </div>
        <div class="form-group ">
            <label for="pname" class="col-sm-2 control-label">个性名称：</label>
            <div class="col-sm-10 myInput">
                <input type="text" id="pname" class="form-control" placeholder="给自己起个有个性的名字吧.." name="pname" value="${errorUpData.up_pname}">
            </div>
        </div>
        <div class="form-group ">
            <label for="ptext" class="col-sm-2 control-label">修改签名：</label>
            <div class="col-sm-10 myInput">
                <input type="text" id="ptext" class="form-control"  placeholder="个性签名.." name="ptext" value="${errorUpData.up_ptext}">
                <p style="color: red;font-weight: 700;">${err}</p>
            </div>
        </div>

        <button type="submit" class="btn btn-default mysubmit ">注册</button>
    </form>
</div>
</body>
</html>

