package com.zjazn.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Comment {
    private Integer comment_id;
    private Integer log_id;
    private Integer up_id;
    private String comment_content;
    private Date comment_date;

}
