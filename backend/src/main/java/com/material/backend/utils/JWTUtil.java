package com.material.backend.utils;


import com.alibaba.fastjson.JSON;
import com.auth0.jwt.JWT;
import com.auth0.jwt.JWTVerifier;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.interfaces.DecodedJWT;
import com.material.backend.dto.UserTokenDTO;
import com.material.backend.model.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * 基于jwt的token帮助类，用于token生成和验证
 * */

@Component
public class JWTUtil {
    private static final Logger logger = LoggerFactory.getLogger(JWTUtil.class);

    /**
     * token过期时间
     */
    private static final long EXPIRE_TIME = 1 * 24 * 60 * 60 * 1000L;

    /**
     * token秘钥
     */
    private static final String TOKEN_SECRET = "123456";

    /**
     * 生成token，自定义过期时间 毫秒
     * 生成的token中不带有过期时间，token的过期时间由redis进行管理
     * @param user
     * @return
     */

    public static String generateToken(User user) {
        try {
            // 私钥和加密算法
            Algorithm algorithm = Algorithm.HMAC256(TOKEN_SECRET);

            // 设置过期时间
            Date date = new Date(System.currentTimeMillis() + EXPIRE_TIME);
            // 设置头部信息
            Map<String, Object> header = new HashMap<>(2);
            header.put("Type", "JWT");
            header.put("alg", "HS256");

            return JWT.create()
                    .withHeader(header)
                    .withClaim("userName", user.getUsername())
                    .withClaim("userEmail", user.getEmail())
                    .withClaim("userPhone",user.getPhone())
                    .withExpiresAt(date)
                    .sign(algorithm);
        } catch (Exception e) {
            logger.error("generate token occur error, error is:{}", e);
            return null;
        }
    }


    /**
     * 检验token是否正确
     *
     * @param token
     * @return
     */
    public static UserTokenDTO parseToken(String token) {
        Algorithm algorithm = Algorithm.HMAC256(TOKEN_SECRET);
        JWTVerifier verifier = JWT.require(algorithm).build();
        DecodedJWT jwt = verifier.verify(token);
        String tokenInfo = jwt.getClaim("token").asString();
        return JSON.parseObject(tokenInfo, UserTokenDTO.class);
    }
}
