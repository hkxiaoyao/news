package com.ming.news.model.po;

import lombok.Data;

import java.util.Date;

/**
 * Create by ming on 19-1-6 上午12:59
 *
 * @author ming
 * I'm the one to ignite the darkened skies.
 */
@Data
public class SearchNews {

    private Integer newsId;

    private String title;

    private Integer commentNumber;

    private Date createTime;
}
