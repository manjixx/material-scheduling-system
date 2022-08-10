package com.material.backend.dto;

import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;


@Data
public class UserLoginDTO {
//    @NotBlank(message = "用户名不能为空")
    @Pattern(regexp = "/^[a-zA-Z0-9]{3,}$/",message = "用户名至少是3位")
    String userName;
//    @NotBlank(message = "用户密码不能为空")
    @Pattern(regexp = "/^[a-zA-Z0-9]{3,}$//",message = "用户密码至少是3位")
    String password;
//    @NotBlank(message = "用户名不能为空")
    @Pattern(regexp = "/^[a-zA-Z0-9]{4,}$/",message = "验证码至少是4位")
    String captcha;
}
