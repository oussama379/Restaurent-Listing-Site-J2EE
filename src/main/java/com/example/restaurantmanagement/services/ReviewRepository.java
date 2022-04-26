package com.example.restaurantmanagement.services;

import com.example.restaurantmanagement.entities.Review;

import java.util.List;

public interface ReviewRepository {
    boolean saveOrUpdateReview(Review review);
    List<Review> getRestaurantReviews(Long id_restaurant);

}
