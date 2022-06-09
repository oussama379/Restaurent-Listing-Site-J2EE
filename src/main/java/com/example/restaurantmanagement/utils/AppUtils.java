package com.example.restaurantmanagement.utils;

import com.example.restaurantmanagement.entities.User;

import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Collection;
import javax.servlet.ServletContext;
import javax.servlet.ServletRegistration;

public class AppUtils {
    private static int REDIRECT_ID = 0;
    public static String UPLOAD_DIRECTORY_RESTAURANT = "../../src/main/webapp/upload/restaurants";
    public static String UPLOAD_DIRECTORY_USER = "../../src/main/webapp/upload/users";

    private static final Map<Integer, String> id_uri_map = new HashMap<Integer, String>();
    private static final Map<String, Integer> uri_id_map = new HashMap<String, Integer>();

    /* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
    * Session & Cookie Functions
    * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

    /** Store user information in Session */
    public static void storeLoginedUser(HttpSession session, User loginedUser) {
        // Sur JSP il est possible d'accéder via ${loginedUser}
        session.setAttribute("loginedUser", loginedUser);
    }

    /** Obtain user information stored in Session */
    public static User getLoginedUser(HttpSession session) {
        return (User) session.getAttribute("loginedUser");
    }

    /** Store user id in Cookie */
    public static void storeCookie(HttpServletResponse response, Long id) {
        Cookie c = new Cookie("userid", id.toString());
        c.setMaxAge(24*60*60);
        response.addCookie(c);
    }

    /** Remove user id in Cookie */
    public static void removeCookie(HttpServletResponse response) {
        Cookie c = new Cookie("userid", "");
        c.setMaxAge(0);
        response.addCookie(c);
    }

    /** Get user id from Cookies */
    public static Long getCookie(HttpServletRequest request) {
        Cookie[] cookies = request.getCookies();

        if (cookies != null) {
            // if exist return id else return 0
            for (Cookie c : cookies) {
                if (c.getName().equals("userid"))
                    return Long.valueOf(c.getValue());
            }
        }

        return 0L;
    }

    /* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
     * URL Redirect Functions
     * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

    public static int storeRedirectAfterLoginUrl(HttpSession session, String requestUri) {
        System.out.println(">>>>>>>>>>>>>> storeRedirectAfterLoginUrl");
        Integer id = uri_id_map.get(requestUri);

        if (id == null) {
            id = REDIRECT_ID++;
            System.out.println(">>>>>>>>>>>>>> "+id);
            uri_id_map.put(requestUri, id);
            id_uri_map.put(id, requestUri);
            System.out.println(">>>>>>>>>>>>>>"+uri_id_map);
            System.out.println(">>>>>>>>>>>>>>"+id_uri_map);
            return id;
        }
        System.out.println(">>>>>>>>>>>>>>"+uri_id_map);
        System.out.println(">>>>>>>>>>>>>>"+id_uri_map);
        return id;
    }

    public static String getRedirectAfterLoginUrl(HttpSession session, int redirectId) {
        return id_uri_map.get(redirectId);
    }

    /* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
     * URL Pattern Functions
     * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

    private static boolean hasUrlPattern(ServletContext servletContext, String urlPattern) {
        Map<String, ? extends ServletRegistration> map = servletContext.getServletRegistrations();

        for (String servletName : map.keySet()) {
            ServletRegistration sr = map.get(servletName);

            Collection<String> mappings = sr.getMappings();
            if (mappings.contains(urlPattern)) {
                return true;
            }
        }
        return false;
    }

    // servletPath:
    // ==> /spath
    // ==> /spath/*
    // ==> *.ext
    // ==> /
    public static String getUrlPattern(HttpServletRequest request) {
        ServletContext servletContext = request.getServletContext();
        String servletPath = request.getServletPath();
        String pathInfo = request.getPathInfo();

        String urlPattern = null;
        if (pathInfo != null) {
            urlPattern = servletPath + "/*";
            return urlPattern;
        }
        urlPattern = servletPath;

//        boolean has = hasUrlPattern(servletContext, urlPattern);
//        if (has) {
//            return urlPattern;
//        }
//        int i = servletPath.lastIndexOf('.');
//        if (i != -1) {
//            String ext = servletPath.substring(i + 1);
//            urlPattern = "*." + ext;
//            has = hasUrlPattern(servletContext, urlPattern);
//
//            if (has) {
//                return urlPattern;
//            }
//        }
        return urlPattern;
    }
}
