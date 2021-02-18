package com.zjazn.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Up {
    private Integer up_id;
    private String up_pname;
    private String up_ptext;
    private String up_name;
    private String up_password;
    private Date up_cdate;
    private String up_headImg;
    private Integer up_power;
}
