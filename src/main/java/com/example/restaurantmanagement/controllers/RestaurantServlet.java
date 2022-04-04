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
        }
        else if (Path.equalsIgnoreCase("/listRestaurants.phpp")) {
            List<String> typesCuisine = restaurantRepositoryImp.getTypesOfCuisine();
            req.setAttribute("typesCuisine", typesCuisine);

            int count = Math.toIntExact(restaurantRepositoryImp.countRestaurants());
            int nbPages ;
            if(count % restaurantRepositoryImp.pageSize != 0) nbPages = (int) count/restaurantRepositoryImp.pageSize + 1;
            else nbPages = (int) count/3;
            int currentPage = 1;

            if(req.getParameter("page") != null) {
                currentPage = Integer.parseInt(req.getParameter("page"));
            }
            List<Restaurant> restaurantsPage = restaurantRepositoryImp.getPage(currentPage);

            req.setAttribute("currentPage", currentPage);
            req.setAttribute("nbPages", nbPages);
            req.setAttribute("restaurantsPage", restaurantsPage);

            req.getRequestDispatcher("views/listRestaurants.jsp").forward(req, resp);
        }
        else if (Path.equalsIgnoreCase("/searchRestaurants.phpp")) {
            List<String> typesCuisine = restaurantRepositoryImp.getTypesOfCuisine();
            req.setAttribute("typesCuisine", typesCuisine);
            String name = req.getParameter("name");
            String location = req.getParameter("location");
            String cuisineType = req.getParameter("cuisineType");
            String rating = req.getParameter("rating");
/*            System.out.println(name);
            System.out.println(location);
            System.out.println(cuisineType);
            System.out.println(rating);*/
            System.out.println("----------------------");
            if(name.equals(""))
                name = null;
            else
                req.setAttribute("name", name);
            if(location.equals(""))
                location = null;
            else
                req.setAttribute("location", location);
            if(cuisineType.equals("All Categories"))
                cuisineType = null;
            else
                req.setAttribute("cuisineType", cuisineType);
            if(rating.equals("0"))
                rating = null;
            else
                req.setAttribute("rating", rating);
            System.out.println("----------------------");
   /*         System.out.println(name);
            System.out.println(location);
            System.out.println(cuisineType);
            System.out.println(rating);*/
            System.out.println("----------------------");
            int currentPage = 1;

            if(req.getParameter("page") != null) {
                currentPage = Integer.parseInt(req.getParameter("page"));
            }

            javafx.util.Pair<List<Restaurant>, Integer> P = restaurantRepositoryImp.getByMultipleCriteria(name, cuisineType, location, rating,
                    currentPage);
            req.setAttribute("search", true);

            int count = P.getValue();
            int nbPages ;
            if(count % restaurantRepositoryImp.pageSize != 0) nbPages = (int) count/restaurantRepositoryImp.pageSize + 1;
            else nbPages = (int) count/3;

            List<Restaurant> restaurantsPage = P.getKey();
            System.out.println(restaurantsPage.size());
            req.setAttribute("currentPage", currentPage);
            req.setAttribute("nbPages", nbPages);
            req.setAttribute("restaurantsPage", restaurantsPage);
            if(name == null) req.setAttribute("name", "");
            if(rating == null) req.setAttribute("rating", "0");
            if(location == null) req.setAttribute("location", "");
            if(cuisineType == null) req.setAttribute("cuisineType", "All Categories");
            req.getRequestDispatcher("views/listRestaurants.jsp").forward(req, resp);
        }
        //=========================================================================\\
            //=========================================================================\\
        else {
            req.getRequestDispatcher("404.jsp").forward(req, resp);
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }

}
