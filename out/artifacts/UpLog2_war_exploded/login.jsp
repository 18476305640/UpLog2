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

    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
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

    </style>
</head>
<body>
    <div class="main">
        <form class="form-horizontal" action="/up/login" method="post">

            <div class="form-group">
                <label for="inputEmail3" class="col-sm-2 control-label">账号</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="inputEmail3" name="user" placeholder="User">
                </div>
            </div>
            <div class="form-group">
                <label for="inputPassword3" class="col-sm-2 control-label">密码</label>
                <div class="col-sm-10">
                    <input type="password" class="form-control" id="inputPassword3" placeholder="Password" name="password">
                    <p style="color: red;">${err}</p>
                </div>
            </div>

            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <button type="submit" class="btn btn-default ">登录</button>
                </div>
            </div>
        </form>
    </div>
</body>
</html>

