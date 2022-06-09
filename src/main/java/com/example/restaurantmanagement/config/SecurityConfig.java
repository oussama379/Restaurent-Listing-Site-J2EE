package com.example.restaurantmanagement.config;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class SecurityConfig {
    public static final String ROLE_ADMIN  = "ADMIN";
    public static final String ROLE_OWNER  = "OWNER";
    public static final String ROLE_CLIENT = "CLIENT";

    // String: Role
    // List<String>: urlPatterns.
    private static final Map<String, List<String>> mapConfig = new HashMap<String, List<String>>();

    // Static Initialization Block
    static {
        init();
    }

    // TODO : Add paths to roles
    private static void init() {
        // Config ROLE_ADMIN
        List<String> urlPatterns1 = new ArrayList<String>();
        urlPatterns1.add("/homeAdmin.admin");
        urlPatterns1.add("/listUsers.php");
        urlPatterns1.add("/addUsers.php");
        urlPatterns1.add("/saveUser.php");
        urlPatterns1.add("/editUser.php");
        urlPatterns1.add("/deleteUser.php");
        urlPatterns1.add("/listRestaurantCrud.phpp");
        urlPatterns1.add("/addRestaurant.phpp");
        urlPatterns1.add("/editRestaurant.phpp");
        urlPatterns1.add("/deleteRestaurant.phpp");
        urlPatterns1.add("/saveRestaurant.phpp");
        urlPatterns1.add("/listRestReq.phpp");
        urlPatterns1.add("/approveRestaurant.phpp");
        urlPatterns1.add("/cancelRestaurant.phpp");
        mapConfig.put(ROLE_ADMIN, urlPatterns1);

        // Config ROLE_OWNER
        List<String> urlPatterns2 = new ArrayList<String>();
        urlPatterns2.add("/addRestaurant.phpp");
        urlPatterns2.add("/submitReview.phpp");
        urlPatterns2.add("/bookMarks.phpp");
        urlPatterns2.add("/listRestReq.phpp");
        mapConfig.put(ROLE_OWNER, urlPatterns2);

        // Config ROLE_CLIENT
        List<String> urlPatterns3 = new ArrayList<String>();
        urlPatterns3.add("/submitReview.phpp");
        urlPatterns3.add("/bookMarks.phpp");
        mapConfig.put(ROLE_CLIENT, urlPatterns3);
    }

    public static Set<String> getAllAppRoles() {
        return mapConfig.keySet();
    }

    public static List<String> getUrlPatternsForRole(String role) {
        return mapConfig.get(role);
    }

}
