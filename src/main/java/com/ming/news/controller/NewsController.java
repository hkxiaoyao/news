package com.ming.news.controller;

import com.ming.news.model.dto.RequestResult;
import com.ming.news.model.po.Category;
import com.ming.news.model.po.Comment;
import com.ming.news.model.po.News;
import com.ming.news.model.po.User;
import com.ming.news.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

/**
 * Create by ming on 19-1-5 上午11:22
 *
 * @author ming
 * I'm the one to ignite the darkened skies.
 */
@RequestMapping("news")
@RestController
@CrossOrigin
public class NewsController {

    private final NewsService newsService;

    @Autowired
    public NewsController(NewsService newsService) {
        this.newsService = newsService;
    }

    @GetMapping("getAllCategories")
    public List<Category> getAllCategories() {
        return newsService.getAllCategories();
    }

    @PostMapping("add")
    @SuppressWarnings("unchecked")
    public RequestResult addNews(@RequestBody Map<String, Object> map, HttpSession session) {
        User user = (User) session.getAttribute("user");
        Map<String, Object> newsMap = (Map<String, Object>) map.get("news");
        Map<String, Object> categoryMap = (Map<String, Object>) newsMap.get("category");
        Category category = new Category();
        category.setCategoryId((Integer) categoryMap.get("categoryId"));
        category.setNewsCategoryName(categoryMap.get("newsCategoryName").toString());
        News news = News
                .builder()
                .content(newsMap.get("content").toString())
                .category(category)
                .title(newsMap.get("title").toString())
                .summary(newsMap.get("summary").toString()).build();
        String tags = (String) map.get("tag");
        return newsService.addNews(news, tags, user);
    }


    @GetMapping("realtime")
    public RequestResult getRealTimeNews() {
        return newsService.getRealTimeNews();
    }

    @GetMapping("index/{categoryId}")
    public RequestResult getIndexNews(@PathVariable("categoryId") Integer categoryId) {
        return newsService.getIndexNews(categoryId);
    }

    @GetMapping("detail/{newsId}")
    public RequestResult getNewsDetail(@PathVariable("newsId") Integer newsId) {
        return newsService.getNewsDetail(newsId);
    }

    @PostMapping("addComment")
    public RequestResult addComment(HttpSession session, @RequestBody Comment comment) {
        User user = (User) session.getAttribute("user");
        comment.setUser(user);
        return newsService.addComment(comment);
    }

    @PostMapping("collect/{newsId}")
    public RequestResult collectNews(HttpSession session, @PathVariable("newsId") Integer newsId) {
        User user = (User) session.getAttribute("user");
        return newsService.collectNews(user.getUserId(), newsId);
    }

    @PostMapping("collection")
    public RequestResult getCollectionNews(HttpSession session) {
        User user = (User) session.getAttribute("user");
        return newsService.getCollectionNews(user.getUserId());
    }

    @PostMapping("cancelCollection/{newsId}")
    public RequestResult cancelCollection(HttpSession session, @PathVariable("newsId") Integer newsId) {
        User user = (User) session.getAttribute("user");
        return newsService.cancelCollection(user.getUserId(), newsId);
    }

    @PostMapping("me")
    public RequestResult getMyNews(HttpSession session) {
        User user = (User) session.getAttribute("user");
        return newsService.getMyNews(user.getUserId());
    }

    @PostMapping("del/{newsId}")
    public RequestResult deleteNews(@PathVariable("newsId") Integer newsId) {
        return newsService.deleteNews(newsId);
    }


    @GetMapping("search/{param}")
    public RequestResult searchNews(@PathVariable("param") String param) {
        return newsService.getSearchNews(param);
    }
}
