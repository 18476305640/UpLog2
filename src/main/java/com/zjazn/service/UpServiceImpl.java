package com.zjazn.service;

import com.zjazn.dao.UpMapper;
import com.zjazn.pojo.Up;

import java.util.List;

public class UpServiceImpl implements UpService {
    private UpMapper upMapper;

    public void setUpMapper(UpMapper upMapper) {
        this.upMapper = upMapper;
    }

    @Override
    public int deleteUp(int up_id) {
        return upMapper.deleteUp(up_id);
    }

    @Override
    public int updateUpPById(Up up) {
        return upMapper.updateUpPById(up);
    }

    @Override
    public int updateUpUserPassword(Integer up_id, String up_password) {
        return upMapper.updateUpUserPassword(up_id,up_password);
    }

    @Override
    public int addUp(Up up) {
        return upMapper.addUp(up);
    }

    @Override
    public Up queryById(int up_id) {
        return upMapper.queryById(up_id);
    }

    @Override
    public List<Up> queryAll() {
        return upMapper.queryAll();
    }

    @Override
    public Up queryByUserName(String username) {
        return upMapper.queryByUserName(username);
    }
}
