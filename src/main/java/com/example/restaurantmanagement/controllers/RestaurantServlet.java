package com.example.restaurantmanagement.controllers;

import com.example.restaurantmanagement.entities.Restaurant;
import com.example.restaurantmanagement.entities.User;
import com.example.restaurantmanagement.model.UserModel;
import com.example.restaurantmanagement.services.userRepositoryImp;
import com.example.restaurantmanagement.services.restaurantRepositoryImp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name="RestaurantServlet", urlPatterns = "*.phpp")
public class RestaurantServlet extends HttpServlet {
    userRepositoryImp userRepositoryImp;
    restaurantRepositoryImp restaurantRepositoryImp;


    public void init() throws ServletException {
        userRepositoryImp = new userRepositoryImp();
        restaurantRepositoryImp = new restaurantRepositoryImp();
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        String Path = req.getServletPath();
        //=========================================================================\\
        if (Path.equalsIgnoreCase("/addRestaurant.phpp")) {
            //TODO Only Restaurant Owners
            UserModel model1 = new UserModel();
            model1.setKeyWord("users");
            List<User> users = userRepositoryImp.getAllUsers();
            model1.setUsers(users);
            req.setAttribute("modelUser", model1);
            req.getRequestDispatcher("views/addRestaurant.jsp").forward(req, resp);
        }//=========================================================================\\
        else if (Path.equalsIgnoreCase("/saveRestaurant.phpp")) {
            Restaurant restaurant = new Restaurant();
            restaurant.setName(req.getParameter("name"));
            restaurant.setAddress(req.getParameter("address"));
            restaurant.setAverageCost(Double.parseDouble(req.getParameter("averageCost")));
            restaurant.setEmail(req.getParameter("email"));
            restaurant.setGoogleMaps(req.getParameter("googleMaps"));
            restaurant.setOpeningTime(req.getParameter("openingTime"));
            restaurant.setClosingTime(req.getParameter("closingTime"));
            restaurant.setOpeningTimeWeekEnd(req.getParameter("openingTimeWeekEnd"));
            restaurant.setClosingTimeWeekEnd(req.getParameter("closingTimeWeekEnd"));
            restaurant.setFacebook(req.getParameter("facebook"));
            restaurant.setPhone(req.getParameter("phone"));
            restaurant.setInstagram(req.getParameter("instagram"));
            restaurant.setTypeCuisine(req.getParameter("typeCuisine"));
            // json
            restaurant.setTags(req.getParameter("tags"));
            restaurant.setOwnerUser(null);

            restaurantRepositoryImp.saveOrUpdateRestaurant(restaurant);
            req.getRequestDispatcher("views/addRestaurant.jsp").forward(req, resp);
            //=========================================================================\\
        }else {
            req.getRequestDispatcher("404.jsp").forward(req, resp);
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }

}
