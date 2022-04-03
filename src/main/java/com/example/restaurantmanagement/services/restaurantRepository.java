package com.example.restaurantmanagement.services;

import com.example.restaurantmanagement.entities.Restaurant;

import java.util.List;

public interface restaurantRepository {

    boolean saveOrUpdateRestaurant(Restaurant restaurant);
    boolean deleteRestaurant(Long id);
    Restaurant getRestaurant(Long id);
    List<Restaurant> getAllRestaurants();
    List<String> getTypesOfCuisine();
}
