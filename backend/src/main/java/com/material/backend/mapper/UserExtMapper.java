package com.material.backend.mapper;

import com.material.backend.model.User;
import com.material.backend.model.UserExample;
import com.material.backend.model.UserKey;
import com.material.backend.model.UserWithBLOBs;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import java.util.List;

public interface UserExtMapper {
    User selectByUserName(String userName);
}