package com.material.backend.dto;

//
import com.material.backend.model.User;

import lombok.Data;

@Data
public class LoginResultDTO {
    Integer status;
    Integer message;
    User user;
}
