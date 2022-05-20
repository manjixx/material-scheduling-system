package com.material.backend.controller;


import com.alibaba.fastjson.JSONObject;
import com.material.backend.dto.LoginResultDTO;
import com.material.backend.dto.UserLoginDTO;
import com.material.backend.mapper.UsersMapper;
import com.material.backend.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController
public class UserController {

    @Autowired
    UserService userService;

    @PostMapping("/login")
    public LoginResultDTO Login(@Validated @RequestBody UserLoginDTO userLoginDTO){
        LoginResultDTO loginResultDTO = new LoginResultDTO();
        loginResultDTO.setUser(userService.getUser(userLoginDTO.getUsername()));
        return LoginResultDTO.okOf();    // 返回成功状态码与信息

        return  null;
    }


}
