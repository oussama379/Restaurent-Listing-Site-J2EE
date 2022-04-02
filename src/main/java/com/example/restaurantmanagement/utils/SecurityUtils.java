package com.example.restaurantmanagement.utils;

import com.example.restaurantmanagement.config.SecurityConfig;

import java.util.List;
import java.util.Set;
import javax.servlet.http.HttpServletRequest;


public class SecurityUtils {
    // Vérifiez si cette 'request' est requise de se connecter ou non.
    public static boolean isSecurityPage(HttpServletRequest request) {
        String urlPattern = AppUtils.getUrlPattern(request);

        Set<String> roles = SecurityConfig.getAllAppRoles();

        for (String role : roles) {
            List<String> urlPatterns = SecurityConfig.getUrlPatternsForRole(role);
            if (urlPatterns != null && urlPatterns.contains(urlPattern)) {
                return true;
            }
        }
        return false;
    }

    // Vérifiez si cette 'request' dont le rôle est validé ou non?
    public static boolean hasPermission(HttpServletRequest request) {
        String urlPattern = AppUtils.getUrlPattern(request);

//        Set<String> allRoles = SecurityConfig.getAllAppRoles();

        String role = (String) request.getAttribute("role");

        if (role.equals("ADMIN")) return true;

        List<String> urlPatterns = SecurityConfig.getUrlPatternsForRole(role);
        if (urlPatterns != null && urlPatterns.contains(urlPattern)) {
            return true;
        }

        return false;
    }

}
