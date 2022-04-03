package com.example.restaurantmanagement.services;

import com.example.restaurantmanagement.config.HibernateUtil;
import com.example.restaurantmanagement.entities.Restaurant;
import org.hibernate.*;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;

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

    public List<String> getTypesOfCuisine(){
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try{
            Query query = session.createQuery("select distinct(typeCuisine) from Restaurant");
            List<String> typesOfCuisine = query.list();
            session.flush() ;
            tx.commit();
            return typesOfCuisine;
        } catch (HibernateException e) {
            e.printStackTrace();
            tx.rollback();
        }finally {
            session.close();
        }
        return null;
    }
    public List<Restaurant> getByName(String name) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Criteria criteria = session.createCriteria(Restaurant.class);
        Criterion critere = Restrictions.like("name", name, MatchMode.ANYWHERE);
        criteria.add(critere);
        List<Restaurant> restaurants = criteria.list();
        return restaurants;
    }
    public List<Restaurant> getByMultipleCriteria(String name, String typeCuisine, String block, String rating) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Criteria criteria = session.createCriteria(Restaurant.class);
        if (name != null) {
            criteria.add(Restrictions.like("name", name, MatchMode.ANYWHERE));
        }
        if (typeCuisine != null) {
            criteria.add(Restrictions.like("typeCuisine", typeCuisine, MatchMode.ANYWHERE));
        }
        if (block != null) {
            criteria.add(Restrictions.like("block", block, MatchMode.ANYWHERE));
        }
        if (rating != null) {
            criteria.add(Restrictions.eq("rating", rating));
        }
        List<Restaurant> restaurants = criteria.list();
        return restaurants;
    }

    public Long countRestaurants(){
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try{
            Query query = session.createQuery("select count(id) from Restaurant");
            Long count = (Long)query.uniqueResult();
            session.flush() ;
            tx.commit();
            return count;
        } catch (HibernateException e) {
            e.printStackTrace();
            tx.rollback();
        }finally {
            session.close();
        }
        return null;
    }



}
