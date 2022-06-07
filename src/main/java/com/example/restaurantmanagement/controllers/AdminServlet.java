package com.example.restaurantmanagement.controllers;


import com.example.restaurantmanagement.entities.AddRequestStatus;
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
import java.util.List;
import java.util.stream.Collectors;


@WebServlet(name = "AdminServlet",urlPatterns = "*.admin")
public class AdminServlet extends HttpServlet {
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
        List<Restaurant> allRestaurants = restaurantRepository.getAllRestaurants();
        List<User> allUsers = userRepository.getAllUsers();

        long restaurantsCount, approvedRestaurantsCount, pendingRestaurantsCount, cancelledRestaurantsCount;
        restaurantsCount = approvedRestaurantsCount = pendingRestaurantsCount = cancelledRestaurantsCount = 0;

        if (allRestaurants != null){
            restaurantsCount = allRestaurants.size();
            approvedRestaurantsCount = allRestaurants.stream()
                    .filter(restaurant -> restaurant.getAddRequestStatus().equals(AddRequestStatus.APPROVED)).count();
            pendingRestaurantsCount = allRestaurants.stream()
                    .filter(restaurant -> restaurant.getAddRequestStatus().equals(AddRequestStatus.PENDING)).count();
            cancelledRestaurantsCount = allRestaurants.stream()
                    .filter(restaurant -> restaurant.getAddRequestStatus().equals(AddRequestStatus.CANCELLED)).count();
        }

        int usersCount = allUsers.size();

        req.setAttribute("restaurantsCount", restaurantsCount);
        req.setAttribute("approvedRestaurantsCount", approvedRestaurantsCount);
        req.setAttribute("pendingRestaurantsCount", pendingRestaurantsCount);
        req.setAttribute("cancelledRestaurantsCount", cancelledRestaurantsCount);
        req.setAttribute("usersCount", usersCount);

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
