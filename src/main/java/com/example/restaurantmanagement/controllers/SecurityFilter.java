package com.example.restaurantmanagement.controllers;

import com.example.restaurantmanagement.entities.User;
import com.example.restaurantmanagement.services.UserRepository;
import com.example.restaurantmanagement.services.UserRepositoryImp;
import com.example.restaurantmanagement.utils.AppUtils;
import com.example.restaurantmanagement.utils.SecurityUtils;

import javax.servlet.Filter;
import javax.servlet.annotation.WebFilter;
import java.io.IOException;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebFilter("/*")
public class SecurityFilter implements Filter {
    private static UserRepository userRepository;

    @Override
    public void init(FilterConfig fConfig) throws ServletException {
        userRepository = new UserRepositoryImp();
    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;

        String servletPath = request.getServletPath();
        Long userId = AppUtils.getCookie(request); // Get user id from Cookie
        User loginedUser = AppUtils.getLoginedUser(request.getSession()); // Get user from Sesion

        // IF Session doesn't exist and Cookie exist -> Create Session
        if (loginedUser == null && userId != 0L){
            loginedUser = userRepository.getUser(userId);
            AppUtils.storeLoginedUser(request.getSession(), loginedUser);
        }

        if (servletPath.equals("/login")) {
            // IF Cookie exist or Session exist redirect to Home ELSE forward to login.jsp
            if (loginedUser != null)
                response.sendRedirect(request.getContextPath() + "/");
            else
                chain.doFilter(request, response);

            return;
        }

        if (loginedUser != null) {
            // User Name
//            String userName = loginedUser.getUsername();

            // Des r??les (Role).
//            List<String> roles = loginedUser.getRoles();

            // Envelopper l'ancienne demande (request) par une nouvelle demande avec les informations userName et Roles.
//            wrapRequest = new UserRoleRequestWrapper(userName, roles, request);
            request.setAttribute("role", loginedUser.getRole());
        }

        // Les pages doivent ??tre connect??es.
        if (SecurityUtils.isSecurityPage(request)) {

            // Si l'utilisateur n'est pas connect??,
            // Redirect (redirigez) vers la page de connexion
            if (loginedUser == null) {

                String requestUri = request.getRequestURI();

                // Stockez la page en cours ?? rediriger apr??s l'ach??vement de la connexion.
                int redirectId = AppUtils.storeRedirectAfterLoginUrl(request.getSession(), requestUri);

                response.sendRedirect(request.getContextPath() + "/login?redirectId=" + redirectId);
                return;
            }

            // V??rifiez si l'utilisateur a un r??le valide?
            boolean hasPermission = SecurityUtils.hasPermission(request);
            if (!hasPermission) {

//                RequestDispatcher dispatcher //
//                        = request.getServletContext().getRequestDispatcher("/WEB-INF/views/accessDeniedView.jsp");
                response.sendError(HttpServletResponse.SC_FORBIDDEN);

//                dispatcher.forward(request, response);
                return;
            }
        }

        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
    }

}
