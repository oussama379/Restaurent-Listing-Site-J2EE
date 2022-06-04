package com.example.restaurantmanagement.controllers;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;



@WebServlet(name = "AdminServlet",urlPatterns = "*.admin")
public class AdminServlet extends HttpServlet {

    public void init() {

    }

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
