package com.ming.news.service;

import com.ming.news.model.dto.RequestResult;
import com.ming.news.model.po.User;

/**
 * Create by ming on 19-1-4 下午8:22
 *
 * @author ming
 * I'm the one to ignite the darkened skies.
 */
public interface UserService {

    /**
     * 查找用户
     *
     * @param username 用户名
     * @param password 密码
     * @return 用户
     */
    User findUser(String username, String password);

    /**
     * 注册
     *
     * @param user 用户
     * @return user
     */
    User register(User user);

    /**
     * 检查username
     *
     * @param username 登录名
     * @return bool
     */
    boolean checkUsername(String username);

    /**
     * 获取作者信息
     *
     * @param authorId 作者ID
     * @return 作者信息
     */
    RequestResult getAuthorInfo(Integer authorId);

    /**
     * 获取订阅信息
     *
     * @param userId 用户ID
     * @return 订阅信息
     */
    RequestResult getSubscription(Integer userId);

    /**
     * 订阅作者
     *
     * @param userId   用户ID
     * @param authorId 作者ID
     * @return result
     */
    RequestResult subscribe(Integer userId, Integer authorId);

    /**
     * 更新头像
     *
     * @param imagePath 头像路径
     * @param userId    用户ID
     * @return int
     */
    RequestResult updateImage(String imagePath, Integer userId);

    /**
     * 更新简介
     *
     * @param content 简介内容
     * @param userId  用户ID
     * @return int
     */
    RequestResult updateIntroduction(String content, Integer userId);

    /**
     * 取消订阅
     *
     * @param userId   用户ID
     * @param authorId 作者ID
     * @return result
     */
    RequestResult delSubscription(Integer userId, Integer authorId);
}
