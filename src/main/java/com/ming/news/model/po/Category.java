package com.ming.news.model.po;

import lombok.Data;

import java.io.Serializable;
import java.util.List;

/**
 * @author ming
 */
@Data
public class Category implements Serializable {

    private Integer categoryId;

    private String newsCategoryName;

    private List<News> newsList;
}