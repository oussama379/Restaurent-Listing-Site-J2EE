package com.example.restaurantmanagement.services;

public class test {
    RestaurantRepositoryImp restaurantRepositoryImp = new RestaurantRepositoryImp();

/*    public List<Restaurant> topWhat(List<Restaurant> restaurants){
        Collections.sort(restaurants, Comparator.comparingInt(Restaurant::getViews));
        Collections.reverse(restaurants);
        return restaurants;
    }*/
    public static void main(String args[]) throws Exception {
       /* UserRepositoryImp UserRepository = new UserRepositoryImp();
        User u = UserRepository.getUser(1L);
        for(Restaurant r : u.getBookmarks())
            System.out.println(r);
*/
      /*  UserRepositoryImp UserRepository = new UserRepositoryImp();
        RestaurantRepositoryImp RestaurantRepositoryImp = new RestaurantRepositoryImp();
        User user = UserRepository.getUser(1L);
        Set<Restaurant> restaurantSet = user.getBookmarks();
        Restaurant R = null;
        for(Restaurant r : restaurantSet){
            if(r.getId() == 1L)
                restaurantSet.remove(r);
        }
        user.setBookmarks(restaurantSet);
        UserRepository.saveOrUpdateUser(user, false);

        System.out.println(UserRepository.getUser(1L).getBookmarks());*/
/*        test tes = new test();
        Restaurant r1 = new Restaurant();
        r1.setId(1L);
        r1.setViews(3);
        Restaurant r2 = new Restaurant();
        r2.setId(2L);
        r2.setViews(5);
        Restaurant r3 = new Restaurant();
        r3.setId(3L);
        r3.setViews(2);
        Restaurant r4 = new Restaurant();
        r4.setId(4L);
        r4.setViews(10);
        Restaurant r5 = new Restaurant();
        r5.setId(5L);
        r5.setViews(20);
        Restaurant r6 = new Restaurant();
        r6.setId(6L);
        r6.setViews(0);
        List<Restaurant> restaurants = new ArrayList<>();
        restaurants.add(r1);
        restaurants.add(r2);
        restaurants.add(r3);
        restaurants.add(r4);
        restaurants.add(r5);
        restaurants.add(r6);
        for(Restaurant r : restaurants)
            System.out.println(r);
        System.out.println("=================================");
        List<Restaurant> restaurantsSoreted = tes.topWhat(restaurants);
        List<Restaurant> topFive = new ArrayList<>();
        for(int i = 0; i < 3; i++) {
            topFive.add(restaurants.get(i));
        }
        for(Restaurant r : topFive)
            System.out.println(r);
        System.out.println("=================================");*/


 /*       for(Restaurant r : restaurantSet)
            restaurants.add(r);

        List<Integer> reviewSizes = new ArrayList<>();
        List<Double> ratings = new ArrayList<>();
        List<Long> id_reviewSizes = new ArrayList<>();
        List<Long> id_ratings = new ArrayList<>();
        Pair<List<Long>, List<Integer>> reviewSizesPair = null;
        Pair<List<Long>, List<Double>> ratingsPair = null;


        for(Restaurant R : restaurants) {
            double restaurantRating = 0;
            reviewSizes.add(R.getReviews().size());
            for(Review r : R.getReviews())
                restaurantRating = restaurantRating + r.getRating();
            restaurantRating = Double.parseDouble(new DecimalFormat("##.#").format(restaurantRating/R.getReviews().size()));
            ratings.add(restaurantRating);

            id_ratings.add(R.getId());
            id_reviewSizes.add(R.getId());
        }
        reviewSizesPair = new Pair<>(id_reviewSizes, reviewSizes);
        ratingsPair = new Pair<>(id_ratings, ratings);
        System.out.println(reviewSizesPair);
        System.out.println(ratingsPair);*/



       // List<String> imageslinks = new ArrayList<>();
    /*    for(Restaurant r : restaurantsPage)
            imageslinks.add(r.getImages());*/

   /*     imageslinks.add("1-PIC1-Food-steak-restaurant-wine-dinner_1600_1067_d.jpg:1-PIC2-poker-hand-rankings.png:1-PIC3-StolenWifi.PNG:");
        imageslinks.add("2-PIC1-Food-steak-restaurant-wine-dinner_1600_1067_d.jpg:2-PIC2-poker-hand-rankings.png:2-PIC3-StolenWifi.PNG:");
        List<String> imageslinks2 = new ArrayList<>();
        for(String s : imageslinks) {
            String[] arrOfStr = s.split(":", 2);
            imageslinks2.add(arrOfStr[0]);
        }
        for(String s : imageslinks2) {
            System.out.println(s);
        }*/
    /*    List<String> tags = new ArrayList<>();
        String s = "Wifi,Alcohol,OutDoor";
        String[] arrOfStr2 = s.split(",");
        for(String s1 : arrOfStr2)
            tags.add(s1);
        System.out.println(tags);*/
     /*   RestaurantRepositoryImp RestaurantRepositoryImp = new RestaurantRepositoryImp();
        reviewRepositoryImp reviewRepository = new reviewRepositoryImp();
        for(Review r : reviewRepository.getRestaurantReviews(1L)){
            System.out.println(r);
            System.out.println(r.getUser().getUsername());
        }*/



     /*   reviewRepositoryImp reviewRepository = new reviewRepositoryImp();
        UserRepositoryImp UserRepository = new UserRepositoryImp();

        Restaurant restaurant = RestaurantRepositoryImp.getRestaurant(1L);
        User user = UserRepository.getUser(1L);
        Review review = new Review();

        String review_text = "YEAH YEAH";

        review.setReviewText(review_text);
        review.setRestaurant(restaurant);
        review.setUser(user);

        reviewRepository.saveOrUpdateReview(review);*/
       /* Restaurant r = RestaurantRepositoryImp.getRestaurant(1L);
        Set<Review> rs = r.getReviews();
        for(Review rx : rs)
        System.out.println(rx);*/




    }

   /*     RestaurantRepositoryImp RestaurantRepositoryImp = new RestaurantRepositoryImp();

        for (Restaurant R : RestaurantRepositoryImp.getByMultipleCriteria(null, null,
                null, "2", 1).getKey()){
            System.out.println(R);
        }
        System.out.println("-------------------");
        for (Restaurant R : RestaurantRepositoryImp.getByMultipleCriteria(null, null,
                null, "2", 2).getKey()){
            System.out.println(R);
        }
*/



//        RestaurantRepositoryImp.getByMultipleCriteria("name", "cuisineType", "location","2");
//        System.out.println(RestaurantRepositoryImp.countRestaurants());

     /*   for (Restaurant R : Pagination.getData(1)){
            System.out.println(R.getId());
        }
        System.out.println("-------------------");
        for (Restaurant R : Pagination.getData(2)){
            System.out.println(R.getId());
        }
        System.out.println("-------------------");
        for (Restaurant R : Pagination.getData(3)){
            System.out.println(R.getId());
        }
        System.out.println("-------------------");
        for (Restaurant R : Pagination.getData(4)){
            System.out.println(R.getId());
        }*/
        /*System.out.println(RestaurantRepositoryImp.getTypesOfCuisine());*/
        /*final StandardServiceRegistry registry = new StandardServiceRegistryBuilder().configure().build();
        SessionFactory sessionFactory = new MetadataSources(registry).buildMetadata().buildSessionFactory();
        Session session = sessionFactory.openSession();*/
/*
        UserRepositoryImp UserRepositoryImp = new UserRepositoryImp();
        RestaurantRepositoryImp RestaurantRepositoryImp = new RestaurantRepositoryImp();



        Restaurant restaurant = new Restaurant();
        RestaurantRepositoryImp.deleteRestaurant(1L);
*/



       /* for ( User U : UserRepositoryImp.getAllUsers() ){
            System.out.println(U.toString());
        }*/
/*
        User user = new User("oussamacc", "hennae","zzoVVVVccuss", "oussa@gmail.com", "1234", "admin");
        user.setId(2L);
        boolean b = UserRepositoryImp.saveOrUpdateUser(user);
        System.out.println(b);

        System.out.println(UserRepositoryImp.authenticate("mm", "1234"));
        System.out.println(UserRepositoryImp.getUser(1L));
        System.out.println(UserRepositoryImp.deleteUser(1L));
        System.out.println(UserRepositoryImp.getAllUsers());*/

        /*User user2 = new User("ouss1modify", "oussa@gmail.com", "admin");
        user2.setId(1L);*/

        /*boolean b = UserRepositoryImp.deleteUser(3L);
        System.out.println(b);*/
     /*   User user = UserRepositoryImp.getUser(1L);
        System.out.println(user.toString());*/

/*
        User user3 = new User("ouss3", "oussa@gmail.com", "admin");

        b = UserRepositoryImp.saveOrUpdateUser(user3);
        System.out.println(b);

        b = UserRepositoryImp.deleteUser(3L);
        System.out.println(b);
*/




       /* session.close();
        sessionFactory.close();*/


    }


