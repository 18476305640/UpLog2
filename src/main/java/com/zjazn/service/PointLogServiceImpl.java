package com.zjazn.service;

import com.zjazn.dao.PointLogMapper;
import com.zjazn.pojo.PointLog;

import java.util.List;

public class PointLogServiceImpl implements PointLogService {
    private PointLogMapper pointLogMapper;

    public void setPointLogMapper(PointLogMapper pointLogMapper) {
        this.pointLogMapper = pointLogMapper;
    }

    public PointLogServiceImpl(PointLogMapper pointLogMapper) {
        this.pointLogMapper = pointLogMapper;
    }

    @Override
    public int addPointLog(PointLog pointLog) {
        return pointLogMapper.addPointLog(pointLog);
    }

    @Override
    public int deletePointLog(Integer up_id, Integer log_id) {
        return pointLogMapper.deletePointLog(up_id,log_id);
    }

    @Override
    public int updatePointLog(PointLog pointLog) {
        return pointLogMapper.updatePointLog(pointLog);
    }

    @Override
    public PointLog queryByUpLogId(Integer up_id, Integer log_id) {
        return pointLogMapper.queryByUpLogId(up_id,log_id);
    }

    @Override
    public List<PointLog> queryByUpId(Integer up_id) {
        return pointLogMapper.queryByUpId(up_id);
    }

    @Override
    public List<PointLog> queryByLogId(Integer log_id) {
        return pointLogMapper.queryByLogId(log_id);
    }
}
