package com.example.restaurentmanagement.entities;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import javax.persistence.*;

@Entity
@Data
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class Review {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String reviewText;
    private double rating;
    @ManyToOne(fetch = FetchType.EAGER)
    private Restaurent restaurent;
    @ManyToOne(fetch = FetchType.EAGER)
    private User user;


    public Review(String reviewText) {
        this.reviewText = reviewText;
    }


}
