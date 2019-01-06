package com.ming.news.enums;

/**
 * @author ming
 */
public enum StatEnum {

    /**
     *
     */
    USERNAME_OR_PASSWORD_ERROR(0, "账号或者密码错误"),
    REGISTER_ERROR(0, "注册出错"),
    OK(1, "一切正常");

    private int state;
    private String stateInfo;

    StatEnum(int state, String stateInfo) {
        this.state = state;
        this.stateInfo = stateInfo;
    }

    public static StatEnum statOf(int index) {
        for (StatEnum state : values()) {
            if (state.getState() == index) {
                return state;
            }
        }
        return null;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public String getStateInfo() {
        return stateInfo;
    }

    public void setStateInfo(String stateInfo) {
        this.stateInfo = stateInfo;
    }
}
