package com.zjazn.service;

import com.zjazn.pojo.Report;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ReportService {
    //删除举报记录
    int deleteReport(Integer report_id);
    //更新举报记录
    int updateReport(String report_start,Integer report_id);

    //插入一条举报记录
    int insertReport(Report report);
    //查询举报记录
    List<Report> queryAll();
    //根据report查询
    Report queryByReportId(Integer report_id);
    //查询根据举报次数大于某个值的log
    List<Report> queryByLargeNumber(Integer number);
    //根据文章log查询举报记录
    List<Report> queryByLogId( Integer logid);
    //根据logid删除举报记录
    int deleteByLogId(Integer logid);
}
