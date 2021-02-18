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
    <meta charset="utf-8" />


    <title>猿记网</title>
    <link rel="stylesheet" href="js/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="css/bobo.css">

    <script src="/js/jquery-2.0.0.min.js"></script>
    <script src="/js/jquery-bobo.js"></script>


    <style type="text/css">

        *,h3,p{
            margin: 0;
            padding: 0;
        }
        @media screen and (max-width:899px) {
            .left_box{
                width: 100% !important;

            }
            .right_box{
                display: none !important;

            }
            .imgs_box{
                height: 200px !important;

            }

        }
        @media screen and (min-width:900px) {


        }
        body{
            background-color: #f5f5f5;
        }
        .topbox{
            width: 100%;
            height: 50px;
            border-bottom: 1px solid #e7e7e7;
            line-height: 50px;
            background: #0d84c1;
            overflow: hidden;
        }
        .navBox{

            height:100%;
            width: 50px;
            float: right;
            color: #FFFFFF !important;
            cursor: pointer;

        }
        .myNavBox>a{
            text-decoration: none;

            color: #FFFFFF !important;
        }
        .so_box{
            margin: 0;
        }
        .my_title{
            float: left;

            margin-left: 20px;
            font-size: 25px;
            letter-spacing:6px;
            font-weight: 600;
            height: 100%;
            color: #ffffff;
            line-height: 45px;


        }
        .my_context{
            width: 100%;
            min-height: 1000px;
            padding-top: 15px;
            background-color: #f5f5f5;

        }
        .my_context>.full_autoBox{
            width: 85%;
            min-height: 1000px;

            background: #f5f5f5;
            margin: 50px auto;

        }
        .full_autoBox>.left_box{
            width: 70%;
            height: 100%;

            float: left;

        }
        .left_box>.imgs_box{
            width: 100%;
            height: 350px;
            position: relative;
            background: #ffffff;

        }
        .imgs_box>img{
            width: 100%;
            height: 100%;

        }
        .left_box>.type_box{
            width: 100%;
            min-height: 1000px;
            margin-top:15px ;
            background: #ffffff;
            position: relative;

        }

        .left_box>.type_box>.type_box_title{
            width: 100%;
            height: 40px;
            background: #ffffff;
            border-bottom: 1px solid #ededed;


        }
        .type_box>.type_box_title>div{
            height: 100%;
            display: inline-block;
            font-size: 18px;
            line-height: 40px;
            margin-left: 20px;
            color: #333333;
            cursor: pointer;

        }
        .type_box>.type_box_title>div:nth-child(1){
            border-bottom: 2px solid #47bb4c;
            color: #47bb4c;
        }
        .type_content>.oneLog{
            height:84px;
            padding:18px 24px 13px;
            margin-bottom: 1px;
            border-bottom: 1px solid #ededed;

            list-style-type: none;
        }
        .type_content>.oneLog>.logTitle>a{
            font-size: 18px;
            color: #3d3d3d;
        }
        .oneLog>.logContent{
            width: 100%;
            height:25px;

            /* 弹性盒子 */
            display: flex;
            justify-content:flex-start;
            align-items:center;
            flex-wrap:nowrap;


        }
        .oneLog>.logContent>div:nth-child(1){
            height:24px ;
            width: 24px;
            float: left;

            margin-right: 10px;
            border-radius: 50%;
            overflow: hidden;
        }
        .oneLog>.logContent img{
            width: 24px !important;
            height: 24px !important;

        }
        .oneLog>.logContent>div:nth-child(1)>img{width: 20px;height: 20px;}
        .oneLog>.logContent>a{
            display: inline-block;
            height:24px ;
            max-width: 20%;
            float: left;
            margin-right: 16px;

            white-space: nowrap;
            overflow: hidden;
            text-overflow:ellipsis;

        }
        .oneLog>.logContent .one_text{
            height:24px ;
            width: 75% ;
            float: left;
            margin-right: 3px;


            white-space: nowrap;
            overflow: hidden;
            text-overflow:ellipsis;

        }
        .full_autoBox>.right_box{
            width: 29%;
            height: 1511px;
            background: #ffffff;
            float: right;
            background: #ffffff;

            overflow: hidden;
            text-overflow:ellipsis;
            white-space: nowrap;

        }
        .right_box>.maxs{
            min-width:150px;
            min-height: 700px;

        }
        .right_box>.maxs>.maxs_box_title{
            width: 100%;
            height: 40px;
            border-bottom: 1px solid #ededed;
            font-size: 18px;
            line-height: 40px;
            color:#333333 ;
            box-sizing: border-box;
            padding-left: 20px;

        }
        .right_box>.maxs>.maxs_box_content{
            width: 100%;
            min-height: 500px;
            box-sizing: border-box;
            padding: 10px 0px 10px 10px;


        }
        .maxs_box_content>div{
            width: 100%;
            height: 41px;
            border-bottom: 1px solid #ededed;

        }
        .maxs_box_content>div>div{
            width: 24px;
            height: 24px;
            float: left;

            margin-right: 2%;
        }
        .maxs_box_content>div>div>img{width: 100%;height: 100%;}
        .maxs_box_content>div>a{
            display: block;
            width: 85%;
            height: 24px;
            float: left;


            overflow: hidden;
            text-overflow:ellipsis;
            white-space: nowrap;
            color:#333333 ;
        }
        .maxs_box_content>div:nth-child(1)>a,.maxs_box_content>div:nth-child(2)>a,.maxs_box_content>div:nth-child(3)>a{
            font-weight: 600;
            color:red !important;
        }
        .type_box>.toNext{
            width: 80px;
            height: 26px;
            background: #0d84c1;
            position: absolute;
            right: 0px;
            top: 5px;
            line-height: 26px;
            font-size: 15px;
            color: #ffffff;
            font-weight: 700;
            text-align: center;
            cursor: pointer;


        }
        #myHome{
            width: 0px;
        }

        /*搜索结果样式*/
        .full_autoBox>.likeData_box{
            width: 100%;
            min-height:500px ;
            background: #ffffff;
            /*搜索显示默认隐藏*/
            display: none;
            position: relative;
        }
        .likeData_box>h3{
            width: 100%;
            height: 50px;
            line-height: 50px;
            font-size: 25px;
            text-indent: 18px;
            background: #ededed;
            border-bottom: 3px solid black;
            margin-bottom: 18px;
        }
        .likeData_box>.my_hide{
            padding: 0;
            margin: 0;
            position: absolute;
            right: 6px;
            top: 3px;
            width: 80px;
            height: 40px;
            text-align: center;
            display: block;
            z-index: 1000;
        }
        /*一条帖子*/
        .log_box>div{
            width: 100%;
            height: 60px;
            padding: 24px 18px 13px;
            box-sizing: border-box;
            position: relative;
            border-bottom: 1px solid #ededed ;
            margin-bottom: 25px;

        }
        .log_box>div>a{
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
        .log_box>div>span{
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
        .log_box>div>span>a{
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
        .my_pageing{
            position: absolute;
            right: -62px;
            top: 51px;
            width: 51px;
            height: 250px;
            background: #ededed;
            border-radius: 25px;
            overflow: hidden;

        }
        .my_pageing>.rolling{
            position: absolute;
            top: 25px;
            width: 80%;
            left: 50%;
            transform: translateX(-50%);
            min-height: 300px;

        }
        .my_pageing>.rolling>div{
            width: 100%;
            height: 40px;
            line-height: 40px;
            text-align: center;
            background: #ffffff;
            border-bottom:1px solid #cccccc ;
            cursor: pointer;
            /*文字不可被选择*/
            -webkit-user-select:none;
            -moz-user-select:none;
            -o-user-select:none;
            user-select:none;
        }

    </style>

    <script src="/js/cookie-utils.js"></script>

    <%--    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.min.js"></script>--%>
    <script type="text/javascript">
        $(function(){
        	$.boboTo($(".move_ims_box")[0],$(".controller_points")[0],$(".left_move")[0],$(".right_move")[0],350);
            var user=$.getCookie("user");
            var scode=$.getCookie("scode");
            if(user!=null && scode != null){
                  $(".myNavBox").html("<a href='/up/toUpAdmin' class='inAdmin'>管理</a>");
                  $("#myHome").after("<div class='navBox deleteCookie'>退出</div>");

                  $(".deleteCookie").click(function(){
                     $.ajax({
                         url:"/up/deleteCookie",
                         type:"get",
                         success:function (data,states,xhr){
                              window.location.href="/";
                         },
                         error:function (xhr,status,error){
                             console.log("请求删除出错了..");
                         }
                     });
                  });

            }else{
                $(".myNavBox").html("<a href='/up/tologin'>登录</a>");
                $("#myHome").css("width","50px");
            }

        });
        //自动发起ajax，获取按点赞数排名的数据与最新博客的数据
        $(function(){
            var thisPage=1;
            var onePageNumber=15;
            var maxpageNumber=-1;
            $.ajax({
                    url:"/log/getMinDateNumber",
                    dataType:"json",
                    type:"get",

                    success:function (data,states,xhr){
                        console.log("前端获取到了minDateNumber...");
                        var minDateNumber=data.minDateNumber;
                        if(minDateNumber%onePageNumber!=0){
                            maxpageNumber=parseInt(minDateNumber/onePageNumber)+1;
                        }else{
                            maxpageNumber=minDateNumber/onePageNumber;
                        }


                    },
                    error:function (xhr,status,error){
                        console.log("出错了..");
                    }
            });
            var isExistMaxpageNumber=setInterval(function(){
                var request=0
                if(maxpageNumber!=-1){
                    getMinDateData();
                    clearInterval(isExistMaxpageNumber);
                }
                request++;
                if(request>1000){
                    alert("请检查网络！");
                }

            },50);
            //用于初始化或用户点击下一页且有初始化，就会触发
            function getMinDateData(){
                $.ajax({
                    url:"/log/MinDateLog?thisPage="+thisPage+"&onePageNumber="+onePageNumber,
                    dataType:"json",
                    type:"get",

                    success:function (data,states,xhr){
                        console.log("最新数据获取到了...");
                        console.log(data);
                        $(".type_content").html("");
                        $.each(data,function (index,value){
                            $(".type_content").append("<ul class='oneLog'><li class='logTitle'><a href='/log/queryByLogId?logid="+value.log_id+"'>"+value.log_title+"</a></li><li class='logContent'><div><img src='"+value.up_headImg+"'  /></div><a href='/up/toUpHome?upid="+value.up_id+"'>"+value.up_pname+"</a><div class='one_text'>"+value.log_content+"</div></li></ul>");
                        });

                    },
                    error:function (xhr,status,error){
                        console.log("出错了..");
                    }
                });

            }

            $(".toNext").click(function(){
                console.log("页数是="+maxpageNumber);
                if(maxpageNumber!=-1 && (thisPage+1)<=maxpageNumber){
                    thisPage++;
                    getMinDateData();
                }else{
                    alert("未获取到数据！");
                }


            });

            //自动发起ajax请求，获取点赞排行
            var firstNumber=10;
            $.ajax({
                url:"/log/getUpTopNumberFirst?upTopNumberFirstNumber="+firstNumber,
                dataType:"json",
                type:"get",

                success:function (data,states,xhr){
                    console.log("前端获取到了UptopData...");
                    console.log(data);
                    $(".maxs_box_content").html("");
                        $.each(data,function (index,value){
                        $(".maxs_box_content").append("<div><div><img src='"+value.up_headImg+"'></div><a href='/log/queryByLogId?logid="+value.log_id+"'>"+value.log_title+"</a></div>");
                    });

                },
                error:function (xhr,status,error){
                    console.log("出错了..");
                }
            });
            $("#myHome").click(function(){
                window.location.href="/up/toLogon";

            });

            <%--搜索功能的实现--%>

            $(".my_hide").click(function(){
                $(".left_box,.right_box").css("display","block");
                $(".likeData_box").css("display","none");

            });
            //回车搜索功能
            $(".my_so_input").keydown(function(event){
                event=event ||window.event;
                if(event.keyCode==13){
                     $(".my_so").click();

                }

            });

            //现在的页数
            var so_thisPage=1;
            //最大页数,控制着可生成的最大盒子数
            var maxPageNumber=-1;
            //盒子父元素
            var pageBox=$(".rolling");


            //搜索结果的条数及内容
            var likeNumber=-1;
            var likeValue="";
            $(".my_so").click(function(){
                likeValue=$(".my_so_input").val();
                //发出请求获取搜索结果的条数
                if(likeValue!=""){
                    /*隐藏了主页的左右box*/
                    $(".left_box,.right_box").css("display","none");
                    $(".likeData_box").css("display","block");
                    $.ajax({
                        url:"/log/getLikeNumber?likeValue="+likeValue,
                        dataType:"json",
                        type:"get",
                        success:function (data,states,xhr){
                            console.log("前端获取到了搜索将会得到的条数...");
                            if((likeNumber=data.likeNumber)>0){
                                //计算能分多少页
                                console.log("记录数是="+likeNumber%15);
                                maxPageNumber=(likeNumber%15!=0)?(parseInt(likeNumber/15)+1):(parseInt(likeNumber/15));
                                $(".rolling").html("");
                                //初始化前端分页组件
                                MyPageing(so_thisPage,maxPageNumber,pageBox);
                                //初始化页面内容
                                toGetLimitDate(likeValue,1,15);
                            }
                        },
                        error:function (xhr,status,error){
                            console.log("出错了..");
                        }
                    });


                }else{
                    alert("内容不能为空！");
                }

            });
            function toGetLimitDate(likeValue,requestPageNumber,numberToPage){
                $.ajax({
                        url:"/log/getLogLikeData?likeValue="+likeValue+"&requestPageNumber="+requestPageNumber+"&numberToPage="+numberToPage,
                        dataType:"json",
                        type:"get",

                        success:function (data,states,xhr){
                            console.log("前端获取到了搜索数据...");
                            console.log(data);
                            $(".log_box").html("");

                            $.each(data,function (index,value){
                                $(".log_box").append("<div><a href='/log/queryByLogId?logid="+value.log_id+"'>"+value.log_title+"</a><span>"+value.log_content+"</span></div>");
                            });

                        },
                        error:function (xhr,status,error){
                            console.log("出错了..");
                        }
                    });

            }

            <%--创新分页组件--%>
            function MyPageing(so_thisPage,maxPageNumber,pageBox){
                //现在最高的盒子是
                thisMaxboxNumber=0;
                //点过的最大高度
                pointMaxboxNumber=0;
                toCBox((maxPageNumber>5)?5:maxPageNumber);
                $(".rolling").on("click","div",function (){
                      var number=(so_thisPage=parseInt($(this).text()))-3;

                      $(this).css({
                          "borderBottom": "2px solid #34e79b"
                      }).siblings("div").css({
                           "borderBottom": "1px solid #ededed"
                      });
                      //根据点击的数字获取对应的页面
                      toGetLimitDate(likeValue,so_thisPage,15);
                      if(so_thisPage>pointMaxboxNumber){
                         var addNumber=0;
                         ((thisMaxboxNumber+(so_thisPage-pointMaxboxNumber))>maxPageNumber)?(addNumber=maxPageNumber-thisMaxboxNumber):(addNumber=so_thisPage-pointMaxboxNumber);
                         toCBox(addNumber);
                         pointMaxboxNumber=so_thisPage;
                      }
                   　　if(number>0){
                        //实现了的自主滑动
                         var moveUp=number*40;
                         $(".rolling").stop(true,true).animate({
                            "top":-(moveUp-25)

                         },200);

                      }else{
                         $(".rolling").stop(true,true).animate({
                            "top":"25px"

                         },200);
                      }

                });
                //生成指定数量的盒子
                function toCBox(number){
                    if(number!=null){
                        for(var i=0;i<number;i++){
                            pageBox.append("<div>"+(++thisMaxboxNumber)+"</div>");
                        }
                    }
                    console.log("添加成功。。。");
                }

            }
            <%--最新与公告的切换--%>
            $(".type_box_title").on("click","div",function(){
                $(this).css({
                    "borderBottom":"2px solid #47bb4c",
                    "color":"#47bb4c"
                }).siblings("div").css({
                    "borderBottom":"none",
                    "color":"grey"
                });
                var content_box=$(".type_box>.inContent_box").eq($(this).index());
                content_box.fadeIn(350).siblings(".inContent_box").fadeOut(300);
            });


        });


    </script>

</head>

<body>
<div class="topbox navbar-fixed-top navbar navbar-default" >
    <div class="my_title">
        <small>猿记网</small>
    </div>
    <div class="navBox " id="myHome">
        注册
    </div>


    <div class="navBox myNavBox" id="loginOrCotroller">
        <c:set var="isLogin" scope="request" value="${isLogin}"/>
        <c:if test="${isLogin ==null}">
            登录
        </c:if>
        <c:if test="${isLogin ==true}">
            管理
        </c:if>
    </div>



    <div class="navbar-form navbar-right  so_box" >
        <div class="form-group">
            <input type="text" class="form-control my_so_input"  placeholder="搜索文章" value="" />
        </div>
        <button type="button" class="btn btn-default navbar-btn my_so">搜索</button>
    </div>
</div>
<main class="my_context">
    <div class="full_autoBox">
        <div class="left_box">
            <div class="imgs_box">
                <!-- 轮播图 -->
                <div class="bobo_box">
                    <ul class="move_ims_box">
                        <li><img src="/img/k1.jpg" /></li>
                        <li><img src="/img/k2.png" /></li>
                        <li><img src="/img/k3.png" /></li>
                    </ul>
                    <ul class="controller_points">

                    </ul>
                    <div class="left_move"><</div>
                    <div class="right_move">></div>
                </div>
            </div>
            <div class="type_box">
                <div class="type_box_title">
                    <div>最新</div>
                    <div>公告</div>
                </div>
                <div class="toNext">
                    下一页
                </div>
                <div class="type_content my_minDate inContent_box">

                </div>
                <div class="notice inContent_box">

                </div>

            </div>
        </div>
        <div class="right_box">
            <div>
            </div>
            <div class="maxs">
                <div class="maxs_box_title">
                    <div>榜单</div>
                </div>
                <div class="maxs_box_content">


                </div>
            </div>

        </div>

        <div class="likeData_box">
            <h3>搜索结果</h3>
            <button type="button" class="btn btn-default navbar-btn my_hide">返回</button>
            <div class="my_pageing">
                <div class="rolling">

                </div>

            </div>

            <div class="log_box">


            </div>
        </div>

    </div>



</main>

</body>
</html>

