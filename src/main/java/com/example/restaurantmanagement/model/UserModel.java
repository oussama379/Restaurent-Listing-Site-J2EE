package com.example.restaurantmanagement.model;

import com.example.restaurantmanagement.entities.User;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.List;
@Data
@NoArgsConstructor @AllArgsConstructor
public class UserModel {
    private String keyWord;
    private List<User> users = new ArrayList<>();
}
