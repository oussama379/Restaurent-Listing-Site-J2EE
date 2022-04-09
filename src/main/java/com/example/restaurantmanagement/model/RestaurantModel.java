package com.example.restaurantmanagement.model;

import com.example.restaurantmanagement.entities.Restaurant;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class RestaurantModel {
    private String keyWord;
    private List<Restaurant> restaurants = new ArrayList<>();
}
