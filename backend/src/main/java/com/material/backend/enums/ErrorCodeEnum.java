package com.material.backend.enums;

public enum ErrorCodeEnum {
    TNP1001001(400,"用户不存在"),
    TNP1001002(500,"用户密码错误"),
    TNP1001003(500,"用户已注销");

    private Integer code;
    private String message;

    ErrorCodeEnum(Integer code, String message) {
        this.code = code;
        this.message = message;
    }

    public String getMessage() {
        return message;
    }

    public Integer getCode() {
        return code;
    }
}
