package com.zjazn.dao;

import com.zjazn.data.CommentAndUp;
import com.zjazn.pojo.Comment;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CommentMapper {
    //增加一条记录
    int addComment(Comment comment);
    //删除一条记录
    int deleteComment(@Param("comment_id") int comment_id);
    //修改一条记录
    int updateComment(Comment comment);

    //查询指定Log的评论记录
    List<CommentAndUp> queryByLogId(@Param("log_id") int logId);


}
