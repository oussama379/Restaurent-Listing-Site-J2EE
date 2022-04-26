package com.example.restaurantmanagement.services;

import com.example.restaurantmanagement.config.HibernateUtil;
import com.example.restaurantmanagement.entities.Restaurant;
import com.example.restaurantmanagement.entities.Review;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;

import java.util.List;

public class reviewRepositoryImp {

    public reviewRepositoryImp() {
    }



    public boolean saveOrUpdateReview(Review review) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try{
            session.saveOrUpdate(review);
            session.flush() ;
            tx.commit();
            return true;
        } catch (HibernateException e) {
            e.printStackTrace();
            tx.rollback();
        }finally {
            session.close();
        }
        return false;
    }
    public List<Review> getRestaurantReviews(Long id_restaurant) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Criteria criteria = session.createCriteria(Review.class);
        restaurantRepositoryImp restaurantRepositoryImp = new restaurantRepositoryImp();
        Restaurant restaurant = restaurantRepositoryImp.getRestaurant(id_restaurant);
        if (restaurant != null) {
            criteria.add(Restrictions.eq("restaurant", restaurant));
        }
        List<Review> reviews = criteria.list();
        return reviews;
    }
}
