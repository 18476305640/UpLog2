package com.zjazn.dao;

import com.zjazn.data.MinDateLog;
import com.zjazn.pojo.Log;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface LogMapper {
    //增加一条记录
    int addLog(Log log);
    //删除一条记录
    int deleteLog(@Param("log_id") int log_id);
    //修改一条记录
    int updateLog(Log log);

    //读者点赞或踩
    int updateLogByTB(@Param("log_id") int log_id,@Param("log_top") int log_top,@Param("log_bottom") int log_bottom);

    //根据
    Log queryByLogId(@Param("log_id") int logId);
    //根据博主id查询博客
    List<Log> queryByUpId(@Param("up_id") int up_id);
    //获取总记录数
    int getTablePageNumber();
    //获取指定up的记录条数
    int getOneUpTablePageNumber(@Param("up_id") Integer upid);
    //分页
    List<Log> queryByUpidLimit(@Param("up_id") int up_id,@Param("started") int started,@Param("length") int length);
    //根据时间获取log,并进行简单分页操作
    List<MinDateLog> queryByMinDate(@Param("started") int started, @Param("length") int length);
    //为（根据时间获取log,并进行简单分页操作）获取总数
    int getMinDatePageNumber();
    //根据点赞数进行排序。获取前10名
    List<MinDateLog> queryByUpTop(@Param("topNumber") int topNumber);
    //查询要搜索的内容结果条数
    int getLikeLogNumber(@Param("likeValue") String likeValue);
    //用于搜索功能的模糊查询
    List<Log> queryByLike(@Param("likeValue") String likeValue,@Param("startNumber") Integer startNumber,@Param("numberToPage") Integer numberToPage );

    //更新log为指定状态
    int updateLogState(@Param("log_id") Integer logid,@Param("state") float state);

    //查询全部记录
    List<Log> queryAll(@Param("likeValue")String likeValue ,@Param("start") Integer start,@Param("pageLength") Integer pageLength);
    //获取需要指定状态的log
    List<Log> queryLogByState(@Param("state") float state,@Param("likeValue")String likeValue ,@Param("start") Integer start,@Param("pageLength") Integer pageLength);
    //获取指定状态log的条数
    int getTypeLogNumber(@Param("state") float state,@Param("likeValue")String likeValue);
    //获取总log条数
    int getAllLogNumber(@Param("likeValue")String likeValue);
}
