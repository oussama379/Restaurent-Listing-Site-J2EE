package com.example.restaurantmanagement.entities;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import javax.persistence.*;
import java.util.Set;

@Entity
@Data
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class Restaurant {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String name;
    private Long popularity;
    private double averageCost;
    private Long rating;
    private String typeCuisine;
    private String phone;
    private String webSite;
    private String email;
    private String facebook;
    private String instagram;
    private String tags ="[]";
    private String menuImages = "[]";
    private String images = "[]";
    private String openingTime;
    private String closingTime;
    private String openingTimeWeekEnd;
    private String closingTimeWeekEnd;
    private String address;
    private String googleMaps;
    private AddRequestStatus addRequestStatus;

    @OneToMany(mappedBy = "restaurant")
    private Set<Review> reviews;

    @ManyToOne(fetch = FetchType.EAGER)
    private User ownerUser;


}
