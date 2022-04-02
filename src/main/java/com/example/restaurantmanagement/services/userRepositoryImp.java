package com.example.restaurantmanagement.services;

import com.example.restaurantmanagement.config.HibernateUtil;
import com.example.restaurantmanagement.entities.User;
import org.hibernate.*;
import org.hibernate.criterion.Restrictions;

import javax.persistence.PersistenceException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.List;

public class userRepositoryImp implements userRepository{
    public static User currentUser = null;



    public userRepositoryImp() {
    }

    @Override
    public boolean saveOrUpdateUser(User user) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try{
            String password = user.getPassword();
            user.setPassword(encryptionMd5(password));
            session.saveOrUpdate(user);
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
    public boolean deleteUser(Long id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try{
            //TODO Handle Exception ???
            User user = new User();
            user.setId(id);
            session.delete(user);
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
    public User getUser(Long id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try{
            User user = session.get(User.class, id);
            session.flush() ;
            tx.commit();
            return user;
        } catch (HibernateException e) {
            e.printStackTrace();
            tx.rollback();
        }finally {
            session.close();
        }
        return null;
    }


    @Override
    public boolean authenticate(String email, String password) {
       // TODO change depricated
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try{
            Criteria criteria = session.createCriteria(User.class);
            User user = (User) criteria.add(Restrictions.eq("email", email)).uniqueResult();
            session.flush() ;
            tx.commit();
            if(user == null){
                return false;
            }else{
                if(encryptionMd5(password).equals(user.getPassword())) {
                    currentUser = user;
                    return true;
                }
                else return false;
            }
        } catch (HibernateException e) {
            e.printStackTrace();
            tx.rollback();
        }finally {
            session.close();
        }
        return false;
    }

    @Override
    public List<User> getAllUsers() {
        // TODO change depricated
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try{
            Query query = session.createQuery("from User");
            List<User> users = query.list();
            session.flush() ;
            tx.commit();
            return users;
        } catch (HibernateException e) {
            e.printStackTrace();
            tx.rollback();
        }finally {
            session.close();
        }
        return null;
    }


    public String encryptionMd5(String passwordToHash){
        String generatedPassword = null;
        try {
            // Create MessageDigest instance for MD5
            MessageDigest md = MessageDigest.getInstance("MD5");

            // Add password bytes to digest
            md.update(passwordToHash.getBytes());

            // Get the hash's bytes
            byte[] bytes = md.digest();

            // This bytes[] has bytes in decimal format. Convert it to hexadecimal format
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < bytes.length; i++) {
                sb.append(Integer.toString((bytes[i] & 0xff) + 0x100, 16).substring(1));
            }

            // Get complete hashed password in hex format
            generatedPassword = sb.toString();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return generatedPassword;
    }



}
