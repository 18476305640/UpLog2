package com.zjazn.service;

import com.zjazn.dao.ReportMapper;
import com.zjazn.pojo.Report;

import java.util.List;

public class ReportServiceImpl implements ReportService{

    private ReportMapper reportMapper;

    public void setReportMapper(ReportMapper reportMapper) {
        this.reportMapper = reportMapper;
    }

    @Override
    public int deleteReport(Integer report_id) {
        return reportMapper.deleteReport(report_id);
    }

    @Override
    public int updateReport(String report_start, Integer report_id) {
        return reportMapper.updateReport(report_start,report_id);
    }

    @Override
    public int insertReport(Report report) {
        return reportMapper.insertReport(report);
    }

    @Override
    public List<Report> queryAll() {
        return reportMapper.queryAll();
    }

    @Override
    public Report queryByReportId(Integer report_id) {
        return reportMapper.queryByReportId(report_id);
    }

    @Override
    public List<Report> queryByLargeNumber(Integer number) {
        return reportMapper.queryByLargeNumber(number);
    }

    @Override
    public List<Report> queryByLogId(Integer logid) {
        return reportMapper.queryByLogId(logid);
    }

    @Override
    public int deleteByLogId(Integer logid) {
        return reportMapper.deleteByLogId(logid);
    }

}
