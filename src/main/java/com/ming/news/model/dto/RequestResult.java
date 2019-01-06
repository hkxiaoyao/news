package com.ming.news.model.dto;

import com.ming.news.enums.StatEnum;
import lombok.Data;

/**
 * Create by ming on 19-1-4 下午4:46
 *
 * @author ming
 * I'm the one to ignite the darkened skies.
 */
@Data
public class RequestResult<T> {

    /**
     * 状态码
     */
    private int state;

    /**
     * 状态信息
     */
    private String stateInfo;

    /**
     * 数据
     */
    private T data;

    public RequestResult(StatEnum statEnum, T data) {
        this.state = statEnum.getState();
        this.stateInfo = statEnum.getStateInfo();
        this.data = data;
    }

    public RequestResult(StatEnum statEnum) {
        this.state = statEnum.getState();
        this.stateInfo = statEnum.getStateInfo();
    }

    public RequestResult(int state, String stateInfo) {
        this.state = state;
        this.stateInfo = stateInfo;
    }

    public RequestResult(int state, String stateInfo, T data) {
        this.state = state;
        this.stateInfo = stateInfo;
        this.data = data;
    }
}