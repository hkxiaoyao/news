package com.ming.news.dao;

import com.ming.news.model.po.Category;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Create by ming on 19-1-5 上午11:25
 *
 * @author ming
 * I'm the one to ignite the darkened skies.
 */
@Mapper
@Repository
public interface CategoryDao {

    /**
     * 查找所有的新闻分类
     *
     * @return 分类列表
     */
    List<Category> selectAll();
}
