package com.material.backend.controller;



import com.material.backend.dto.LoginResultDTO;
import com.material.backend.dto.UserLoginDTO;
import com.material.backend.dto.UserTokenDTO;
import com.material.backend.enums.ErrorCodeEnum;
import com.material.backend.exception.UserException;

import com.material.backend.model.User;
import com.material.backend.service.Impl.RedisServiceImpl;

import com.material.backend.service.UserService;
import com.material.backend.utils.JWTUtil;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;


import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;


@RestController
public class UserController {

    @Autowired
    UserService userService;

    @Autowired
    RedisServiceImpl redisService;

    @PostMapping("/login")
    public String Login(@Validated @RequestBody UserLoginDTO userLoginDTO) {

        // 1. 利用注解判断数据格式是否正确，在UserLoginDTO中实现
        // 2. 获取判断用户名密码是否正确
        User user = userService.getByUsername(userLoginDTO.getUserName());
        if (user == null) {
            throw new UserException(ErrorCodeEnum.TNP1001001);
        }
        if (!userLoginDTO.getPassword().equals(user.getPassword())) {
            throw new UserException(ErrorCodeEnum.TNP1001002);
        }
        if (!user.getUserState()) {
            throw new UserException(ErrorCodeEnum.TNP1001003);
        }

        //2.用户名密码正确生成token
        String token = JWTUtil.generateToken(user);

        //3.存入token至redis
        redisService.set(user.getId().toString(), token);
        return token;
    }
}
