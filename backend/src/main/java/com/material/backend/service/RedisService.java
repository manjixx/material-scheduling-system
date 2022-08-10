package com.material.backend.service;


public interface RedisService {

    /** 缓存的有效时长 **/
    long TIME_ONE_SECOND = 1; // 1秒
    long TIME_ONE_MINUTE = 60 * TIME_ONE_SECOND; // 1分
    long TIME_ONE_HOUR = 60 * TIME_ONE_MINUTE; // 1小时
    long TIME_ONE_DAY = 24 * TIME_ONE_HOUR; // 1天
    long TIME_ONE_MONTH = 30 * TIME_ONE_DAY; // 1个月


    void set(String key, String value);

    String get(String key);

    boolean delete(String key);

    Long getExpireTime(String key);
}