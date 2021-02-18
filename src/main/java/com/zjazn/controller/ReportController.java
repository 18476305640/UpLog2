package com.zjazn.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.zjazn.pojo.Log;
import com.zjazn.pojo.Report;
import com.zjazn.pojo.Up;
import com.zjazn.service.LogService;
import com.zjazn.service.ReportService;
import com.zjazn.service.UpService;
import com.zjazn.utils.CookieUtils;
import com.zjazn.utils.Root;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping("/report")
public class ReportController {
    @Autowired
    @Qualifier("UpServiceImpl")
    private UpService upService;
    @Autowired
    @Qualifier("LogServiceImpl")
    private LogService logService;

    @Autowired
    @Qualifier("ReportServiceImpl")
    private ReportService reportService;

    @RequestMapping("/toAddReport")
    @ResponseBody
    public String toAddReport(Integer logid, String reportContent, HttpServletRequest request, HttpServletResponse response) throws JsonProcessingException {
        System.out.println("后端获取到了前端提交举报的信息："+logid+";"+reportContent);
        String user = CookieUtils.getCookie(request, "user");
        String scode = CookieUtils.getCookie(request, "scode");
        Boolean hasRoot = Root.isHasRoot(upService, user, scode);
        HashMap<String, String> map = new HashMap<>();
        if(hasRoot){
            /*当认证成功时*/
            Up up = upService.queryByUserName(user);
            Report report = new Report();
            /*log_id, report_upid, report_content, report_date*/
            report.setLog_id(logid);
            report.setReport_upid(up.getUp_id());
            report.setReport_content(reportContent);
            report.setReport_date(new Date());
            int i = reportService.insertReport(report);
            logService.updateLogState(logid,0.5f);
            if (i>0){
                map.put("info","1");
            }else{
                map.put("info","0");
            }


        }else{
            /*当认证失败时*/
            map.put("info","-1");
        }
        ObjectMapper om = new ObjectMapper();
        String json = om.writeValueAsString(map);
        return json;

    }
    @ResponseBody
    @RequestMapping("/adminGetType")
    public String adminGetType(String logType,String likeValue,Integer TargetPage,Integer pageLength) throws JsonProcessingException {
        //<%--type:getAll,needAdopt,needAgainAdopt--%>
        System.out.println("后端获取到参数："+logType+";"+TargetPage+";"+pageLength);
        List<Log> logs =null;
        switch (logType){
            case "getAll":
                System.out.println("获取全部的log..");
                logs = logService.queryAll(likeValue,(TargetPage-1)*pageLength,pageLength);
                System.out.println(logs.toString());
                break;
            case "needAdopt":
                System.out.println("获取需审核的新帖..");
                logs=logService.queryLogByState(0,likeValue,(TargetPage-1)*pageLength,pageLength);
                System.out.println(logs.toString());
                break;
            case "needAgainAdopt":
                System.out.println("获取被举报的帖子..");
                logs=logService.queryLogByState(0.5f,likeValue,(TargetPage-1)*pageLength,pageLength);

                break;

        }
        ObjectMapper om = new ObjectMapper();
        String json = om.writeValueAsString(logs);

        return json;
    }
    @ResponseBody
    @RequestMapping("/adminGetTypeNumber")
    public String adminGetTypeNumber(float logType,String likeValue) throws JsonProcessingException {
        int typeLogNumber = logService.getTypeLogNumber(logType,likeValue);
        HashMap<String, Integer> map = new HashMap<>();
        map.put("typeLogNumber",typeLogNumber);
        ObjectMapper om = new ObjectMapper();
        String json = om.writeValueAsString(map);
        return json;
    }
    /*获取全部正常帖子的数量*/
    @ResponseBody
    @RequestMapping("/getAllLogNumber")
    public String getAllLogNumber(String likeValue) throws JsonProcessingException {
        int allLogNumber = logService.getAllLogNumber(likeValue);
        System.out.println("获取到了全部log数="+allLogNumber);
        HashMap<String, Integer> map = new HashMap<>();
        map.put("allLogNumber",allLogNumber);
        ObjectMapper om = new ObjectMapper();
        String json = om.writeValueAsString(map);
        return json;
    }
    @ResponseBody
    @RequestMapping("/changeLogState")
    public String getAllLogNumber(Integer logid,Integer state) throws JsonProcessingException {
        int i = logService.updateLogState(logid, state);
        Integer clearData=-1;
        if(i>0){
            clearData=1;
            if(state==1){
                System.out.println("经过了目标1！");
                reportService.deleteByLogId(logid);
                System.out.println("经过了目标2！");


            }
        }
        System.out.println("获取到了全部log数="+clearData);
        HashMap<String, Integer> map = new HashMap<>();
        map.put("result",clearData);
        ObjectMapper om = new ObjectMapper();
        String json = om.writeValueAsString(map);
        return json;
    }
    @ResponseBody
    @RequestMapping("/getReportByLog")
    public String getAllLogNumber(Integer logid,String type) throws JsonProcessingException {
        String json=null;
        ObjectMapper om = new ObjectMapper();
        if(type.equalsIgnoreCase("report")){
            System.out.println("后端正在获取指定log的举报信息！~");
            List<Report> reports = reportService.queryByLogId(logid);
            System.out.println("target~");
            if(reports.size()>20){
                reports=reports.subList(0,20);
            }
            json = om.writeValueAsString(reports);

        }else if(type.equalsIgnoreCase("log")){
            System.out.println("后端正在获取指定logid文章信息！~");
            Log log = logService.queryByLogId(logid);
            json = om.writeValueAsString(log);

        }
        System.out.println("后端正在返回信息到前端~");
        return json;
    }

}
