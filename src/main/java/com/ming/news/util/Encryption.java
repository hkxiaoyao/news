package com.ming.news.util;

import org.springframework.util.DigestUtils;

/**
 * @author ming
 */
public class Encryption {

    /**
     * md5盐值字符串
     */
    private static final String SLAT = "3116005120";

    public static String getMD5(String string) {
        String base = string + "/" + SLAT;
        return DigestUtils.md5DigestAsHex(base.getBytes());
    }
}
