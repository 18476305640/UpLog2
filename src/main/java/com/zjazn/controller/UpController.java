package com.zjazn.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.zjazn.pojo.Log;
import com.zjazn.pojo.Up;
import com.zjazn.service.LogService;
import com.zjazn.service.UpService;
import com.zjazn.utils.CookieUtils;
import com.zjazn.utils.MD5;
import com.zjazn.utils.Root;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/up")
public class UpController {
    @Autowired
    @Qualifier("UpServiceImpl")
    private UpService upService;
    @Autowired
    @Qualifier("LogServiceImpl")
    private LogService logService;

    @ResponseBody
    @RequestMapping("/cookieIsEqual")
    public String cookieIsEqual( String user, String scode, HttpServletResponse response) throws IOException {

        System.out.println("进入了");
        //账号+密码 加密后的字符
        Up up = upService.queryByUserName(user);
        String okScode = MD5.encrypByMd5(up.getUp_password());
        System.out.println(okScode);
        if (scode.equals(okScode)) {
            System.out.println("密码正确");

            Integer up_id = up.getUp_id();
            List<Log> logs = logService.queryByUpId(up_id);
            ObjectMapper om = new ObjectMapper();

            String json = om.writeValueAsString(logs);

            return json;

        }else{
            return "redirect:/login.jsp";
        }



    }
    //去登录页面
    @RequestMapping("/tologin")
    public String toLogin(){
        return "login";
    }
    //登录的处理
    @RequestMapping("/login")
    public String login(String user, String password, Model model,HttpServletResponse response){
        System.out.println(user+";"+password);
        Up up = upService.queryByUserName(user);

        System.out.println(up);
        Boolean isOk=false;
        String info="";
        if(up!=null){
            String pw = up.getUp_password();
            if(password.equals(pw)){
                if(up.getUp_power()<=-1){
                    isOk=false;
                    info="你的账号被冻结！";
                }else{
                    System.out.println("登录成功！");
                    isOk=true;

                }

            }else{
                isOk=false;
                info="请检查账号或密码是否正确！";

            }
        }else{
            isOk=false;
            info="请检查账号或密码是否正确！";

        }
        if(isOk){
            CookieUtils.addCookie(response,"user",up.getUp_name(),604800,"/");
            CookieUtils.addCookie(response,"scode",MD5.encrypByMd5(password),604800,"/");
            model.addAttribute("isLogin",true);
            return "redirect:/index.jsp";
        }else {
            model.addAttribute("err",info);
        }
        return "login";
    }
    //退出登录
    @ResponseBody
    @RequestMapping("/deleteCookie")
    public String deleteCookie(HttpServletResponse response){
        CookieUtils.addCookie(response,"user","",0,"/");
        CookieUtils.addCookie(response,"scode","",0,"/");
        return "{}";
    }
    //进入管理
    @RequestMapping("/toUpAdmin")
    public String toUpAdmin(){
        return "UpAdmin";
    }

    //通过认证进入管理
    @RequestMapping("/myAdmin")
    @ResponseBody
    public String myAdmin(String user, String scode) throws JsonProcessingException {
        Up up = upService.queryByUserName(user);
        if(scode.equals(MD5.encrypByMd5(up.getUp_password()))){
            up.setUp_password("");
            System.out.println("进入管理认证通过");
            ObjectMapper om = new ObjectMapper();
            String json = om.writeValueAsString(up);

            return json;

        }

        return null;
    }
    //去个人信息子页面
    @RequestMapping("/toUpInfo_children")
    public String toUpAdmin(String upid,Model model){
        model.addAttribute("upid",upid);
        return "upInfo_children";
    }
    //获取个人信息
    @RequestMapping("/getUpData")
    @ResponseBody
    public String myAdmin(String upid) throws JsonProcessingException {
        Up up = upService.queryById(Integer.valueOf(upid));
        ObjectMapper om = new ObjectMapper();

        String json = om.writeValueAsString(up);
        return json;
    }
    //去修改用户个性信息
    @RequestMapping("/toUpUpdatePdata")
    public String toUpUpdatePdata(String upid,Model model){
        model.addAttribute("upid",upid);
        Up up = upService.queryById(Integer.valueOf(upid));
        model.addAttribute("up",up);
        return "upUpdatePdata";
    }
    //修改用户个性信息程序
    @RequestMapping("/updateUpPdata")
    public String updateUpPdata(String upid, String pname, String ptext,MultipartFile up_headImg, Model model, HttpServletRequest request) throws IOException {
        String fileName=null;
        //图片大小小于20M
        if((! up_headImg.isEmpty()&& (up_headImg.getContentType().equalsIgnoreCase("image/jpeg")) &&(up_headImg.getSize()<20971520))){
            System.out.println("进入了获取图片的程序 ..");
            //文件保存的路径
            String path=request.getSession().getServletContext().getRealPath("/")+"img"+File.separator+"upHeadImg";
            String targetFileName=up_headImg.getOriginalFilename();
            int i = targetFileName.lastIndexOf(".");
            String suffix = targetFileName.substring(i,targetFileName.length());
            //生成文件名及原后缀名
            fileName = UUID.randomUUID().toString().replaceAll("-","").toUpperCase()+suffix;// 文件名:up_headImg.getOriginalFilename()，但我们不用，我们自己生成
            //检测有没有该文件夹，没有创建
            File file1 = new File(path);
            if(! file1.exists()){
                file1.mkdirs();
            }
            File filePath = new File(path, fileName);
            try {
                up_headImg.transferTo(filePath);
            } catch (IOException e) {
                e.printStackTrace();
            }

        }
        //基本信息的修改
        System.out.println("修改"+upid+";pname="+pname+";ptext="+ptext);
        String user = CookieUtils.getCookie(request, "user");
        String scode = CookieUtils.getCookie(request, "scode");
        Boolean hasRoot = Root.isHasRoot(upService, user, scode);
        if(hasRoot){
            Up up = new Up();
            up.setUp_id(Integer.valueOf(upid));
            up.setUp_pname(pname);
            up.setUp_ptext(ptext);
            if(fileName!=null){
                up.setUp_headImg("/img/upHeadImg/"+fileName);
            }
            int i = upService.updateUpPById(up);
            if(i>0){
                System.out.println("个性信息修改成功");
                return "forward:/up/toUpInfo_children";
            }
            System.out.println("认证成功，但修改失败");
            return "forward:/up/toUpUpdatePdata";

        }else{
            System.out.println("认证成功，认证失败");

            return "redirect:/up/tologin";

        }


    }
    @RequestMapping("/toLogon")
    public String toLogon(){
        return "logon";
    }
    @RequestMapping("/logon")
    public String login(String user, String password, String pname,String ptext,Model model,HttpServletResponse response) {
        System.out.println("进入了");
        Up testUp = upService.queryByUserName(user);
        String testPass=null;
        if (testUp!=null){
            testPass = testUp.getUp_password();
        }
        Up up=null;
        System.out.println("password="+testPass);
        if(testPass==null){
            up = new Up();
            up.setUp_name(user);
            up.setUp_password(password);
            up.setUp_pname(pname);
            up.setUp_ptext(ptext);
            up.setUp_cdate(new Date());
            up.setUp_power(0);
            int i = upService.addUp(up);
            if(i>0){
                return "login";
            }else{
                model.addAttribute("errorUpData",up);
                model.addAttribute("err","注册信息有误！");
                return "logon";
            }
        }else{
            model.addAttribute("errorUpData",up);
            model.addAttribute("err","已被注册！");
            return "logon";

        }
    }
    @RequestMapping("/toUpHome")
    public String toUpHome(Integer upid,Model model){
        System.out.println("获取到前端发过来的upid="+upid);
        Up up = upService.queryById(upid);
        model.addAttribute("upData",up);
        return "upHome";
    }

    @RequestMapping("/toMyAdmin")
    public String toMyAdmin(String upid,HttpServletResponse response,HttpServletRequest request){
        String user = CookieUtils.getCookie(request, "user");
        String scode = CookieUtils.getCookie(request, "scode");
        Boolean hasRoot = Root.isHasRoot(upService, user, scode);
        if(hasRoot){
            System.out.println("特权：密码认证成功~");
            Up up = upService.queryByUserName(user);
            if (up.getUp_power()>=100){
                //认证成功，可以进入特权模式
                System.out.println("普通管理员1~");
                if(up.getUp_power()<1000){
                    /*普通管理员*/
                    System.out.println("普通管理员2~");
                    return "webAdmin";
                }
                /*超级管理员*/
                return "webAdmin";
            }else{
                request.setAttribute("err","你登录的不是特权账号！");
                return "forward:/up/tologin";
            }
        }
        return "redirect:/up/tologin";

    }



}
