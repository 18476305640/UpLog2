package com.zjazn.service;

import com.zjazn.data.MinDateLog;
import com.zjazn.pojo.Log;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface LogService {
    //增加一条记录
    int addLog(Log log);
    //删除一条记录
    int deleteLog( int log_id);
    //修改一条记录
    int updateLog(Log log);
    //读者点赞或踩
    int updateLogByTB(int log_id, int log_top, int log_bottom);

    //根据
    Log queryByLogId(int logId);
    //根据博主id查询博客
    List<Log> queryByUpId(int up_id);
    //获取总记录数
    int getTablePageNumber();
    //获取指定up的记录条数
    int getOneUpTablePageNumber(Integer upid);
    //分页
    List<Log> queryByUpidLimit(int up_id,int started,int length);
    //根据时间获取log,并进行简单分页操作
    List<MinDateLog> queryByMinDate(int started,int length);
    //为（根据时间获取log,并进行简单分页操作）获取总数
    int getMinDatePageNumber();
    //根据点赞数进行排序。获取前10名
    List<MinDateLog> queryByUpTop(int topNumber);
    //用于搜索功能的模糊查询
    List<Log> queryByLike(String likeValue,Integer startNumber,Integer numberToPage );
    //查询要搜索的内容结果条数
    int getLikeLogNumber(String likeValue);
    //更新log为指定状态
    int updateLogState(Integer logid,float state);



    //查询全部记录
    List<Log> queryAll(String likeValue ,Integer start,Integer pageLength);
    //获取需要指定状态的log
    List<Log> queryLogByState(float state,String likeValue ,Integer start,Integer pageLength);
    //获取指定状态log的条数
    int getTypeLogNumber(float state,String likeValue);
    //获取总log条数
    int getAllLogNumber(String likeValue);


}
