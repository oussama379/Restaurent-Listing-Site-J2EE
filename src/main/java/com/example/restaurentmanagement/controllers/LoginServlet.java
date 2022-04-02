package com.example.restaurentmanagement.controllers;

import com.example.restaurentmanagement.entities.User;
import com.example.restaurentmanagement.services.userRepository;
import com.example.restaurentmanagement.services.userRepositoryImp;
import com.example.restaurentmanagement.utils.AppUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "LoginServlet", value = "/login")
public class LoginServlet extends HttpServlet {
    userRepositoryImp userRepository;

    public void init() {
        userRepository = new userRepositoryImp();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("views/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        User userAccount = null;

        if (userRepository.authenticate(email, password)){
             userAccount = userRepositoryImp.currentUser;
        }else{
            String errorMessage = "Invalid Email or Password";
            request.setAttribute("errorMessage", errorMessage);
            request.getRequestDispatcher("views/login.jsp").forward(request, response);
        }

        AppUtils.storeLoginedUser(request.getSession(), userAccount);

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
            response.sendRedirect(request.getContextPath());
        }

    }

}
