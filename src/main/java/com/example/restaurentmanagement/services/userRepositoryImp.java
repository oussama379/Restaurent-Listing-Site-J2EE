package com.example.restaurentmanagement.services;

import com.example.restaurentmanagement.entities.User;
import org.hibernate.*;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.criterion.Restrictions;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.List;

public class userRepositoryImp implements userRepository{
    static User currentUser = null;
    final StandardServiceRegistry registry = new StandardServiceRegistryBuilder().configure().build();
     SessionFactory sessionFactory ;
     Session session ;
     Transaction tx;

    public userRepositoryImp() {
        sessionFactory = new MetadataSources(registry).buildMetadata().buildSessionFactory();
        session = sessionFactory.openSession();
        tx = null;
    }

    @Override
    public boolean saveOrUpdateUser(User user) {
        try {
            tx = session.beginTransaction();
            //session.save(user);
            String password = user.getPassword();
            user.setPassword(encryptionMd5(password));
            session.saveOrUpdate(user);
            session.flush() ;
            tx.commit();
            return true;
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
                return false;
            }
            throw e;
        } finally {
            session.close();
            sessionFactory.close();
        }
    }

    @Override
    public boolean deleteUser(Long id) {
        try {
            User user = new User();
            user.setId(id);
            tx = session.beginTransaction();
            session.delete(user);
            session.flush() ;
            tx.commit();
            return true;
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
                return false;
            }
            throw e;
        } finally {
            session.close();
            sessionFactory.close();
        }
    }

    @Override
    public User getUser(Long id) {
        try {
            tx = session.beginTransaction();
            User user = session.get(User.class, id);
            session.flush() ;
            tx.commit();
            return user;
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
                return null;
            }
            throw e;
        } finally {
            session.close();
            sessionFactory.close();
        }
    }


    @Override
    public boolean authenticate(String username, String password) {
        // TODO change depricated
        Criteria criteria = session.createCriteria(User.class);
        User user = (User) criteria.add(Restrictions.eq("username", username)).uniqueResult();
        if(user == null){
            return false;
        }else{
            if(encryptionMd5(password).equals(user.getPassword())) {
                currentUser = user;
                return true;
            }
            else return false;
        }
    }

    @Override
    public List<User> getAllUsers() {
        try {
            tx = session.beginTransaction();
            // TODO change depricated
            Query query = session.createQuery("from User");
            List<User> users = query.list();
            session.flush() ;
            tx.commit();
            return users;
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
                return null;
            }
            throw e;
        } finally {
            session.close();
            sessionFactory.close();
        }
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
