package com.example.restaurantmanagement.controllers;

import com.example.restaurantmanagement.services.RestaurantRepository;
import com.example.restaurantmanagement.services.RestaurantRepositoryImp;
import com.example.restaurantmanagement.services.UserRepository;
import com.example.restaurantmanagement.services.UserRepositoryImp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet(name = "MainServlet")
public class MainServlet extends HttpServlet {
       RestaurantRepository restaurantRepository;
       UserRepository userRepository;
        public void init() {
            restaurantRepository = new RestaurantRepositoryImp();
            userRepository = new UserRepositoryImp();
        }


        @Override
        protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            resp.setContentType("text/html");
            String Path = req.getServletPath();
            restaurantRepository.forIndex(req, resp);
            req.getRequestDispatcher("/index.jsp").forward(req, resp);
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
