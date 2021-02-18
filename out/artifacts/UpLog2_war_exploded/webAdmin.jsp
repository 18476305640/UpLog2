<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<html>
<head>
    <title>猿记网</title>

    <html>
    <head>
        <script src="/js/jquery-2.0.0.min.js"></script>

        <link rel="stylesheet" href="/js/bootstrap/css/bootstrap.css">
        <style type="text/css">
            *,h3,p{
                margin: 0;
                padding: 0;
            }
            .page_controller{
                width: 100%;
                height: 0px;

            }
            .page_controller>span{
                display: block;
                width: 100%;
                height: 30px;
                text-align: center;
                line-height: 30px;
                border-bottom: 1px solid #cccccc;
                cursor: pointer;

                -webkit-user-select:none;
                -moz-user-select:none;
                -o-user-select:none;
                user-select:none;
            }
            .page_content_box{
                width: 100%;
                height:70%;
            }
            .page_content_box>div{
                display: none;

            }
            .main_box{
                width: 100%;
                height: 70%;
                position: relative;
            }
            .main_box>.list_but{
                display: inline-block;
                height: 40px;
                position: absolute;
                right: 0px;
                top: 0px;
                cursor: pointer;
            }
            .main_box>.list_but>div:nth-child(1){
                width: 0px;
                height: 0px;
                position: absolute;
                right: 0px;
                top: 0px;
                border-left: 20px solid transparent;
                border-right: 20px solid #0d84c1;
                border-top: 20px solid #0d84c1;
                border-bottom: 20px solid transparent;
                z-index: 100;

            }
            .main_box>.list_but>div:nth-child(2){
                width: 0px;
                height: 0px;
                position: absolute;
                right: 0px;
                top: 0px;
                border-left: 10px solid transparent;
                border-right: 10px solid #f3f3f3;
                border-top: 10px solid #f3f3f3;
                border-bottom: 10px solid transparent;
                z-index: 1000;


            }

            /*内容区*/
            .page_content_box>div:nth-child(1){
                display: block;

            }
            /*导航块*/
            .page_content_box>div>div:nth-child(1){
                width: 100%;
                height: 40px;
                background: #f3f3f3;
                border-bottom: #cccccc;

            }
            .page_content_box>div>div:nth-child(1)>div{
                height: 100%;
                padding: 0px 10px;
                line-height: 40px;
                font-size: 15px;
                float: left;
                cursor: pointer;
                border-right: 1px solid #cccccc;

                -webkit-user-select:none;
                -moz-user-select:none;
                -o-user-select:none;
                user-select:none;

            }
            /*实体块*/
            .page_content_box>div>div:nth-child(2){
                width: 100%;
                height: 70%;
                background:#ffffff;

            }
            .page_content_box>div>div:nth-child(2)>div{
                width: 100%;
                height: 70%;
                display: none;

            }
            .page_content_box>div>div:nth-child(2)>div:nth-child(1){
                display: block;

            }

            .list_but>div:nth-child(1){


            }
            /*帖子查看主体*/
            .my_addPageMain{
                width: 100%;
                height: 760px !important;
                position: relative;

            }
            .my_addPageMain{
                width: 100%;
                position: relative;
            }
            .pageing{
                width: 100%;
                height: 80px;
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
                width: 200px !important;
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
            a{
                color: #333333 !important;
            }
            .start_verify{
                float: right;
                display: block;


            }
            .auditMode{
                display: none;
                position: absolute;
                left: 0px;
                right: 0px;
                top: 0px;
                bottom: 0px;
                width: 100%;
                height: 100%;
            }
            .auditMode>div{
                width: 100%;
                height: 100%;
                background: rgba(115, 115, 115,.5);


            }
            .auditMode>div>div:nth-child(1){
                width: 100%;
                padding: 15px 18px;
                background: #ffffff;
                border-top:2px solid #0d84c1;



            }
            .auditMode>div>div:nth-child(2){
                display: block;
                width: 100%;

                background: #ffffff;
                position: absolute;
                left: 0px;
                top: 68px;
                right: 0px;
                bottom: 0px;
                box-sizing: border-box;
                padding: 15px 18px;

            }
            .auditMode>div>div:nth-child(2)>p{
                border-bottom: 1px solid #f2f2f2;
                margin-bottom: 15px;
            }
            .log_search{
                height: 100%;
                float: right;
                margin-right: 134px;

            }
            .log_search>input{
                width: 200px;
                height: 30px;
                border-radius: 4px;
                box-sizing: border-box;
                margin: 5px 13px;
                padding-left: 15px;
                border: 1px solid #cccccc !important;
            }
            .log_search>button{
                width: 56px;
                height: 30px;
                border-radius:4px;
                box-sizing: border-box;
                margin: 4px 0px;
                border: 1px solid #cccccc !important;


            }
        </style>
        <script type="text/javascript">

            $(function(){
                var thisIsOpen=false;
                $(".list_but").click(function(){
                   if(! thisIsOpen){
                        var lengthHeight=$(".page_controller").children("span").length*30;
                        $(".page_controller").animate({"height":lengthHeight},300);
                        thisIsOpen=true;

                   }else{
                        $(".page_controller").animate({"height":"0px"},300);
                        thisIsOpen=false;
                   }
                });

                var thisBox=1;
                $(".page_controller>span").eq(thisBox-1).css({"color":"#47bb4c"});
                $(".page_controller").on("click","span",function(){
                    $(this).css({"color":"#47bb4c"}).siblings("span").css("color","#333333");
                    thisBox=$(this).index()+1;
                    $(".page_content_box>div").eq($(this).index()).css("display","block").siblings("div").css("display","none");;
                    <%--自动关闭--%>
                    $(".page_controller").animate({"height":"0px"},300);
                    thisIsOpen=false;
                });

                <%--上面是总控制--%>

<%--                &lt;%&ndash;实体块控制&ndash;%&gt;--%>
<%--                $(".page_content_box>div>div:nth-child(1)").on("click","div",function(){--%>
<%--                    $(this).parent("div").next("div").children().eq($(this).index()).css("display","block").siblings("div").css("display","none");--%>

<%--                });--%>

                <%--现在是帖子管理区--%>
                <%--帖子查看--%>
                var thisPage_all=0;
                var maxPageNumber_all=0;
                var pageNumber_all=15;
                var thisType=null;
                var sosVal="";
                $(".reder_log").click(function(){
                    $(this).css("background","#ffffff").siblings().css("background","#f3f3f3");
                    getTypeLog("getAll",sosVal,1,pageNumber_all);
                    $(".auditMode").css("display","none");
                });
                $(".reder_log").click();

                <%--新帖审核--%>
                $(".needAdopt").click(function(){

                    $(this).css("background","#ffffff").siblings().css("background","#f3f3f3");
                    getTypeLog("needAdopt",sosVal,1,pageNumber_all);
                    $(".auditMode").css("display","none");
                });
                <%--需再审核--%>
                $(".needAgainAdopt").click(function(){
                    $(this).css("background","#ffffff").siblings().css("background","#f3f3f3");
                    getTypeLog("needAgainAdopt",sosVal,1,pageNumber_all);
                    $(".auditMode").css("display","none");
                });

                <%--帖子模块的ajax:能获取指定类型的log且分页的数据--%>
                function getTypeLog(type,likeValue,TargetPage,pageLength){
                    <%--type:getAll,needAdopt,needAgainAdopt--%>

                    $.ajax({
                        url:"/report/adminGetType?logType="+type+"&TargetPage="+TargetPage+"&pageLength="+pageLength+"&likeValue="+likeValue,
                        dataType:"json",
                        type:"get",
                        success:function (data,states,xhr){

                            console.log("前端获取到了对应类型的帖子...");
                            thisType=type;
                            $(".logsBox_content").html("");
                            thisPage_all=TargetPage;
                            <%--发起ajax请求获取可分页数--%>
                            if(thisType=="getAll"){
                                maxPageNumber_all=getAllLogNumber("",pageLength);
                                $.each(data,function(index,value){
                                    var oneLog=$("<tr><td style='display: none' class='logInfo'>"+value.log_id+"</td><td>"+((thisPage_all-1)*pageNumber_all+index+1)+"</td><td><a target='_blank' href='/log/queryByLogId?logid="+value.log_id+"'>"+value.log_title+"</a></td><td class='oneLog_content'>"+value.log_title+"</td><td class='oneLog_controll'><button type='button' class='btn btn-success' data-mydata='open'>查看</button><button type='button' class='btn btn-warning ' data-mydata='closeLog'>关进小黑屋</button></td></tr>");
                                    $(".logsBox_content").append(oneLog);
                                });
                            }else if(thisType=="needAgainAdopt"){
                                maxPageNumber_all=getTypeLogPageNumber(0.5,"",pageLength);
                                $.each(data,function(index,value){
                                    var oneLog=$("<tr><td style='display: none' class='logInfo'>"+value.log_id+"</td><td>"+((thisPage_all-1)*pageNumber_all+index+1)+"</td><td><a target='_blank' href='/log/queryByLogId?logid="+value.log_id+"'>"+value.log_title+"</a></td><td class='oneLog_content report_content'>"+value.log_title+"<button type='button' class='btn btn-success start_verify'>审核模式</button></td></td><td class='oneLog_controll'><button type='button' class='btn btn-success report_no' data-mydata='report_no'>举报失败</button><button type='button' class='btn btn-warning report_ok' data-mydata='report_ok'>举报成功</button></td></tr>");
                                    $(".logsBox_content").append(oneLog);
                                });
                            }else if(thisType=="needAdopt"){
                                maxPageNumber_all=getTypeLogPageNumber(0,"",pageLength);
                                $.each(data,function(index,value){
                                    var oneLog=$("<tr><td style='display: none' class='logInfo'>"+value.log_id+"</td><td>"+((thisPage_all-1)*pageNumber_all+index+1)+"</td><td><a target='_blank' href='/log/queryByLogId?logid="+value.log_id+"'>"+value.log_title+"</a></td><td class='oneLog_content'>"+value.log_title+"</td><td class='oneLog_controll'><button type='button' class='btn btn-success' data-mydata='adopt_ok'>审核通过</button><button type='button' class='btn btn-warning closeLog_all' data-mydata='adopt_no'>不通过</button></td></tr>");
                                    $(".logsBox_content").append(oneLog);
                                });
                            }
                            console.log("最大分页数=="+maxPageNumber_all);
                            <%--填充后完，修改分页控制内容--%>

                            $(".thisPage_all").val((maxPageNumber_all>0)?thisPage_all:0);
                            $(".sumPageNumber_all").text(maxPageNumber_all);

                        },
                        error:function (xhr,status,error){
                            console.log("出错了..");
                        }
                    });

                }
                <%--帖子查看分页内容--%>
                $(".pageing").on("click","button",function(){
                    var data=$(this).data("mydata");
                    switch(data){
                        case "first":
                            getTypeLog(thisType,"",1,pageNumber_all);
                            break;
                        case "last":
                            getTypeLog(thisType,"",maxPageNumber_all,pageNumber_all);
                            break;
                        case "prev":
                            if(thisPage_all-1>0){
                                getTypeLog(thisType,"",thisPage_all-1,pageNumber_all);
                            }
                            break;
                        case "next":
                            if(thisPage_all+1<=maxPageNumber_all){
                                getTypeLog(thisType,"",thisPage_all+1,pageNumber_all);
                            }
                            break;
                        case "appoint":
                            var appoint=$(".thisPage_all").val();
                            if(appoint>0 &&appoint<=maxPageNumber_all){
                                getTypeLog(thisType,"",appoint,pageNumber_all);
                            }
                            break;

                    }
                })
                <%--帖子模块的ajax:能获取指定类型的log条数与页条目数计算得到的页数--%>
                function getTypeLogPageNumber(type,likeValue,pageNumber){
                    var number=0;
                    <%--type:getAll,needAdopt,needAgainAdopt--%>
                    $.ajax({
                        url:"/report/adminGetTypeNumber?logType="+type+"&likeValue="+likeValue,
                        dataType:"json",
                        type:"get",
                        async:false,
                        success:function (data,states,xhr){
                            console.log("前端获取到了对应类型的帖子的条数了...");
                            number=data.typeLogNumber;

                        },
                        error:function (xhr,status,error){
                            console.log("出错了..");
                        }
                    });
                    if(number%pageNumber!=0){
                        return parseInt(number/pageNumber)+1;
                    }else{
                        return number/pageNumber;
                    }
                }

                <%--获取总总文章，可分页数--%>
                function getAllLogNumber(likeValue,pageNumber){
                    var allNumber=0;
                    $.ajax({
                        url:"/report/getAllLogNumber?likeValue="+likeValue,
                        dataType:"json",
                        type:"get",
                        async:false,
                        success:function (data,states,xhr){
                            var allLogNumber=data.allLogNumber;
                            console.log("前端获取到了总log数="+allLogNumber);
                            if(allLogNumber%pageNumber!=0){
                                allNumber= parseInt(allLogNumber/pageNumber)+1;
                            }else{
                                allNumber= allLogNumber/pageNumber;
                            }


                        },
                        error:function (xhr,status,error){
                            console.log("出错了..");
                        }
                    });
                    return allNumber;
                }
                function changeLogState(logid,state){
                    $.ajax({
                        url:"/report/changeLogState?logid="+logid+"&state="+state,
                        dataType:"json",
                        type:"get",
                        async:false,
                        success:function (data,states,xhr){

                            if(data.result==1){
                                if(thisPage_all>maxPageNumber_all){
                                    thisPage_all--;
                                }
                                getTypeLog(thisType,"",thisPage_all,pageNumber_all);
                            }

                        },
                        error:function (xhr,status,error){
                            console.log("出错了..");
                        }
                    });

                }
<%--                $(".logsBox_content_all").on("click",".open_all",function(){
                    var logid=$(this).parent("td").parent("tr").children().eq(0).text();
                    window.open("/log/queryByLogId?logid="+logid);

                });
                $(".logsBox_content_all").on("click",".closeLog_all",function(){
                    var logid=$(this).parent("td").parent("tr").children().eq(0).text();
                    clearLog(logid);
                });--%>
                <%--按钮聚合处理--%>
                $(".logsBox_content_all").on("click","button",function(){
                    var but_type=$(this).data("mydata");
                    var logid=$(this).parent("td").parent("tr").children().eq(0).text();
                    switch(but_type){
                        case "open":
                            window.open("/log/queryByLogId?logid="+logid);
                            break;
                        case "closeLog":
                            if(confirm("确定将【"+$(this).parent("td").parent("tr").children().eq(2).text()+"】log关进小黑屋吗？")){
                                changeLogState(logid,-1);
                            }
                            break;
                        case "report_no":
                            changeLogState(logid,1);
                            break;
                        case "report_ok":
                            if(confirm("确认【"+$(this).parent("td").parent("tr").children().eq(2).text()+"】log举报通过吗？")){
                                changeLogState(logid,-1);
                            }
                            break;
                        case "adopt_no":
                            if(confirm("确认【"+$(this).parent("td").parent("tr").children().eq(2).text()+"】log审核不通过吗？")){
                                changeLogState(logid,-1);
                            }
                            break;
                        case "adopt_ok":
                            changeLogState(logid,1);
                            break;

                    }

                });
                <%--举报信息动态显示--%>
                function getReportData(type,logid){
                    $.ajax({
                        url:"/report/getReportByLog?type="+type+"&logid="+logid,
                        dataType:"json",
                        type:"get",
                        async:false,
                        success:function (data,states,xhr){
                            console.log("审核模式接收到了信息。。。");
                            var box=$(".auditMode>div>div:nth-child(2)");
                            box.html("");
                            if(type=="report"){
                                $.each(data,function(index,value){
                                    box.append("<p>"+value.report_content+"</p>");
                                });
                            }else if(type=="log"){
                                box.append("<p>"+data.log_content+"</p>");
                            }


                        },
                        error:function (xhr,status,error){
                            console.log("出错了..");
                        }
                    });

                }
                var logid="";
                var thisLog=null;
                $(".my_tbody").on("click",".start_verify",function(){
                    thisLog=$(this);
                    <%--显示控制窗口--%>
                    $(".auditMode").slideDown(800);
                    <%--向后台发起请求获取指定logid的举报信息--%>
                    logid=$(this).parent("td").parent("tr").children("td").eq(0).text();
                    getReportData("report",logid);
                });
                $(".auditMode").on("click","button",function(){
                    var but_type=$(this).data("mydata");
                    switch(but_type){
                        case "see_report":
                            getReportData("report",logid);
                            break;
                        case "see_log":
                            getReportData("log",logid);
                            break;
                        case "report_no":
                            $(".auditMode").slideUp(800);
                            thisLog.parent("td").parent("tr").children("td").eq(4).find(".report_no").click();
                            break;
                        case "report_ok":
                            $(".auditMode").slideUp(800);
                            thisLog.parent("td").parent("tr").children("td").eq(4).find(".report_ok").click();
                            break;
                    }

                });
                <%--项目搜索--%>
                $(".sos_but").click(function(){
                    var sosValue=$(this).parent().children("input").val();
                    sosVal=sosValue;
                    switch(thisType){
                        case "getAll":
                            $(".reder_log").click();
                            sosVal="";
                            break;
                        case "needAdopt":
                            $(".needAdopt").click();
                            sosVal="";
                            break;
                        case "needAgainAdopt":
                            $(".needAgainAdopt").click();
                            sosVal="";
                            break;


                    }

                });



            });




    </script>
    </head>
<body>
    <div class="page_controller">
        <span>帖子管理</span>
        <span>用户管理</span>
        <span>公告管理</span>
    </div>
    <div class="main_box">
        <%--触发块--%>
        <div class="list_but">
            <div></div>
            <div></div>
        </div>

        <div class="page_content_box">
            <%--帖子管理--%>
            <div>
                <div>
                    <div class="reder_log">帖子查看</div>
                    <div class="needAdopt">帖子审核</div>
                    <div class="needAgainAdopt">再审帖子</div>
                    <span class="log_search">
                        <input type="text" required placeholder="搜索当前块项目..."/>
                        <button type="button" class="sos_but">搜索</button>
                    </span>

                </div>
                <div>
                    <%--.page_content_box>div:nth-child(2)>div:nth-child(1)--%>
                    <div>
                        <%--帖子查看主体--%>
                        <div class="my_addPageMain">
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <td>#</td>
                                    <td>标题</td>
                                    <td>内容</td>
                                    <td>操作</td>
                                </tr>
                                </thead>
                                <tbody class="my_tbody logsBox_content logsBox_content_all">


                                </tbody>
                            </table>
                            <div class="auditMode">
                                <div>
                                    <div>
                                        <button type='button' class='btn btn-success' data-mydata='see_report'>查看举报</button></td>
                                        <button type='button' class='btn btn-success' data-mydata='see_log'>查看文章</button></td>
                                        <button type='button' class='btn btn-success' data-mydata='report_no'>举报失败</button>
                                        <button type='button' class='btn btn-warning closeLog_all' data-mydata='report_ok'>举报成功</button>
                                    </div>
                                    <div>

                                    </div>
                                </div>

                            </div>
                            <div class="pageing">
                                <button type="button" class="btn" data-mydata="first">首页</button>
                                <button type="button" class="btn" data-mydata="prev">上一页</button>
                                <input type="text" onkeyup = "value=value.replace(/[^\d]/g,'')" value="00" class="toPage_input thisPage_all" >&nbsp;/&nbsp;<span class="sumPageNumber_all">00</span>
                                <button type="button" class="btn" data-mydata="appoint">跳转</button>
                                <button type="button" class="btn" data-mydata="next">下一页</button>
                                <button type="button" class="btn" data-mydata="last">尾页</button>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
            <%--用户管理--%>
            <div>
                <div>
                    <div>用户搜寻</div>
                    <div>权限管理</div>
                </div>
                <div>
                    <div>用户搜寻</div>
                    <div>权限管理</div>


                </div>
            </div>

            <%--公告管理--%>
            <div>
                <div>
                    <div>发公告</div>
                    <div>查看我的公告</div>
                    <div>总公告</div>
                </div>
                <div>
                    <div>发公告</div>
                    <div>查看我的公告</div>
                    <div>总公告</div>


                </div>
            </div>

        </div>

    </div>
</body>
</html>
