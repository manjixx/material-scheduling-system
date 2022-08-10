package com.material.backend.interceptors;


import com.material.backend.dto.UserTokenDTO;
import com.material.backend.service.Impl.RedisServiceImpl;
import com.material.backend.utils.JWTUtil;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Component
public class AuthenticateInterceptor implements HandlerInterceptor {

    @Autowired
    private RedisServiceImpl redisService;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
                             Object handler) throws Exception {
        String requestURI = request.getRequestURI();
        System.out.println("preHandle拦截的请求路径是{}"+ requestURI);

        String authToken = request.getHeader("Authorization");
        if (authToken == null || authToken.equals("")) {
            return false;
        }
        System.out.println(authToken);
//        String token = authToken.substring("token".length() + 1).trim();
        UserTokenDTO userTokenDTO = JWTUtil.parseToken(authToken);
        //1.判断请求是否有效
        if (redisService.get(userTokenDTO.getId().toString()) == null
                || !redisService.get(userTokenDTO.getId().toString()).equals(authToken)) {
            return false;
        }

        //2.判断是否需要续期
        if (redisService.getExpireTime(userTokenDTO.getId().toString()) < 1 * 60 * 30) {
            redisService.set(userTokenDTO.getId().toString(), authToken);
//            log.error("update token info, id is:{}, user info is:{}", userTokenDTO.getId(), token);
        }
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        HandlerInterceptor.super.afterCompletion(request, response, handler, ex);
    }
}
