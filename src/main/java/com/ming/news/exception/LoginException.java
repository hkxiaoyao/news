package com.ming.news.exception;

import com.ming.news.enums.StatEnum;

/**
 * Create by ming on 19-1-4 下午8:43
 *
 * @author ming
 * I'm the one to ignite the darkened skies.
 */
public class LoginException extends AbstractNewsException {
    public LoginException(StatEnum statEnum) {
        super(statEnum);
    }
}
