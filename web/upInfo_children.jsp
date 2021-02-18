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
    <link rel="stylesheet" href="/js/bootstrap/css/bootstrap.css">
    <style type="text/css">
        *,h3,p,main{
            margin: 0;
            padding: 0;

        }
        body{

            background: url("/img/k6.jpg") center/100% 100% no-repeat;

        }
        main{
            width: 100%;
            height: 100%;
            position: fixed;

        }

        #myData{
            width: 100%;
            margin-top: 40px;
            box-sizing: border-box;
            padding-left:40px ;



        }
        #myData>p{
            line-height: 50px;
            font-size: 20px;
            color: #cc7831;
        }
        #myData>button:nth-child(1){
            width: 50px;
            height: 30px;
            padding: 0;
            background: #cc7831 !important;
            line-height: 30px;
            margin-top:20px ;
            border: none;
        }
        #myData>button:nth-child(2){
            width: 120px !important;
            text-align: center;
            height: 30px;
            padding: 0;
            background: #cc7831 !important;
            line-height: 30px;
            margin-top:20px ;
            border: none;
        }

    </style>
    <script src="/js/jquery-2.0.0.min.js"></script>
    <script src="/js/cookie-utils.js"></script>
    <script type="text/javascript">

        $(function(){
            var upid=null;
            $.ajax({
              url:"/up/getUpData?upid="+${upid},
              dataType:"json",
              type:"get",

              success:function (data,states,xhr){
                  console.log(data);
                  upid=data.up_id;
                  $(".inUpData_name").text(data.up_pname);
                  var dayed=Math.floor((new Date().getTime()-data.up_cdate)/1000/60/24/24);
                  $(".inUpData_date").text(dayed);
                  $(".inUpData_ptext").text(data.up_ptext);


              },
              error:function (xhr,status,error){
                  console.log("出错了..");
              }


            });
            //监听如果获取到更新管理按钮上的链接
            var isGetUpid=setInterval(function(){
               if(upid!=null){
                 clearInterval(isGetUpid);
                 console.log("获取到了upid="+upid);
                 $("#myData>.toUpdateMyData").click(function(){
                    window.location.href="/up/toUpUpdatePdata?upid="+upid

                 });
               }

            },50);
            $("#myData>.toMyHome").click(function(){
                if(upid!=null){
                    window.location.href="/up/toUpHome?upid="+upid
                }

            });


        });



    </script>
</head>
<body>
    <main>
        <div id="myData">
            <p>欢迎【<span class="inUpData_name"></span>】,博客天数：<span class="inUpData_date"></span></p>
            <p>个性签名：<span class="inUpData_ptext"></span></p>
            <button type="button" class="btn btn-primary toUpdateMyData">修改</button>
            <button type="button" class="btn btn-primary toMyHome">查看我的主页</button>
        </div>

    </main>

</body>
</html>

