package com.ming.news.dao;

import com.ming.news.model.po.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * Create by ming on 19-1-4 下午8:23
 *
 * @author ming
 * I'm the one to ignite the darkened skies.
 */
@Mapper
@Repository
public interface UserDao {

    /**
     * 根据账号密码查找用户
     *
     * @param username 账号
     * @param password 密码
     * @return User
     */
    User findUserByUsernameAndPassWord(@Param("username") String username, @Param("password") String password);

    /**
     * 添加用户
     *
     * @param user 用户
     * @return int
     */
    int addUser(@Param("user") User user);

    /**
     * 根据username查找
     *
     * @param username username
     * @return user
     */
    User findUserByUsername(@Param("username") String username);

    /**
     * 获取作者信息
     *
     * @param authorId 作者ID
     * @return 作者信息
     */
    User getAuthorInfo(@Param("authorId") Integer authorId);

    /**
     * 获取订阅列表
     *
     * @param userId 用户ID
     * @return 订阅列表
     */
    List<User> getSubscription(@Param("userId") Integer userId);

    /**
     * 订阅作者
     *
     * @param map 作者ID和用户ID
     */
    void subscribeAuthor(Map<String, Object> map);

    /**
     * 取消订阅作者
     *
     * @param userId   用户ID
     * @param authorId 作者ID
     * @return int
     */
    int cancelSubscribeAuthor(@Param("userId") Integer userId, @Param("authorId") Integer authorId);

    /**
     * 更新头像
     *
     * @param imagePath 头像路径
     * @param userId    用户ID
     * @return int
     */
    int updateImage(@Param("imagePath") String imagePath, @Param("userId") Integer userId);

    /**
     * 更新简介
     *
     * @param content 简介内容
     * @param userId  用户ID
     */
    void updateIntroduction(@Param("content") String content, @Param("userId") Integer userId);
}
