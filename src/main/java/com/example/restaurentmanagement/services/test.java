package com.example.restaurentmanagement.services;

import com.example.restaurentmanagement.entities.User;
import com.example.restaurentmanagement.services.userRepositoryImp;

public class test {
    public static void main(String args[]) throws Exception {
        /*final StandardServiceRegistry registry = new StandardServiceRegistryBuilder().configure().build();
        SessionFactory sessionFactory = new MetadataSources(registry).buildMetadata().buildSessionFactory();
        Session session = sessionFactory.openSession();*/
        userRepositoryImp userRepositoryImp = new userRepositoryImp();
       /* for ( User U : userRepositoryImp.getAllUsers() ){
            System.out.println(U.toString());
        }*/

        //User user = new User("ouss", "oussa@gmail.com", "1234", "admin");
        //boolean b = userRepositoryImp.saveOrUpdateUser(user);
        boolean b = userRepositoryImp.authenticate("ouss", "1234");
        System.out.println(b);

        /*User user2 = new User("ouss1modify", "oussa@gmail.com", "admin");
        user2.setId(1L);*/

        /*boolean b = userRepositoryImp.deleteUser(3L);
        System.out.println(b);*/
     /*   User user = userRepositoryImp.getUser(1L);
        System.out.println(user.toString());*/

/*
        User user3 = new User("ouss3", "oussa@gmail.com", "admin");

        b = userRepositoryImp.saveOrUpdateUser(user3);
        System.out.println(b);

        b = userRepositoryImp.deleteUser(3L);
        System.out.println(b);
*/




       /* session.close();
        sessionFactory.close();*/


    }
}

