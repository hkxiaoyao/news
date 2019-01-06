package com.ming.news.model.po;

import lombok.Data;

import java.util.Date;

/**
 * Create by ming on 19-1-5 下午5:28
 *
 * @author ming
 * I'm the one to ignite the darkened skies.
 */
@Data
public class IndexNews {

    private Integer newsId;

    private String title;

    private String summary;

    private String author;

    private Integer pv;

    private Integer commentNumber;

    private Date createTime;

    private Integer categoryId;
}
