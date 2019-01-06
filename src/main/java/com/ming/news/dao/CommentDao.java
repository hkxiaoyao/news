package com.ming.news.dao;

import com.ming.news.model.po.Comment;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author ming
 */
@Mapper
@Repository
public interface CommentDao {

    /**
     * 插入一条评论
     *
     * @param comment 评论
     * @return int
     */
    int insert(@Param("comment") Comment comment);
}