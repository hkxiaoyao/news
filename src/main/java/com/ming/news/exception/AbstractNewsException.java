package com.ming.news.exception;

import com.ming.news.enums.StatEnum;

/**
 * Create by ming on 19-1-4 下午4:48
 *
 * @author ming
 * I'm the one to ignite the darkened skies.
 */
public abstract class AbstractNewsException extends RuntimeException {
    private StatEnum statEnum;

    public AbstractNewsException(StatEnum statEnum) {
        super(statEnum.getStateInfo());
        this.statEnum = statEnum;
    }

    public StatEnum getStatEnum() {
        return statEnum;
    }
}
