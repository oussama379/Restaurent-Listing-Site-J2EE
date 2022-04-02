package com.example.restaurantmanagement.controllers;

import com.example.restaurantmanagement.entities.User;
import com.example.restaurantmanagement.services.userRepository;
import com.example.restaurantmanagement.services.userRepositoryImp;
import com.example.restaurantmanagement.utils.AppUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "LoginServlet", value = {"/login","/logout"})
public class LoginServlet extends HttpServlet {
    userRepositoryImp userRepository;

    public void init() {
        userRepository = new userRepositoryImp();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // IF /logout requested ELSE /login requested
        if (request.getServletPath().equalsIgnoreCase("/logout")){
            // Destroy the session
            request.getSession().invalidate();
            // Destroy the cookie
            AppUtils.removeCookie(response);

            // Redirect to Home Page.
            response.sendRedirect(request.getContextPath() + "/");
        }else{
            // IF Cookie exist or Session exist redirect to Home ELSE forward to login.jsp
            if (AppUtils.getCookie(request) != 0L || AppUtils.getLoginedUser(request.getSession()) != null)
                response.sendRedirect(request.getContextPath() + "/");
            else
                request.getRequestDispatcher("views/login.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String remember = request.getParameter("remember");
        User userAccount = null;

        // Authentication test
        if (userRepository.authenticate(email, password)){
             userAccount = userRepositoryImp.currentUser;
        }else{
            String errorMessage = "Invalid Email or Password";
            request.setAttribute("errorMessage", errorMessage);
            request.getRequestDispatcher("views/login.jsp").forward(request, response);
        }

        // Store logged user in Session
        AppUtils.storeLoginedUser(request.getSession(), userAccount);

        // Test Remember me option to store user id in Cookies
        if(remember != null)
            AppUtils.storeCookie(response, userAccount.getId());

        //
        int redirectId = -1;
        try {
            redirectId = Integer.parseInt(request.getParameter("redirectId"));
        } catch (Exception e) {
        }
        String requestUri = AppUtils.getRedirectAfterLoginUrl(request.getSession(), redirectId);
        if (requestUri != null) {
            response.sendRedirect(requestUri);
        } else {
            // Par défaut, après l'achèvement de la connexion
            // redirigez à la page /userInfo
            response.sendRedirect(request.getContextPath()+ "/");
        }

    }

}

