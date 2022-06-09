package com.example.restaurantmanagement.services;

import com.example.restaurantmanagement.config.HibernateUtil;
import com.example.restaurantmanagement.entities.AddRequestStatus;
import com.example.restaurantmanagement.entities.Restaurant;


import com.example.restaurantmanagement.entities.User;
import org.hibernate.*;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;
import javax.persistence.PersistenceException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

public class RestaurantRepositoryImp implements RestaurantRepository{
    UserRepository userRepository;
    public RestaurantRepositoryImp() {
        userRepository = new UserRepositoryImp();
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

    public List<Restaurant> topWhat(int number, List<Restaurant> restaurants){
        if(restaurants.size() >= number)  {
            Collections.sort(restaurants, Comparator.comparingInt(Restaurant::getViews));
            Collections.reverse(restaurants);
            List<Restaurant> topFive = new ArrayList<>();
            for (int i = 0; i < number; i++) {
                topFive.add(restaurants.get(i));
            }
            return topFive;
        }else{
            return null;
        }
    }

    public javafx.util.Pair<List<Restaurant>, Integer> getByMultipleCriteria(String name, String typeCuisine, String block, String rating, int pageNumber) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Criteria criteria = session.createCriteria(Restaurant.class);
        criteria.add(Restrictions.eq("addRequestStatus", AddRequestStatus.APPROVED));
        System.out.println("criteria before :" + criteria.list());
        if (name != null) {
            criteria.add(Restrictions.like("name", name, MatchMode.ANYWHERE));
        }
        System.out.println("criteria after name :" + criteria.list());
        if (typeCuisine != null) {
            criteria.add(Restrictions.like("typeCuisine", typeCuisine, MatchMode.ANYWHERE));
        }
        System.out.println("criteria after typeCuisine :" + criteria.list());
        if (block != null) {
            criteria.add(Restrictions.like("block", block, MatchMode.ANYWHERE));
        }
        System.out.println("criteria after block :" + criteria.list());
//        if (rating != null) {
//            double rat = Double.parseDouble(rating);
//            criteria.add(Restrictions.eq("rating", rat));
//        }
        int count = Integer.valueOf(criteria.list().size());
        System.out.println("count:" + count);
        System.out.println("criteria:" + criteria.list());
        criteria = criteria.setFirstResult(this.pageSize * (pageNumber - 1));
        criteria = criteria.setMaxResults(this.pageSize);
        List<Restaurant> restaurants = criteria.list();
        javafx.util.Pair<List<Restaurant>, Integer> P = new javafx.util.Pair<>(restaurants, count);
        System.out.println("in getByMultipleCriteria" + restaurants);
        return P;
    }

    public Long countRestaurants(){
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try{
            Query query = session.createQuery("select count(id) from Restaurant where addRequestStatus = 1");
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
    public List<Restaurant> getPage(int pageNumber) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        List<Restaurant> result = null;
        try {
            session.beginTransaction();
            org.hibernate.query.Query query = session.createQuery("from Restaurant where addRequestStatus = 1");
            query = query.setFirstResult(pageSize * (pageNumber - 1));
            query.setMaxResults(pageSize);
            result = query.list();
            session.getTransaction().commit();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }






}
