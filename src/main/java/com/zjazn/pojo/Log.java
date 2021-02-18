package com.zjazn.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Log {
    private Integer log_id;
    private Integer up_id;
    private String log_title;
    private String log_content;
    private Date log_date;
    private Integer log_top;
    private Integer log_bottom;
    private Date log_update_date;
    private float log_state;


}
