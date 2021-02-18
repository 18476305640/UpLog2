package com.zjazn.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Report {
    private Integer log_id;
    private Integer report_upid;
    private String report_content;
    private Integer report_start;
    private Integer report_id;
    private Date report_date;

}
