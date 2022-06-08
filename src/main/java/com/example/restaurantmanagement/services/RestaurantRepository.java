package com.example.restaurantmanagement.services;

import com.example.restaurantmanagement.entities.Restaurant;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public interface RestaurantRepository {
    static int pageSize = 2;
    boolean saveOrUpdateRestaurant(Restaurant restaurant);
    boolean deleteRestaurant(Long id);
    Restaurant getRestaurant(Long id);
    List<Restaurant> getAllRestaurants();
    List<String> getTypesOfCuisine();
    javafx.util.Pair<List<Restaurant>, Integer> getByMultipleCriteria(String name, String typeCuisine, String block, String rating, int pageNumber);
    Long countRestaurants();
    List<Restaurant> getPage(int pageNumber);
    List<Restaurant> getByName(String name);
    List<Restaurant> topWhat(int number, List<Restaurant> restaurants);
//    void forIndex(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException;


}
