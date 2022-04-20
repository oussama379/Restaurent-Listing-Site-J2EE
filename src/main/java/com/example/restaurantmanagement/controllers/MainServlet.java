package com.example.restaurantmanagement.controllers;

import com.example.restaurantmanagement.services.userRepositoryImp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet(name = "MainServlet",urlPatterns = "*.admin")
public class MainServlet extends HttpServlet {
        userRepositoryImp userRepository;

        @Override
        protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
                resp.setContentType("text/html");
                String Path = req.getServletPath();
                if (Path.equalsIgnoreCase("/homeAdmin.admin")) {
                        req.getRequestDispatcher("views/homeAdmin.jsp").forward(req, resp);
                }
 


        }

        @Override
        protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
                super.doPost(req, resp);
        }

        @Override
        public void destroy() {
                super.destroy();
        }
}
