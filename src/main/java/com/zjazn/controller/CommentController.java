package com.zjazn.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.zjazn.data.CommentAndUp;
import com.zjazn.pojo.Comment;
import com.zjazn.pojo.Up;
import com.zjazn.service.CommentService;
import com.zjazn.service.UpService;
import com.zjazn.utils.CookieUtils;
import com.zjazn.utils.Root;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping("/comment")
public class CommentController {
    @Autowired
    @Qualifier("CommentServiceImpl")
    private CommentService commentService;

    @Autowired
    @Qualifier("UpServiceImpl")
    private UpService upService;

    @RequestMapping("/queryByLogId")
    @ResponseBody
    public String queryByLogId(Integer commentLogId) throws JsonProcessingException {
        System.out.println(commentService);
        List<CommentAndUp> commentAndUps = commentService.queryByLogId(commentLogId);
        for (CommentAndUp commentAndUp:commentAndUps){
            commentAndUp.setUp_password("");
        }
        ObjectMapper om = new ObjectMapper();
        String json = om.writeValueAsString(commentAndUps);
        System.out.println("即将改送指定评论信息到前端...");
        System.out.println(commentAndUps);
        return json;
    }
    @RequestMapping("/addCommentByLog")
    @ResponseBody
    public String addCommentByLog(Integer commentLogId, String commentContent, HttpServletRequest request, HttpServletResponse response) throws JsonProcessingException {
        System.out.println("后端接收到了"+commentLogId+";"+commentContent);
        String user = CookieUtils.getCookie(request, "user");
        String scode = CookieUtils.getCookie(request, "scode");
        Boolean hasRoot = Root.isHasRoot(upService, user, scode);
        HashMap<String,Integer> dataMap = new HashMap<>();
        if(hasRoot){
            Up up = upService.queryByUserName(user);
            Integer up_id = up.getUp_id();
            System.out.println("正在准备添加");
            System.out.println(commentLogId+";"+up_id+"commentContent"+new Date());
            Comment comment = new Comment();
            comment.setLog_id(commentLogId);
            comment.setUp_id(up_id);
            comment.setComment_content(commentContent);
            comment.setComment_date(new Date());
            int i = commentService.addComment(comment);

            if(i>0){
                dataMap.put("commentIsAdd",1);
            }else{
                dataMap.put("commentIsAdd",-1);
            }

        }else{
            dataMap.put("commentIsAdd",-1);
        }
        ObjectMapper om = new ObjectMapper();
        String json = om.writeValueAsString(dataMap);
        return json;
    }


}
