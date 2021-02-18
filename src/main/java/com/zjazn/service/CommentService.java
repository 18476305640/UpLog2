package com.zjazn.service;

import com.zjazn.data.CommentAndUp;
import com.zjazn.pojo.Comment;

import java.util.List;

public interface CommentService {
    //增加一条记录
    int addComment(Comment comment);
    //删除一条记录
    int deleteComment(int comment_id);
    //修改一条记录
    int updateComment(Comment comment);

    //查询指定Log的评论记录
    List<CommentAndUp> queryByLogId(int logId);
}
