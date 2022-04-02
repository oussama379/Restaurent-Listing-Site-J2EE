package com.example.restaurantmanagement.entities;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import javax.persistence.*;
import java.util.Set;

@Entity
@Data @ToString @NoArgsConstructor @AllArgsConstructor
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String firstname;
    private String lastname;
    private String username;
    private String email;
    private String password;
    private String role;
    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(name = "bookMarks", joinColumns = @JoinColumn(name = "user_id"),
            inverseJoinColumns = @JoinColumn(name = "restaurant_id"))
    private Set<Restaurant> bookmarks;

    @OneToMany(mappedBy = "user", fetch = FetchType.EAGER)
    private Set<Review> reviews;

    @OneToMany(mappedBy = "ownerUser", fetch = FetchType.EAGER)
    private Set<Restaurant> restaurants;




}
