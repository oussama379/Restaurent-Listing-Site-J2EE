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
    public javafx.util.Pair<List<Restaurant>, Integer> getByMultipleCriteria(String name, String typeCuisine, String block, String rating, int pageNumber) {
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
            Long rat = Long.parseLong(rating);
            criteria.add(Restrictions.eq("rating", rat));
        }
        int count = Integer.valueOf(criteria.list().size());
        criteria = criteria.setFirstResult(this.pageSize * (pageNumber - 1));
        criteria = criteria.setMaxResults(this.pageSize);
        List<Restaurant> restaurants = criteria.list();
        javafx.util.Pair<List<Restaurant>, Integer> P = new javafx.util.Pair<>(restaurants, count);
        return P;
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


    public static int pageSize = 3;
    public static List<Restaurant> getPage(int pageNumber) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        List<Restaurant> result = null;
        try {
            session.beginTransaction();
            org.hibernate.query.Query query = session.createQuery("from Restaurant");
            query = query.setFirstResult(pageSize * (pageNumber - 1));
            query.setMaxResults(pageSize);
            result = query.list();
            session.getTransaction().commit();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
/*
    public static List<Restaurant> openNow() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        List<Restaurant> result = null;
        try {
            session.beginTransaction();
            org.hibernate.query.Query query = session.createQuery("from Restaurant");
            result = query.list();
            session.getTransaction().commit();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
*/





}
