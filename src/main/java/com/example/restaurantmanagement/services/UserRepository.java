package com.example.restaurantmanagement.services;

import com.example.restaurantmanagement.entities.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public interface UserRepository {

    public boolean saveOrUpdateUser(User user, boolean firstSave);
    public boolean deleteUser(Long id);
    public User getUser(Long id);
    User authenticate(String username, String password);
    List<User> getAllUsers();
    String encryptionMd5(String passwordToHash);
}
