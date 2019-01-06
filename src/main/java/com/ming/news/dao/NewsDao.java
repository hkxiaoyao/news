package com.ming.news.dao;

import com.ming.news.model.po.*;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author ming
 */
@Mapper
@Repository
public interface NewsDao {

    /**
     * 插入一条新闻
     *
     * @param news 新闻
     * @return int
     */
    int insert(@Param("news") News news);

    /**
     * 插入新闻与标签的关系
     *
     * @param newsId 新闻ID
     * @param tagIds 标签ID列表
     * @return int
     */
    int insertNewsTagRelation(@Param("newsId") int newsId, @Param("tagIds") List<Integer> tagIds);

    /**
     * 根据标签名称查找标签
     *
     * @param tagName 标签名称
     * @return 标签
     */
    Tag findByTagName(@Param("tagName") String tagName);

    /**
     * 插入标签
     *
     * @param tag 标签
     * @return int
     */
    int insertTag(@Param("tag") Tag tag);

    /**
     * 获取实时新闻
     *
     * @return 新闻列表
     */
    List<News> getRealtimeNews();

    /**
     * 获取某个分类的新闻
     *
     * @param categoryId 分类ID
     * @return 新闻列表
     */
    List<IndexNews> getIndexNews(@Param("categoryId") Integer categoryId);

    /**
     * 获取新闻的详细信息
     *
     * @param newsId 新闻ID
     * @return 新闻详情
     */
    NewsDetail getNewsDetail(@Param("newsId") Integer newsId);

    /**
     * 获取收藏的新闻
     *
     * @param userId 用户ID
     * @return 新闻列表
     */
    List<CollectionNews> getCollectionNews(@Param("userId") Integer userId);

    /**
     * 获取新闻的评论
     *
     * @param newsId 新闻ID
     * @return 评论列表
     */
    List<Comment> getComment(@Param("newsId") Integer newsId);

    /**
     * 获取新闻的标签
     *
     * @param newsId 新闻ID
     * @return 标签列表
     */
    List<Tag> getTags(@Param("newsId") Integer newsId);

    /**
     * 增加访问量
     *
     * @param newsId 新闻ID
     * @return int
     */
    int updatePv(@Param("newsId") Integer newsId);

    /**
     * 增加评论量
     *
     * @param newsId 新闻ID
     * @return int
     */
    int updateComment(@Param("newsId") Integer newsId);

    /**
     * 增加收藏量
     *
     * @param newsId 新闻ID
     * @return int
     */
    int updateCollection(@Param("newsId") Integer newsId);

    /**
     * 减少收藏量
     *
     * @param newsId 新闻ID
     * @return int
     */
    int decreaseCollection(@Param("newsId") Integer newsId);

    /**
     * 插入收藏关系
     *
     * @param userId 用户ID
     * @param newsId 新闻ID
     * @return int
     */
    int insertCollection(@Param("userId") Integer userId, @Param("newsId") Integer newsId);

    /**
     * 查找收藏关系
     *
     * @param userId 用户ID
     * @param newsId 新闻ID
     * @return int
     */
    int findCollection(@Param("userId") Integer userId, @Param("newsId") Integer newsId);

    /**
     * 删除收藏关系
     *
     * @param userId 用户ID
     * @param newsId 新闻ID
     * @return int
     */
    int deleteCollection(@Param("userId") Integer userId, @Param("newsId") Integer newsId);

    /**
     * 获取我的新闻
     *
     * @param userId 用户ID
     * @return 新闻列表
     */
    List<News> getMyNews(@Param("userId") Integer userId);

    /**
     * 删除新闻
     *
     * @param newsId 新闻ID
     */
    void deleteNews(@Param("newsId") Integer newsId);

    /**
     * 获取搜索的新闻
     *
     * @param param 搜索参数
     * @return 新闻列表
     */
    List<SearchNews> getSearchNews(@Param("param") String param);
}