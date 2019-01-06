package com.ming.news.service.impl;

import com.ming.news.dao.CategoryDao;
import com.ming.news.dao.CommentDao;
import com.ming.news.dao.NewsDao;
import com.ming.news.enums.StatEnum;
import com.ming.news.model.dto.RequestResult;
import com.ming.news.model.po.*;
import com.ming.news.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Create by ming on 19-1-5 上午11:24
 *
 * @author ming
 * I'm the one to ignite the darkened skies.
 */
@Service
public class NewsServiceImpl implements NewsService {

    private final CategoryDao categoryDao;

    private final NewsDao newsDao;

    private final CommentDao commentDao;

    @Autowired
    public NewsServiceImpl(CategoryDao categoryDao, NewsDao newsDao, CommentDao commentDao) {
        this.categoryDao = categoryDao;
        this.newsDao = newsDao;
        this.commentDao = commentDao;
    }

    @Override
    public List<Category> getAllCategories() {
        return categoryDao.selectAll();
    }

    @Override
    public RequestResult addNews(News news, String tag, User user) {
        String[] tags = tag.split("#");
        List<Tag> tagList = new ArrayList<>();
        for (String string : tags) {
            Tag tag1 = new Tag();
            tag1.setTagName(string);
            Tag result = newsDao.findByTagName(tag1.getTagName());
            if (newsDao.findByTagName(tag1.getTagName()) != null) {
                tag1 = result;
            } else {
                newsDao.insertTag(tag1);
            }
            tagList.add(tag1);
        }
        System.out.println(tagList);

        news.setPv(0);
        news.setCreateTime(new Date());
        news.setUserId(user.getUserId());
        newsDao.insert(news);
        System.out.println(news);
        List<Integer> tagIds = new ArrayList<>();
        for (Tag tag1 : tagList) {
            tagIds.add(tag1.getTagId());
        }
        newsDao.insertNewsTagRelation(news.getNewsId(), tagIds);
        return new RequestResult(1, "发布成功");
    }

    @Override
    public RequestResult getRealTimeNews() {
        return new RequestResult<>(StatEnum.OK, newsDao.getRealtimeNews());
    }

    @Override
    public RequestResult getIndexNews(Integer categoryId) {
        return new RequestResult<>(StatEnum.OK, newsDao.getIndexNews(categoryId));
    }

    @Override
    public RequestResult getNewsDetail(Integer newsId) {
        NewsDetail newsDetail = newsDao.getNewsDetail(newsId);
        List<Comment> comments = newsDao.getComment(newsId);
        List<Tag> tags = newsDao.getTags(newsId);
        newsDao.updatePv(newsId);
        newsDetail.setComments(comments);
        newsDetail.setTags(tags);
        return new RequestResult<>(StatEnum.OK, newsDetail);
    }

    @Override
    public RequestResult addComment(Comment comment) {
        comment.setCreateTime(new Date());
        System.out.println(comment);
        commentDao.insert(comment);
        newsDao.updateComment(comment.getNewsId());
        List<Comment> comments = newsDao.getComment(comment.getNewsId());
        return new RequestResult<>(StatEnum.OK, comments);
    }

    @Override
    public RequestResult collectNews(Integer userId, Integer newsId) {
        if (newsDao.findCollection(userId, newsId) == 1) {
            return new RequestResult(0, "已经收藏过该文章");
        }
        newsDao.insertCollection(userId, newsId);
        newsDao.updateCollection(newsId);
        return new RequestResult(1, "收藏成功");
    }

    @Override
    public RequestResult getCollectionNews(Integer userId) {
        return new RequestResult<>(StatEnum.OK, newsDao.getCollectionNews(userId));
    }

    @Override
    public RequestResult cancelCollection(Integer userId, Integer newsId) {
        newsDao.deleteCollection(userId, newsId);
        newsDao.decreaseCollection(newsId);
        return new RequestResult(1, "取消成功");
    }

    @Override
    public RequestResult getMyNews(Integer userId) {
        List<News> newsList = newsDao.getMyNews(userId);
        return new RequestResult<>(StatEnum.OK, newsList);
    }

    @Override
    public RequestResult deleteNews(Integer newsId) {
        newsDao.deleteNews(newsId);
        return new RequestResult(1, "删除成功");
    }

    @Override
    public RequestResult getSearchNews(String param) {
        return new RequestResult<>(StatEnum.OK, newsDao.getSearchNews("%" + param + "%"));
    }
}
