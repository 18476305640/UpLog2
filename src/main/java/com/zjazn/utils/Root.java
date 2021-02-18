package com.zjazn.utils;

import com.zjazn.pojo.Up;
import com.zjazn.service.UpService;

public class Root {
    public static Boolean isHasRoot(UpService upService, String username, String scode){
        Up up = upService.queryByUserName(username);
        if(scode.equals(MD5.encrypByMd5(up.getUp_password()))){
            return true;
        }
        return false;
    }
}
