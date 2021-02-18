package com.zjazn.dao;

import com.zjazn.pojo.Report;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ReportMapper {
    //删除举报记录
    int deleteReport(@Param("report_id") Integer report_id);
    //更新举报记录
    int updateReport(@Param("report_start") String report_start,@Param("report_id") Integer report_id);

    //插入一条举报记录
    int insertReport(Report report);
    //查询举报记录
    List<Report> queryAll();
    //根据report查询
    Report queryByReportId(@Param("report_id") Integer report_id);
    //查询根据举报次数大于某个值的log
    List<Report> queryByLargeNumber(@Param("number") Integer number);
    //根据文章log查询举报记录
    List<Report> queryByLogId(@Param("logid") Integer logid);
    //根据logid删除举报记录
    int deleteByLogId(@Param("log_id") Integer logid);


}
