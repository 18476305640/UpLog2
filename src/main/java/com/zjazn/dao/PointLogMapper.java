package com.zjazn.dao;

import com.zjazn.pojo.PointLog;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface PointLogMapper {
    int addPointLog(PointLog pointLog);
    int deletePointLog(@Param("up_id") Integer up_id,@Param("log_id") Integer log_id);
    int updatePointLog(PointLog pointLog);
    PointLog queryByUpLogId(@Param("up_id") Integer up_id,@Param("log_id") Integer log_id);
    List<PointLog> queryByUpId(@Param("up_id") Integer up_id);
    List<PointLog> queryByLogId(@Param("log_id") Integer log_id);


}
