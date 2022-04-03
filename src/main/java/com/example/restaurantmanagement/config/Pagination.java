package com.example.restaurantmanagement.config;

import java.util.List;

import com.example.restaurantmanagement.entities.Restaurant;
import lombok.Data;
import org.hibernate.Session;
import org.hibernate.query.Query;
@Data
public class Pagination {
        public static int pageSize = 3;
        public static List<Restaurant> getPage(int pageNumber) {
            Session session = HibernateUtil.getSessionFactory().openSession();
            List<Restaurant> result = null;
            try {
                session.beginTransaction();
                Query query = session.createQuery("from Restaurant");
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