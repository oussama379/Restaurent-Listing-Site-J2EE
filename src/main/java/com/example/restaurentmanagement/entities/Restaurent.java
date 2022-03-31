package com.example.restaurentmanagement.entities;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import javax.persistence.*;
import java.time.LocalTime;
import java.util.Set;

@Entity
@Data
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class Restaurent {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String name;
    private Long popularity;
    private String averageCost;
    private String typeCuisine;
    private String tags ="[]";
    private String locationLink;
    private String menuImages = "[]";
    private String images = "[]";
    private LocalTime openingTime;
    private LocalTime closingTime;
    private AddRequestStatus addRequestStatus;

    @OneToMany(mappedBy = "restaurent")
    private Set<Review> reviews;

    @ManyToOne(fetch = FetchType.EAGER)
    private User ownerUser;


    public Restaurent(String name, Long popularity, String averageCost, String typeCuisine, String tags,
                      String locationLink, String menuImages, String images, LocalTime openingTime,
                      LocalTime closingTime, AddRequestStatus addRequestStatus) {
        this.name = name;
        this.popularity = popularity;
        this.averageCost = averageCost;
        this.typeCuisine = typeCuisine;
        this.tags = tags;
        this.locationLink = locationLink;
        this.menuImages = menuImages;
        this.images = images;
        this.openingTime = openingTime;
        this.closingTime = closingTime;
        this.addRequestStatus = addRequestStatus;
    }
}
