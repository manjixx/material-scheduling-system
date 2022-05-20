package com.material.backend.service;

import com.material.backend.mapper.UserMapper;
import com.material.backend.model.User;
import com.material.backend.model.UserExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {
    @Autowired
    UserMapper userMapper;

    public User getUser(String userName) {
        UserExample userExample = new UserExample();
        userExample.createCriteria().andUserEqualTo(userName);
        User user = userMapper.selectByExample(userExample);
        user= userMapper.select(userName);
    }
}
