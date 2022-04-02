package com.example.restaurantmanagement.services;

import com.example.restaurantmanagement.entities.User;

import java.util.List;

public interface userRepository {

    public boolean saveOrUpdateUser(User user);
    public boolean deleteUser(Long id);
    public User getUser(Long id);
    boolean authenticate(String username, String password);
    List<User> getAllUsers();
}
