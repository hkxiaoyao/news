package com.ming.news.service.impl;

import com.ming.news.dao.UserDao;
import com.ming.news.enums.StatEnum;
import com.ming.news.exception.RegisterException;
import com.ming.news.model.dto.RequestResult;
import com.ming.news.model.po.User;
import com.ming.news.service.UserService;
import com.ming.news.util.Encryption;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

/**
 * Create by ming on 19-1-4 下午8:23
 *
 * @author ming
 * I'm the one to ignite the darkened skies.
 */
@Service
public class UserServiceImpl implements UserService {

    private final UserDao userDao;

    @Autowired
    public UserServiceImpl(UserDao userDao) {
        this.userDao = userDao;
    }

    @Override
    public User findUser(String username, String password) {
        return userDao.findUserByUsernameAndPassWord(username, Encryption.getMD5(password));
    }

    @Override
    public User register(User user) {
        user.setPassword(Encryption.getMD5(user.getPassword()));
        user.setCreateTime(new Date());
        if (userDao.addUser(user) != 1) {
            throw new RegisterException(StatEnum.REGISTER_ERROR);
        }
        return user;
    }

    @Override
    public boolean checkUsername(String username) {
        return userDao.findUserByUsername(username) == null;
    }

    @Override
    public RequestResult getAuthorInfo(Integer authorId) {
        return new RequestResult<>(StatEnum.OK, userDao.getAuthorInfo(authorId));
    }

    @Override
    public RequestResult getSubscription(Integer userId) {
        return new RequestResult<>(StatEnum.OK, userDao.getSubscription(userId));
    }

    @Override
    public RequestResult subscribe(Integer userId, Integer authorId) {
        if (userId.equals(authorId)) {
            return new RequestResult(0, "不能订阅自己");
        } else if (userDao.findSubscription(userId, authorId) == 1) {
            return new RequestResult(0, "不能重复订阅");
        } else {
            userDao.subscribeAuthor(userId, authorId);
            userDao.increaseSubscribeNumber(authorId);
        }
        return new RequestResult(1, "订阅成功");
    }

    @Override
    public RequestResult updateImage(String imagePath, Integer userId) {
        userDao.updateImage(imagePath, userId);
        return new RequestResult(0, "修改成功");
    }

    @Override
    public RequestResult updateIntroduction(String content, Integer userId) {
        userDao.updateIntroduction(content, userId);
        return new RequestResult(0, "修改成功");
    }

    @Override
    public RequestResult delSubscription(Integer userId, Integer authorId) {
        userDao.cancelSubscribeAuthor(userId, authorId);
        userDao.decreaseSubscribeNumber(authorId);
        return new RequestResult<>(StatEnum.OK);
    }
}
