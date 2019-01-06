package com.ming.news.model.po;

import lombok.Data;

import java.util.List;

/**
 * Create by ming on 19-1-5 上午10:37
 *
 * @author ming
 * I'm the one to ignite the darkened skies.
 */
@Data
public class Tag {
    private Integer tagId;

    private String tagName;

    private List<News> newsList;
}
