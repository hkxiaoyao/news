package com.ming.news.model.po;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * @author ming
 */
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class News implements Serializable {

    private static final long serialVersionUID = 1L;

    private Integer newsId;

    private String title;

    private String summary;

    private Date createTime;

    private Integer userId;

    private Integer pv;

    private Integer collection;

    private Integer commentNumber;

    private String content;

    private List<Tag> tags;

    private List<Comment> comments;

    private List<User> collectedUsers;

    private Category category;

    public News(Integer newsId, String title) {
        this.newsId = newsId;
        this.title = title;
    }

    public News(Integer newsId, String title, String summary, Date createTime, Integer pv, Integer commentNumber) {
        this.newsId = newsId;
        this.title = title;
        this.summary = summary;
        this.createTime = createTime;
        this.pv = pv;
        this.commentNumber = commentNumber;
    }
}