package com.example.restaurentmanagement.utils;

import com.example.restaurentmanagement.entities.User;

import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
public class AppUtils {
    private static int REDIRECT_ID = 0;

    private static final Map<Integer, String> id_uri_map = new HashMap<Integer, String>();
    private static final Map<String, Integer> uri_id_map = new HashMap<String, Integer>();

    // Store user information in Session
    public static void storeLoginedUser(HttpSession session, User loginedUser) {
        // Sur JSP il est possible d'accéder via ${loginedUser}
        session.setAttribute("loginedUser", loginedUser);
    }

    // Obtain user information stored in Session
    public static User getLoginedUser(HttpSession session) {
        return (User) session.getAttribute("loginedUser");
    }

    // Store user id in Cookie
    public static void storeCookie(HttpServletResponse response, Long id) {
        Cookie c = new Cookie("userid", id.toString());
        c.setMaxAge(24*60*60);
        response.addCookie(c);
    }

    // Remove user id in Cookie
    public static void removeCookie(HttpServletResponse response) {
        Cookie c = new Cookie("userid", "");
        c.setMaxAge(0);
        response.addCookie(c);
    }

    // Get user id from Cookies
    public static Long getCookie(HttpServletRequest request) {
        Cookie[] cookies = request.getCookies();

        // if exist return id else return 0
        for (Cookie c : cookies) {
            if (c.getName().equals("userid"))
                return Long.valueOf(c.getValue());
        }
        return 0L;
    }

    public static int storeRedirectAfterLoginUrl(HttpSession session, String requestUri) {
        Integer id = uri_id_map.get(requestUri);

        if (id == null) {
            id = REDIRECT_ID++;

            uri_id_map.put(requestUri, id);
            id_uri_map.put(id, requestUri);
            return id;
        }

        return id;
    }

    public static String getRedirectAfterLoginUrl(HttpSession session, int redirectId) {
        String url = id_uri_map.get(redirectId);
        if (url != null) {
            return url;
        }
        return null;
    }

}
