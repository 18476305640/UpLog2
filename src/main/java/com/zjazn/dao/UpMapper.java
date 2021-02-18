package com.zjazn.dao;

import com.zjazn.pojo.Up;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UpMapper {
    //注销一个博主
    int deleteUp(@Param("up_id") int up_id);
    //根据Id修改博主的个性信息
    int updateUpPById(Up up);
    //根据Id修饰博主的账号信息
    int updateUpUserPassword(@Param("up_id") Integer up_id,@Param("up_password") String up_password);
    //新增博主，注册
    int addUp(Up up);
    //根据id查询博主信息
    Up queryById(@Param("up_id") int up_id);
    //查询全部的博主信息
    List<Up> queryAll();
    //根据账号查询博主信息
    Up queryByUserName(@Param("up_name") String username);


}
