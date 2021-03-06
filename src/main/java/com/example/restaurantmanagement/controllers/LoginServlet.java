package com.example.restaurantmanagement.controllers;

import com.example.restaurantmanagement.entities.User;
import com.example.restaurantmanagement.services.UserRepository;
import com.example.restaurantmanagement.services.UserRepositoryImp;
import com.example.restaurantmanagement.utils.AppUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "LoginServlet", value = {"/login","/logout"})
public class LoginServlet extends HttpServlet {
    UserRepository userRepository;
    static int redirectId = -1;

    public void init() {
        userRepository = new UserRepositoryImp();
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
            try {
                redirectId = Integer.parseInt(request.getParameter("redirectId"));
            } catch (Exception e) {
            }
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
        User user = userRepository.authenticate(email, password);
        System.out.println("in login servlet " + user);
        if (user != null){
             userAccount = user;
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


        String requestUri = AppUtils.getRedirectAfterLoginUrl(request.getSession(), redirectId);
        if (requestUri != null) {
            redirectId = -1;
            response.sendRedirect(requestUri);
        } else {
            // Par d??faut, apr??s l'ach??vement de la connexion
            // redirigez ?? la page /userInfo
            response.sendRedirect(request.getContextPath()+ "/");
        }

    }

}

