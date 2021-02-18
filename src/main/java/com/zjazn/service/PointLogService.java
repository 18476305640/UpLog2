package com.zjazn.service;

import com.zjazn.pojo.PointLog;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface PointLogService {
    int addPointLog(PointLog pointLog);
    int deletePointLog(Integer up_id, Integer log_id);
    int updatePointLog(PointLog pointLog);
    PointLog queryByUpLogId(Integer up_id, Integer log_id);
    List<PointLog> queryByUpId(Integer up_id);
    List<PointLog> queryByLogId( Integer log_id);
}
