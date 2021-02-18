package com.zjazn.utils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CookieUtils {
    public static void addCookie(HttpServletResponse response, String key, String value, Integer maxAge, String path){
        Cookie cookie = new Cookie(key, value);
        cookie.setMaxAge(maxAge);
        cookie.setPath(path);
        response.addCookie(cookie);
    }
    public static void addCookie(HttpServletResponse response, String key, String value, Integer maxAge){
        Cookie cookie = new Cookie(key, value);
        cookie.setMaxAge(maxAge);

        response.addCookie(cookie);
    }
    public static String getCookie(HttpServletRequest request, String key){
        Cookie[] cookies = request.getCookies();
        System.out.println(cookies);
        for (Cookie cookie:cookies){
            if(key.equals(cookie.getName())){
                return cookie.getValue();

            }
        }
        return null;



    }

}
