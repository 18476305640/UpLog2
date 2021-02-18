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
        main{
            display: block;
            width: 100%;
            height: 100%;
            position: fixed;
        }
        #my_title{
            display: block;
            width: 100%;
            height: 50px;

            background-color: #f3f3f3;
            border-bottom: 1px solid #cccccc;
            box-sizing: border-box;
            padding-left: 10px;
        }
        #my_title>span:nth-child(1){
            font-size: 25px;
            line-height: 50px;
            float: left;
        }
        #my_title>span:nth-child(2){
            font-size: 15px;
            line-height: 50px;
            margin-left: 10px;
            cursor: pointer;
            color:gray;

        }
        #my_content{
            width: 100%;
            height: 95%;


        }
        #my_content>.my_controller{
            height: 100%;
            width: 15%;
            background-color: #f3f3f3;
            border-right: 1px solid #cccccc;
            float: left;
        }
        #my_content>.my_controller>div{
            width: 100%;
            height: 40px;
            border-bottom: 1px solid #cccccc;
            font-size: 15px;
            line-height: 40px;
            text-align: center;
            cursor: pointer;

        }
        #my_content>.my_controller>div>a{
            text-decoration: none;
        }
        #my_content>.my_vive{
            height: 100%;
            width: 84%;
            border: none;

            float: right;
            border-left: 1px solid #cccccc;

        }
    </style>
    <script src="/js/jquery-2.0.0.min.js"></script>
    <script src="/js/cookie-utils.js"></script>
    <script type="text/javascript">
        $(function(){

            //根据本地的cookie，获取up的信息
            var code=$.getCookie("scode");
            var user=$.getCookie("user");
            var upid=null;
            if(user!=null){
                  console.log("改送ajax。。。");
                  $.ajax({
                    url:"/up/myAdmin?user="+user+"&scode="+code,
                    dataType:"json",
                    type:"get",

                    success:function (data,states,xhr){
                        upid=data.up_id;
                        if(data.up_power>=100){
                            $(".my_controller").append("<div mytype='upIsAdmin'><a>我的特权</a></div>");
                        }


                    },
                    error:function (xhr,status,error){
                        window.location.href="/";
                    }
                  });
            }
            //监听如果获取到更新管理按钮上的链接
            var isGetUpid=setInterval(function(){
               if(upid!=null){
                 clearInterval(isGetUpid);
                 console.log("获取到了upid="+upid);
                 $(".my_vive").attr("src","/up/toUpInfo_children?upid="+upid);
               }

            },50);
            $(".my_controller").on("click","div",function(){
                var type=$(this).attr("mytype");
                switch(type){
                    case "upInfo":
                        toUrl("/up/toUpInfo_children?upid="+upid);
                        break;
                    case "logUp":
                        toUrl("/log/toUpLog_children?upid="+upid);
                        break;
                    case "upNews":
                        toUrl("/upNews_children.jsp");
                        break;
                    case "upIsAdmin":
                        toUrl("/up/toMyAdmin?upid="+upid);

                }
                function toUrl(url){
                   $(".my_vive").attr("src",url);
                }

            });
            //回到首页
            $("#my_title>span:nth-child(2)").click(function(){
                window.location.href="/";
            });
        });
    </script>
</head>
<body>
   <main>
       <div id="my_title">
           <span>博客主后台管理</span>
           <span>回到首页</span>
       </div>
       <div id="my_content">
           <div class="my_controller" >
                <div mytype="upInfo">
                    <a>博主信息</a>
                </div>
               <div mytype="logUp">
                   <a>博客管理</a>
               </div>
               <div mytype="upNews">
                   <a>查阅消息</a>
               </div>

           </div>
           <iframe class="my_vive" src ="">

           </iframe>

       </div>

   </main>



</body>
</html>

