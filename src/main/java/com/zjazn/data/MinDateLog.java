package com.zjazn.data;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MinDateLog {
    private Integer log_id;
    private Integer up_id;
    private String log_title;
    private String log_content;
    private Date log_date;
    private Integer log_top;
    private Integer log_bottom;
    private Date log_update_date;

    private String up_pname;
    private String up_ptext;
    private String up_name;
    private String up_password;
    private Date up_cdate;
    private String up_headImg;
    private Integer log_state;
}
