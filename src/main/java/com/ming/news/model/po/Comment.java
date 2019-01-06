package com.ming.news.model.po;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * @author ming
 */
@Data
public class Comment implements Serializable {

    private Integer commentId;
    private String content;
    private Date createTime;
    private User user;
    private Integer newsId;
}