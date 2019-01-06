package com.ming.news.service;

import com.ming.news.model.dto.RequestResult;
import com.ming.news.model.po.Category;
import com.ming.news.model.po.Comment;
import com.ming.news.model.po.News;
import com.ming.news.model.po.User;

import java.util.List;

/**
 * Create by ming on 19-1-5 上午11:24
 *
 * @author ming
 * I'm the one to ignite the darkened skies.
 */
public interface NewsService {

    /**
     * 获取所有分类
     *
     * @return 分类列表
     */
    List<Category> getAllCategories();

    /**
     * 添加新闻
     *
     * @param news 新闻
     * @param tag  标签
     * @param user 用户
     * @return result
     */
    RequestResult addNews(News news, String tag, User user);

    /**
     * 获取实时新闻
     *
     * @return 新闻列表
     */
    RequestResult getRealTimeNews();

    /**
     * 获取特定分类新闻
     *
     * @param categoryId 类别ID
     * @return 新闻列表
     */
    RequestResult getIndexNews(Integer categoryId);

    /**
     * 获取新闻详情
     *
     * @param newsId 新闻ID
     * @return 新闻详情
     */
    RequestResult getNewsDetail(Integer newsId);

    /**
     * 添加评论
     *
     * @param comment 评论
     * @return result
     */
    RequestResult addComment(Comment comment);

    /**
     * 收藏新闻
     *
     * @param userId 用户ID
     * @param newsId 新闻ID
     * @return result
     */
    RequestResult collectNews(Integer userId, Integer newsId);

    /**
     * 获取收藏的新闻
     *
     * @param userId 用户ID
     * @return 新闻列表
     */
    RequestResult getCollectionNews(Integer userId);

    /**
     * 取消收藏
     *
     * @param userId 用户ID
     * @param newsId 新闻ID
     * @return result
     */
    RequestResult cancelCollection(Integer userId, Integer newsId);

    /**
     * 获取我的新闻
     *
     * @param userId 用户ID
     * @return 新闻列表
     */
    RequestResult getMyNews(Integer userId);

    /**
     * 删除新闻
     *
     * @param newsId 新闻ID
     * @return result
     */
    RequestResult deleteNews(Integer newsId);

    /**
     * 获取搜索的新闻
     *
     * @param param 参数
     * @return 新闻列表
     */
    RequestResult getSearchNews(String param);
}
