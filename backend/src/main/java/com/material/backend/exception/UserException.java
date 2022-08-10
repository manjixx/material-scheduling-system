package com.material.backend.exception;

import com.material.backend.enums.ErrorCodeEnum;

public class UserException extends RuntimeException {
    private Integer code;
    private String message;

    public UserException(ErrorCodeEnum errorCodeEnum) {
        this.message = errorCodeEnum.getMessage();
        this.code = errorCodeEnum.getCode();
    }
}
