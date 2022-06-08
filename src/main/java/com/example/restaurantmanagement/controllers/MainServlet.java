package com.example.restaurantmanagement.controllers;

import com.example.restaurantmanagement.entities.Restaurant;
import com.example.restaurantmanagement.entities.User;
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
import java.util.ArrayList;
import java.util.List;


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
            dothis(req,resp);
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

        public void dothis(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            System.out.println(restaurantRepository.getAllRestaurants());
        List<Restaurant> topFive = restaurantRepository.topWhat(3, restaurantRepository.getAllRestaurants());
        req.setAttribute("topFive", topFive);
        System.out.println(restaurantRepository.getAllRestaurants());
        System.out.println(topFive);
        User user = null;
        List<Restaurant> bookmarks = null;
        User currentUser = (User) req.getSession().getAttribute("loginedUser");
        if (currentUser != null) {
            bookmarks = new ArrayList<>();
            user = currentUser;
            if (!user.getBookmarks().isEmpty()) {
                for (Restaurant r : user.getBookmarks())
                    bookmarks.add(r);
            } else {
                bookmarks = null;
                System.out.println("Empty");
            }
        }
        req.setAttribute("bookmarks", bookmarks);
    }


}
