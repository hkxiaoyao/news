package com.ming.news.model.po;

import lombok.Data;

import java.util.Date;
import java.util.List;

/**
 * Create by ming on 19-1-5 下午6:48
 *
 * @author ming
 * I'm the one to ignite the darkened skies.
 */
@Data
public class NewsDetail {

    private Integer newsId;

    private String title;

    private String content;

    private Integer authorId;

    private String author;

    private Integer pv;

    private Integer commentNumber;

    private Date createTime;

    private String categoryName;

    private List<Tag> tags;

    private List<Comment> comments;
}
