package com.ming.news.model.po;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * @author ming
 */
@Data
public class User implements Serializable {

    private static final long serialVersionUID = 1L;
    private Integer userId;
    private String nickname;
    private String username;
    private String password;
    private String imagePath;
    private String briefIntroduction;
    private Short subscribeNumber;
    private Date createTime;

    private List<News> newsList;

    private List<News> collectionNews;

    private List<Comment> comments;

    private List<User> authors;
}