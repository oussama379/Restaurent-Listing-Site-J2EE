package com.example.restaurantmanagement.entities;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import javax.persistence.*;
import java.util.Locale;
import java.util.Set;

@Entity
@NoArgsConstructor
@AllArgsConstructor
public class Restaurant {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String name;
    private String description;
    private double averageCost;
    private String payment; // Possible payment methods
    private Long rating;
    private String typeCuisine;
    private String phone;
    private String webSite;
    private String email;
    private String facebook;
    private String instagram;
    private String tags;
    private String menuImages;
    private String images;
    private String openingTime;
    private String closingTime;
    private String openingTimeWeekEnd;
    private String closingTimeWeekEnd;
    private String block; // Rabat Blocks : Agdal, Hay Riyad, ...
    private String address;
    private String googleMaps;
    private AddRequestStatus addRequestStatus;
    private int views = 0;

    @OneToMany(mappedBy = "restaurant", fetch = FetchType.EAGER)
    private Set<Review> reviews;

    @ManyToOne(fetch = FetchType.EAGER)
    private User ownerUser;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
    

    public double getAverageCost() {
        return averageCost;
    }

    public void setAverageCost(double averageCost) {
        this.averageCost = averageCost;
    }

    public String getPayment() {
        return payment;
    }

    public void setPayment(String payment) {
        this.payment = payment;
    }

    public Long getRating() {
        return rating;
    }

    public void setRating(Long rating) {
        this.rating = rating;
    }

    public String getTypeCuisine() {
        return typeCuisine;
    }

    public void setTypeCuisine(String typeCuisine) {
        this.typeCuisine = typeCuisine;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getWebSite() {
        return webSite;
    }

    public void setWebSite(String webSite) {
        this.webSite = webSite;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFacebook() {
        return facebook;
    }

    public void setFacebook(String facebook) {
        this.facebook = facebook;
    }

    public String getInstagram() {
        return instagram;
    }

    public void setInstagram(String instagram) {
        this.instagram = instagram;
    }

    public String getTags() {
        return tags;
    }

    public void setTags(String tags) {
        this.tags = tags;
    }

    public String getMenuImages() {
        return menuImages;
    }

    public void setMenuImages(String menuImages) {
        this.menuImages = menuImages;
    }

    public String getImages() {
        return images;
    }

    public void setImages(String images) {
        this.images = images;
    }

    public String getOpeningTime() {
        return openingTime;
    }

    public void setOpeningTime(String openingTime) {
        this.openingTime = openingTime;
    }

    public String getClosingTime() {
        return closingTime;
    }

    public void setClosingTime(String closingTime) {
        this.closingTime = closingTime;
    }

    public String getOpeningTimeWeekEnd() {
        return openingTimeWeekEnd;
    }

    public void setOpeningTimeWeekEnd(String openingTimeWeekEnd) {
        this.openingTimeWeekEnd = openingTimeWeekEnd;
    }

    public String getClosingTimeWeekEnd() {
        return closingTimeWeekEnd;
    }

    public void setClosingTimeWeekEnd(String closingTimeWeekEnd) {
        this.closingTimeWeekEnd = closingTimeWeekEnd;
    }

    public String getBlock() {
        return block;
    }

    public void setBlock(String block) {
        this.block = block;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getGoogleMaps() {
        return googleMaps;
    }

    public void setGoogleMaps(String googleMaps) {
        this.googleMaps = googleMaps;
    }

    public AddRequestStatus getAddRequestStatus() {
        return addRequestStatus;
    }

    public String getStatus() {
        return addRequestStatus.name().toLowerCase(Locale.ROOT);
    }

    public void setAddRequestStatus(AddRequestStatus addRequestStatus) {
        this.addRequestStatus = addRequestStatus;
    }

    public int getViews() {
        return views;
    }

    public void setViews(int views) {
        this.views = views;
    }

    public Set<Review> getReviews() {
        return reviews;
    }

    public void setReviews(Set<Review> reviews) {
        this.reviews = reviews;
    }

    public User getOwnerUser() {
        return ownerUser;
    }

    public void setOwnerUser(User ownerUser) {
        this.ownerUser = ownerUser;
    }

    @Override
    public String toString() {
        return "Restaurant{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", description='" + description + '\'' +
                ", averageCost=" + averageCost +
                ", payment='" + payment + '\'' +
                ", rating=" + rating +
                ", typeCuisine='" + typeCuisine + '\'' +
                ", phone='" + phone + '\'' +
                ", webSite='" + webSite + '\'' +
                ", email='" + email + '\'' +
                ", facebook='" + facebook + '\'' +
                ", instagram='" + instagram + '\'' +
                ", tags='" + tags + '\'' +
                ", menuImages='" + menuImages + '\'' +
                ", images='" + images + '\'' +
                ", openingTime='" + openingTime + '\'' +
                ", closingTime='" + closingTime + '\'' +
                ", openingTimeWeekEnd='" + openingTimeWeekEnd + '\'' +
                ", closingTimeWeekEnd='" + closingTimeWeekEnd + '\'' +
                ", block='" + block + '\'' +
                ", address='" + address + '\'' +
                ", googleMaps='" + googleMaps + '\'' +
                ", addRequestStatus=" + addRequestStatus +
                ", views=" + views +
                '}';
    }
}
