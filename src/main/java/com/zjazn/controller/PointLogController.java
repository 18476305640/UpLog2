package com.zjazn.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.zjazn.pojo.Log;
import com.zjazn.pojo.PointLog;
import com.zjazn.service.LogService;
import com.zjazn.service.PointLogService;
import com.zjazn.service.UpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/pointLog")
public class PointLogController {
    @Autowired
    @Qualifier("UpServiceImpl")
    private UpService upService;
    @Autowired
    @Qualifier("LogServiceImpl")
    private LogService logService;
    @Autowired
    @Qualifier("PointLogServiceImpl")
    private PointLogService pointLogService;

    @RequestMapping("/updatePointLog")
    @ResponseBody
    //根据前端传过来的参数，进行查询后作相应的操作
    public String updatePointLog(Integer upid,Integer log_id,Integer type) throws JsonProcessingException {

        System.out.println("进入点赞处理程序了..."+upid+";"+log_id+";"+type);
        PointLog pointLog = pointLogService.queryByUpLogId(upid, log_id);
        System.out.println(1);
        Log log = logService.queryByLogId(log_id);
        System.out.println(2);

        if(log!=null){
            System.out.println("原log点赞数据=顶"+log.getLog_top()+";踩"+log.getLog_bottom());
            System.out.println(0011);

        }
        System.out.println(3);

        //用于修改或添加一条point记录

        PointLog newPointLog = new PointLog();
        newPointLog.setUp_id(upid);
        newPointLog.setLog_id(log_id);
        newPointLog.setPoint_date(new Date());
        Boolean isAddPoint=true;

        //用于返回给前端的信息
        Map<String, String> map = new HashMap<>();
        if(pointLog == null || pointLog.getPoint_type()==0){
            System.out.println("未作任何操作");
            if(pointLog == null ){
                //没有记录
                newPointLog.setPoint_type(type);

            }else{
                //有记录，但取消了操作
                newPointLog.setPoint_type(type);
            }
            //作实际log点赞或踩的修改
            if(type==-1){
                logService.updateLogByTB(log_id,((log.getLog_top()==null)?0:log.getLog_top()),((log.getLog_bottom()==null)?0:log.getLog_bottom())+1);
                map.put("showData","踩了一脚~");
            }else if (type==1){
                int i = logService.updateLogByTB(log_id, ((log.getLog_top()==null)?0:log.getLog_top()) + 1,((log.getLog_bottom()==null)?0:log.getLog_bottom()));
                map.put("showData","点赞了一波~");
            }

        }else{
            //可能是替换也可能是取消
            Integer oldtype = pointLog.getPoint_type();
            if(oldtype==type){
                //进行取消对应操作
                newPointLog.setPoint_type(0);
                if(type==-1){//取消踩
                    logService.updateLogByTB(log_id,log.getLog_top(),((log.getLog_bottom()==null)?0:log.getLog_bottom())-1);
                    map.put("showData","取消了踩~");
                }else if (type==1){//取消点赞
                    logService.updateLogByTB(log_id,((log.getLog_top()==null)?0:log.getLog_top())-1,log.getLog_bottom());
                    map.put("showData","取消了点赞~");
                }
            }else{
                //进行替换操作
                newPointLog.setPoint_type(type);
                if (type==1){
                    logService.updateLogByTB(log_id,((log.getLog_top()==null)?0:log.getLog_top())+1,((log.getLog_bottom()==null)?0:log.getLog_bottom())-1);
                    map.put("showData","替换成了赞~");
                }else if (type==-1){
                    logService.updateLogByTB(log_id,((log.getLog_top()==null)?0:log.getLog_top())-1,((log.getLog_bottom()==null)?0:log.getLog_bottom())+1);
                    map.put("showData","替换成了踩~");
                }
            }
        }
        System.out.println("即将进入判断！"+isAddPoint);

        if(pointLog==null){
            System.out.println(1);
            int i = pointLogService.addPointLog(newPointLog);
            if(i>0){
                System.out.println("成功添加记录");
            }else{
                System.out.println("无法添加记录");
            }

        }else{

            int i = pointLogService.updatePointLog(newPointLog);
            if(i>0){
                System.out.println("成功更新记录");
            }else{
                System.out.println("无法更新记录");
            }
        }
        Log logout = logService.queryByLogId(log_id);

        System.out.println("现log点赞数据=顶"+logout.getLog_top()+";踩"+logout.getLog_bottom());
        ObjectMapper om = new ObjectMapper();
        String json = om.writeValueAsString(map);

        return json;

    }

}
