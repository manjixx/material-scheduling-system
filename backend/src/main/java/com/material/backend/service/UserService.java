package com.material.backend.service;

import com.material.backend.mapper.UserExtMapper;

import com.material.backend.model.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {
    @Autowired
    UserExtMapper userExtMapper;

    public User getByUsername(String userName) {
        User user = userExtMapper.selectByUserName(userName);
        return user;
    }

}
