package com.zjazn.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.zjazn.data.CommentAndUp;
import com.zjazn.data.MinDateLog;
import com.zjazn.pojo.Comment;
import com.zjazn.pojo.Log;
import com.zjazn.pojo.Up;
import com.zjazn.service.CommentService;
import com.zjazn.service.LogService;
import com.zjazn.service.UpService;
import com.zjazn.utils.CookieUtils;
import com.zjazn.utils.Root;
import com.zjazn.utils.ShowChineseUtil;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.crypto.Data;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Scanner;

@Controller
@RequestMapping("log")
public class LogController {
    @Autowired
    @Qualifier("LogServiceImpl")
    private LogService logService;

    @Autowired
    @Qualifier("CommentServiceImpl")
    private CommentService commentService;

    @Autowired
    @Qualifier("UpServiceImpl")
    private UpService upService;

    @RequestMapping("/queryByLogId")
    public String inLog(int logid, Model model){

        Log log = logService.queryByLogId(logid);
        List<CommentAndUp> logComments = commentService.queryByLogId(logid);

        model.addAttribute("logContent",log);
        model.addAttribute("logComments",logComments);

        return "LogContent";
    }
    @RequestMapping("/toUpLog_children")
    public String toUpLog_children(Integer upid, Model model){
        System.out.println("进入了，值是："+upid);
        List<Log> logs = logService.queryByUpId(upid);
        //List<Comment> logComments = commentService.queryByLogId(logid);

        //去除文字样式
        for (Log md:logs){
            md.setLog_content(ShowChineseUtil.getShowCharacter(md.getLog_content(),25,"..."));
        }
        model.addAttribute("logs",logs);
        //model.addAttribute("logComments",logComments);
        System.out.println(logs.toString());
        return "upLog_children";
    }
    @RequestMapping("/toLogUpdate")
    public String toLogUpdate(String logid,Model model){
        Log log = logService.queryByLogId(Integer.valueOf(logid));
        //重要:带有样式的代码，一定要先将"替换为'否则，在前端显示会出问题
        log.setLog_content(log.getLog_content().replace("\"","'"));
        model.addAttribute("logData",log);
        return "updateLog";

    }
    //根据logid更新文章
    @RequestMapping("logUpdate")
    public String logUpdate(String logid, String logTitle, String logContent, Model model, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Log newlog = new Log();
        newlog.setLog_id(Integer.valueOf(logid));
        newlog.setLog_title(logTitle);
        newlog.setLog_content(logContent);
        Date date = new Date();
        newlog.setLog_update_date(date);
        Log log = logService.queryByLogId(Integer.valueOf(logid));
        model.addAttribute("upid",log.getUp_id());
        int i = logService.updateLog(newlog);
        if(i>0){
            System.out.println("log修改成功");


            return "redirect:/log/toUpLog_children";
        }

        return  "";

    }
    //根据logid删除文章,遇到了一个坑，删除时如果用到旧数据一定要先查
    @RequestMapping("/toDeleteLog")
    public String toDeleteLog(String logid,Model model,HttpServletRequest request, HttpServletResponse response){
        Log log = logService.queryByLogId(Integer.valueOf(logid));
        model.addAttribute("upid",log.getUp_id());

        int i = logService.deleteLog(Integer.valueOf(logid));
        if (i>0){
            System.out.println("log删除成功！");
            return "redirect:/log/toUpLog_children";

        }

        return "";
    }
    //去添加文章页面
    @RequestMapping("/toAddLog")
    public String toAddLog(Model model,HttpServletRequest request){
        System.out.println("到了后台");
//        model.addAttribute("upid",upid);
        String user = CookieUtils.getCookie(request, "user");
        String scode = CookieUtils.getCookie(request, "scode");
        Boolean hasRoot = Root.isHasRoot(upService, user, scode);
        if (hasRoot){
            Up up = upService.queryByUserName(user);
            Integer upid = up.getUp_id();
            model.addAttribute("upid",upid);
            return "AddLogPage";
        }else {
            System.out.println("没有添加权限");
            return "forward:/up/tologin";
        }


    }
    //添加文章程序
    @RequestMapping("/addLogToData")
    public String addLogToData(String upid,String logTitle,String logContent,Model model){
        System.out.println("到了添加文章处理程序");
        System.out.println(upid+";"+logTitle+";"+logContent);
        Log log = new Log();
        log.setUp_id(Integer.valueOf(upid));
        log.setLog_title(logTitle);
        log.setLog_content(logContent);

        Date thisDate = new Date();
        log.setLog_date(thisDate);
        log.setLog_update_date(thisDate);

        int i = logService.addLog(log);
        if(i>0){
            System.out.println("添加成功");
            model.addAttribute("upid",upid);
            return "redirect:/log/toUpLog_children";
        }else {
            System.out.println("添加失败");

        }
        return "";
    }

    @RequestMapping("/getPageNumber")
    @ResponseBody
    public String getPageNumber(Integer onePageNumber,HttpServletResponse response,HttpServletRequest request) throws JsonProcessingException {
        String user = CookieUtils.getCookie(request, "user");
        String scode = CookieUtils.getCookie(request, "scode");
        Boolean hasRoot = Root.isHasRoot(upService, user, scode);
        int colNumber=0;
        if (hasRoot) {
            Up up = upService.queryByUserName(user);
            colNumber = logService.getOneUpTablePageNumber(up.getUp_id());
        }


        Integer hasPageNumber=colNumber/onePageNumber;
        if((colNumber%onePageNumber)!=0){
            hasPageNumber=Integer.parseInt((hasPageNumber+1)+"");
        }
        HashMap<String,Integer> hashMap = new HashMap();
        hashMap.put("pageNumber",hasPageNumber);
        ObjectMapper om = new ObjectMapper();

        String json = om.writeValueAsString(hashMap);
        System.out.println("后端返回总页数="+hasPageNumber);
        return json;

    }
    @RequestMapping("/myPageing")
    @ResponseBody
    public String myPageing(Integer nextPage,Integer pageNumber,HttpServletRequest request) throws JsonProcessingException {
        System.out.println("初始化后端...");
        System.out.println(nextPage+";"+pageNumber);

        String user = CookieUtils.getCookie(request, "user");
        String scode = CookieUtils.getCookie(request, "scode");
        Boolean hasRoot = Root.isHasRoot(upService, user, scode);

        if (hasRoot){
            Up up = upService.queryByUserName(user);
            Integer upid = up.getUp_id();
            System.out.println("初始化分页数据="+upid+";"+nextPage+";"+pageNumber);
            List<Log> logs = logService.queryByUpidLimit(upid, (nextPage-1)*pageNumber , pageNumber);
            //去除文字样式
            for (Log md:logs){
                md.setLog_content(ShowChineseUtil.getShowCharacter(md.getLog_content(),25,"..."));
            }
            ObjectMapper om = new ObjectMapper();
            String json = om.writeValueAsString(logs);
            return json;

        }else {
            System.out.println("分页程序没有权限");
            return "{}";
        }


    }
    @RequestMapping("getMinDateNumber")
    @ResponseBody
    public String getMinDateNumber() throws JsonProcessingException {

        int minDatePageNumber = logService.getMinDatePageNumber();
        HashMap<String,Integer> numberData=new HashMap<>();
        numberData.put("minDateNumber",minDatePageNumber);
        ObjectMapper om = new ObjectMapper();
        String json = om.writeValueAsString(numberData);
        return json;

    }
    //获取最新数据
    @RequestMapping("/MinDateLog")
    @ResponseBody
    public String MinDateLog(Integer thisPage,Integer onePageNumber) throws JsonProcessingException {
        List<MinDateLog> logs = logService.queryByMinDate((thisPage-1)*onePageNumber, onePageNumber);
        //去除文字样式
        for (MinDateLog md:logs){
            md.setLog_content(ShowChineseUtil.getShowCharacter(md.getLog_content(),45,"..."));

        }
        System.out.println((thisPage-1)*onePageNumber+";"+onePageNumber);
        ObjectMapper om = new ObjectMapper();
        String json = om.writeValueAsString(logs);
        return json;
    }
    @RequestMapping("getUpTopNumberFirst")
    @ResponseBody
    public String getUpTopNumberFirst(Integer upTopNumberFirstNumber) throws JsonProcessingException {
        List<MinDateLog> minDateLogs = logService.queryByUpTop(upTopNumberFirstNumber);

        ObjectMapper objectMapper = new ObjectMapper();
        String json = objectMapper.writeValueAsString(minDateLogs);
        return json;
    }
    @RequestMapping("/getUpLog")
    @ResponseBody
    public String getUpLog(Integer upid) throws JsonProcessingException {

        List<Log> upLogs = logService.queryByUpId(upid);
        //去除文字样式
        for (Log md:upLogs){
            md.setLog_content(ShowChineseUtil.getShowCharacter(md.getLog_content(),100,"..."));
        }
        ObjectMapper objectMapper = new ObjectMapper();
        String json = objectMapper.writeValueAsString(upLogs);
        return json;
    }
    @RequestMapping("/getLogLikeData")
    @ResponseBody
    public String getLogLikeData(String likeValue,Integer requestPageNumber,Integer numberToPage) throws JsonProcessingException {
        System.out.println("后端接收到了前端的搜索内容="+likeValue);
        List<Log> logs = logService.queryByLike(likeValue.trim(),(requestPageNumber-1)*numberToPage,numberToPage);
        System.out.println(logs.toString());
        //去除文字样式
        for (Log md:logs){
            md.setLog_content(ShowChineseUtil.getShowCharacter(md.getLog_content(),40,"..."));
        }
        System.out.println(logs);

        ObjectMapper objectMapper = new ObjectMapper();
        String json = objectMapper.writeValueAsString(logs);
        return json;

    }
    @RequestMapping("/getLikeNumber")
    @ResponseBody
    public String getLikeNumber(String likeValue) throws JsonProcessingException {
        System.out.println("进入了查询搜索条数的程序了..");
        int likeLogNumber = logService.getLikeLogNumber(likeValue);
        System.out.println(likeLogNumber);
        HashMap<String, Integer> map = new HashMap<>();
        map.put("likeNumber",likeLogNumber);
        ObjectMapper om = new ObjectMapper();
        String json = om.writeValueAsString(map);

        return json;
    }










}
