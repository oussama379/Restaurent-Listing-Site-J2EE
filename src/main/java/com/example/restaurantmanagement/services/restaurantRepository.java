package com.example.restaurantmanagement.services;

import com.example.restaurantmanagement.entities.Restaurant;

import java.util.List;

public interface restaurantRepository {

    public boolean saveOrUpdateRestaurant(Restaurant restaurant);
    public boolean deleteRestaurant(Long id);
    public Restaurant getRestaurant(Long id);
    List<Restaurant> getAllRestaurants();
}
