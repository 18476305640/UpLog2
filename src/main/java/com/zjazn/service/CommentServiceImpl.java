package com.zjazn.service;

import com.zjazn.dao.CommentMapper;
import com.zjazn.data.CommentAndUp;
import com.zjazn.pojo.Comment;


import java.util.List;

public class CommentServiceImpl implements CommentService {
    private CommentMapper commentMapper;

    public void setComment(CommentMapper commentMapper) {
        this.commentMapper = commentMapper;
    }

    @Override
    public int addComment(Comment comment) {
        return commentMapper.addComment(comment);
    }

    @Override
    public int deleteComment(int comment_id) {
        return commentMapper.deleteComment(comment_id);
    }

    @Override
    public int updateComment(Comment comment) {
        return commentMapper.updateComment(comment);
    }

    @Override
    public List<CommentAndUp> queryByLogId(int logId) {
        return commentMapper.queryByLogId(logId);
    }
}
