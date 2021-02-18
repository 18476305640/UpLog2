package com.zjazn.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PointLog {
    private Integer up_id;
    private Integer log_id;
    private Date point_date;
    private Integer point_type;
}
