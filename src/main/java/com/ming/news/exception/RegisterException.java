package com.ming.news.exception;

import com.ming.news.enums.StatEnum;

/**
 * Create by ming on 19-1-5 上午12:08
 *
 * @author ming
 * I'm the one to ignite the darkened skies.
 */
public class RegisterException extends AbstractNewsException {
    public RegisterException(StatEnum statEnum) {
        super(statEnum);
    }
}
