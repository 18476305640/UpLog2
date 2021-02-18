package com.zjazn.service;

import com.zjazn.dao.LogMapper;
import com.zjazn.data.MinDateLog;
import com.zjazn.pojo.Log;

import java.util.List;

public class LogServiceImpl implements LogService{
    private LogMapper logMapper;

    public void setLogMapper(LogMapper logMapper) {
        this.logMapper = logMapper;
    }

    @Override
    public int addLog(Log log) {
        return logMapper.addLog(log);
    }

    @Override
    public int deleteLog(int log_id) {
        return logMapper.deleteLog(log_id);
    }

    @Override
    public int updateLog(Log log) {
        return logMapper.updateLog(log);
    }

    @Override
    public int updateLogByTB(int log_id, int log_top, int log_bottom) {
        return logMapper.updateLogByTB(log_id,log_top,log_bottom);
    }



    @Override
    public Log queryByLogId(int logId) {
        return logMapper.queryByLogId(logId);
    }

    @Override
    public List<Log> queryByUpId(int up_id) {
        return logMapper.queryByUpId(up_id);
    }

    @Override
    public int getTablePageNumber() {
        return logMapper.getTablePageNumber();
    }

    @Override
    public int getOneUpTablePageNumber(Integer upid) {
        return logMapper.getOneUpTablePageNumber(upid);
    }

    @Override
    public List<Log> queryByUpidLimit(int up_id, int started, int length) {
        return logMapper.queryByUpidLimit(up_id,started,length);
    }

    @Override
    public List<MinDateLog> queryByMinDate(int started, int length) {
        return logMapper.queryByMinDate(started,length);
    }

    @Override
    public int getMinDatePageNumber() {
        return logMapper.getMinDatePageNumber();
    }

    @Override
    public List<MinDateLog> queryByUpTop(int topNumber) {
        return logMapper.queryByUpTop(topNumber);
    }

    @Override
    public List<Log> queryByLike(String likeValue, Integer startNumber, Integer numberToPage) {
        return logMapper.queryByLike(likeValue,startNumber,numberToPage);
    }


    @Override
    public int getLikeLogNumber(String likeValue) {
        return logMapper.getLikeLogNumber(likeValue);
    }

    @Override
    public int updateLogState(Integer logid,float state){
        return logMapper.updateLogState(logid,state);
    }

    @Override
    public List<Log> queryAll(String likeValue, Integer start, Integer pageLength) {
        return logMapper.queryAll(likeValue,start,pageLength);
    }

    @Override
    public List<Log> queryLogByState(float state, String likeValue, Integer start, Integer pageLength) {
        return logMapper.queryLogByState(state,likeValue,start,pageLength);
    }

    @Override
    public int getTypeLogNumber(float state, String likeValue) {
        return logMapper.getTypeLogNumber(state,likeValue);
    }

    @Override
    public int getAllLogNumber(String likeValue) {
        return logMapper.getAllLogNumber(likeValue);
    }


}
