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
//        urlPatterns1.add("/*");
        mapConfig.put(ROLE_ADMIN, urlPatterns1);

        // Config ROLE_OWNER
        List<String> urlPatterns2 = new ArrayList<String>();
        urlPatterns2.add("/owner");
        mapConfig.put(ROLE_OWNER, urlPatterns2);

        // Config ROLE_CLIENT
        List<String> urlPatterns3 = new ArrayList<String>();
        urlPatterns3.add("/client");
        mapConfig.put(ROLE_CLIENT, urlPatterns3);
    }

    public static Set<String> getAllAppRoles() {
        return mapConfig.keySet();
    }

    public static List<String> getUrlPatternsForRole(String role) {
        return mapConfig.get(role);
    }

}
