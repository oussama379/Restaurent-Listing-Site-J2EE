package com.example.restaurantmanagement.services;

import com.example.restaurantmanagement.config.HibernateUtil;
import com.example.restaurantmanagement.entities.Restaurant;
import org.hibernate.*;

import javax.persistence.PersistenceException;
import java.util.List;

public class restaurantRepositoryImp implements restaurantRepository{

    public restaurantRepositoryImp() {
    }

    @Override
    public boolean saveOrUpdateRestaurant(Restaurant restaurant) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try{
            session.saveOrUpdate(restaurant);
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

    @Override
    public boolean deleteRestaurant(Long id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try{
            //TODO Handle Exception ???
            Restaurant restaurant = new Restaurant();
            restaurant.setId(id);
            session.delete(restaurant);
            session.flush() ;
            tx.commit();
            return true;
        } catch (PersistenceException e) {
            e.printStackTrace();
            tx.rollback();
            return false;
        }finally {
            session.close();
        }

    }

    @Override
    public Restaurant getRestaurant(Long id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try{
            Restaurant restaurant = session.get(Restaurant.class, id);
            session.flush() ;
            tx.commit();
            return restaurant;
        } catch (HibernateException e) {
            e.printStackTrace();
            tx.rollback();
        }finally {
            session.close();
        }
        return null;
    }

    @Override
    public List<Restaurant> getAllRestaurants() {
        // TODO change depricated
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try{
            Query query = session.createQuery("from Restaurant");
            List<Restaurant> restaurants = query.list();
            session.flush() ;
            tx.commit();
            return restaurants;
        } catch (HibernateException e) {
            e.printStackTrace();
            tx.rollback();
        }finally {
            session.close();
        }
        return null;
    }
}