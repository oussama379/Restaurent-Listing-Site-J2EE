package com.example.restaurantmanagement.controllers;

import com.example.restaurantmanagement.entities.AddRequestStatus;
import com.example.restaurantmanagement.entities.Restaurant;
import com.example.restaurantmanagement.entities.Review;
import com.example.restaurantmanagement.entities.User;
import com.example.restaurantmanagement.model.RestaurantModel;
import com.example.restaurantmanagement.model.UserModel;
import com.example.restaurantmanagement.services.userRepositoryImp;
import com.example.restaurantmanagement.services.restaurantRepositoryImp;
import com.example.restaurantmanagement.services.reviewRepositoryImp;
import com.example.restaurantmanagement.utils.AppUtils;
import javafx.util.Pair;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Collectors;

@MultipartConfig
@WebServlet(name="RestaurantServlet", urlPatterns = "*.phpp")
public class RestaurantServlet extends HttpServlet {
    userRepositoryImp userRepositoryImp;
    restaurantRepositoryImp restaurantRepositoryImp;
    reviewRepositoryImp reviewRepositoryImp;

    String errorMessage;



    public void init() throws ServletException {
        userRepositoryImp = new userRepositoryImp();
        restaurantRepositoryImp = new restaurantRepositoryImp();
        reviewRepositoryImp = new reviewRepositoryImp();
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        String Path = req.getServletPath();
        //=========================================================================\\
        if (Path.equalsIgnoreCase("/listRestaurantCrud.phpp")) {
            RestaurantModel model1 = new RestaurantModel();
            model1.setKeyWord("restaurants");
            model1.setRestaurants(restaurantRepositoryImp.getAllRestaurants());
            req.setAttribute("modelRestaurant", model1);
            req.getRequestDispatcher("views/listRestaurantCrud.jsp").forward(req, resp);
        }
        //=========================================================================\\
        else if (Path.equalsIgnoreCase("/addRestaurant.phpp")) {
            //TODO Only Restaurant Owners
            req.getRequestDispatcher("views/addRestaurant.jsp").forward(req, resp);
        }
        //=========================================================================\\
        else if (Path.equalsIgnoreCase("/editRestaurant.phpp")) {
            Long restID = Long.valueOf(req.getParameter("id"));
            Restaurant restaurant = restaurantRepositoryImp.getRestaurant(restID);

            RestaurantModel model1 = new RestaurantModel();
            model1.setKeyWord("restaurant-edit");
            model1.setRestaurantToEdit(restaurant);
            req.setAttribute("modelRestaurant", model1);

            req.getRequestDispatcher("views/addRestaurant.jsp").forward(req, resp);
        }
        //=========================================================================\\
        else if (Path.equalsIgnoreCase("/deleteRestaurant.phpp")) {
            Long restID = Long.valueOf(req.getParameter("id"));

            if (restaurantRepositoryImp.deleteRestaurant(restID)) {
                errorMessage = "Deleted Successfully";
                req.setAttribute("errorMessage", errorMessage);
            } else {
                errorMessage = "Error while Deleting";
                req.setAttribute("errorMessage", errorMessage);
            }
            RestaurantModel model1 = new RestaurantModel();
            model1.setKeyWord("restaurants");
            model1.setRestaurants(restaurantRepositoryImp.getAllRestaurants());
            req.setAttribute("modelRestaurant", model1);
            req.getRequestDispatcher("views/listRestaurantCrud.jsp").forward(req, resp);
        }
        //=========================================================================\\
        else if (Path.equalsIgnoreCase("/saveRestaurant.phpp")) {
            Restaurant restaurant = new Restaurant();
            restaurant.setName(req.getParameter("name"));
            restaurant.setAddress(req.getParameter("address"));
            restaurant.setAverageCost(Double.parseDouble(req.getParameter("averageCost")));
            restaurant.setEmail(req.getParameter("email"));
            restaurant.setGoogleMaps(req.getParameter("googleMaps"));
            restaurant.setOpeningTime(req.getParameter("openingTime"));
            restaurant.setClosingTime(req.getParameter("closingTime"));
            restaurant.setOpeningTimeWeekEnd(req.getParameter("openingTimeWeekEnd"));
            restaurant.setClosingTimeWeekEnd(req.getParameter("closingTimeWeekEnd"));
            restaurant.setFacebook(req.getParameter("facebook"));
            restaurant.setPhone(req.getParameter("phone"));
            restaurant.setInstagram(req.getParameter("instagram"));
            restaurant.setTypeCuisine(req.getParameter("typeCuisine"));
            restaurant.setTags(req.getParameter("tags"));
            restaurant.setDescription(req.getParameter("description"));
            restaurant.setBlock(req.getParameter("block"));
            restaurant.setPayment(req.getParameter("payment"));
            restaurant.setWebSite(req.getParameter("webSite"));
            restaurant.setOwnerUser(null);
            restaurant.setAddRequestStatus(AddRequestStatus.APPROVED);
            if (req.getParameter("id") != null){
                restaurant.setId(Long.valueOf(req.getParameter("id")));

                Restaurant restaurant1 = restaurantRepositoryImp.getRestaurant(restaurant.getId());
                restaurant.setImages(restaurant1.getImages());
                restaurant.setMenuImages(restaurant1.getMenuImages());
                restaurant.setAddRequestStatus(restaurant1.getAddRequestStatus());
            }


            // Save
            if (restaurantRepositoryImp.saveOrUpdateRestaurant(restaurant)){
                if (req.getParameter("id") != null){ // Is an Edit
                    // Edit object to save pictures after first save to put the object id on pictures names
                    String[] pic_menu = updateFiles(req, restaurant.getId());
                    restaurant.setImages(pic_menu[0]);
                    restaurant.setMenuImages(pic_menu[1]);
                }else {
                    String[] pic_menu = saveFiles(req, restaurant.getId());
                    restaurant.setImages(pic_menu[0]);
                    restaurant.setMenuImages(pic_menu[1]);
                }

                // Update : Add pictures and menus
                if (restaurantRepositoryImp.saveOrUpdateRestaurant(restaurant)) {
                    errorMessage = "Saved Successfully";
                    req.setAttribute("errorMessage", errorMessage);
                } else {
                    errorMessage = "Error while Saving";
                    req.setAttribute("errorMessage", errorMessage);
                }
                RestaurantModel model1 = new RestaurantModel();
                model1.setKeyWord("restaurants");
                model1.setRestaurants(restaurantRepositoryImp.getAllRestaurants());
                req.setAttribute("modelRestaurant", model1);
            }else {
                errorMessage = "Error while Saving";
                req.setAttribute("errorMessage", errorMessage);
            }

            req.getRequestDispatcher("views/listRestaurantCrud.jsp").forward(req, resp);
        }
        //=========================================================================\\
        else if(Path.equalsIgnoreCase("/setMainPicture.phpp")){
            long id = Long.parseLong(req.getParameter("id"));
            int index = Integer.parseInt(req.getParameter("index"));
            boolean result = setMainPicture(id , index);

            if (result) {
                resp.sendError(HttpServletResponse.SC_OK); // 200
            } else {
                resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR); // 500
            }

        }
        //=========================================================================\\
        else if(Path.equalsIgnoreCase("/deletePicture.phpp")){
            long id = Long.parseLong(req.getParameter("id"));
            int index = Integer.parseInt(req.getParameter("index"));
            String path = getServletContext().getRealPath("/") + AppUtils.UPLOAD_DIRECTORY_RESTAURANT;
            String type = req.getParameter("type");

            boolean result = deletePicture(id , index, path, type);

            if (result) {
                resp.sendError(HttpServletResponse.SC_OK); // 200
            } else {
                resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR); // 500
            }

        }
        //=========================================================================\\
        else if (Path.equalsIgnoreCase("/listRestaurants.phpp")) {
            List<String> typesCuisine = restaurantRepositoryImp.getTypesOfCuisine();
            req.setAttribute("typesCuisine", typesCuisine);

            int count = Math.toIntExact(restaurantRepositoryImp.countRestaurants());
            int nbPages ;
            if(count % restaurantRepositoryImp.pageSize != 0) nbPages = (int) count/restaurantRepositoryImp.pageSize + 1;
            else nbPages = (int) count/3;
            int currentPage = 1;

            if(req.getParameter("page") != null) {
                currentPage = Integer.parseInt(req.getParameter("page"));
            }
            List<Restaurant> restaurantsPage = restaurantRepositoryImp.getPage(currentPage);

            req.setAttribute("currentPage", currentPage);
            req.setAttribute("nbPages", nbPages);
            req.setAttribute("restaurantsPage", restaurantsPage);

            //--Handling-Images----//
            List<String> allImages = new ArrayList<>();
            for(Restaurant r : restaurantsPage)
                allImages.add(r.getImages());
            List<String> firstImages = new ArrayList<>();
            for(String s : allImages) {
                String[] arrOfStr = s.split(":", 2);
                firstImages.add(arrOfStr[0]);
            }
            req.setAttribute("firstImages", firstImages);
            //--End-Handling-Images----//
            User user = null;
            List<Restaurant> bookmarks = null;
            if(userRepositoryImp.currentUser != null) {
                bookmarks = new ArrayList<>();
                user = userRepositoryImp.getUser(userRepositoryImp.currentUser.getId());
                if(!user.getBookmarks().isEmpty()){
                    for(Restaurant r : user.getBookmarks())
                        bookmarks.add(r);
                }else{
                    bookmarks = null;
                    System.out.println("Empty");
                }
            }
            /*System.out.println(restaurantsPage);
            System.out.println(bookmarks);*/
            req.setAttribute("bookmarks", bookmarks);

            req.getRequestDispatcher("views/listRestaurants.jsp").forward(req, resp);
        }
        else if (Path.equalsIgnoreCase("/searchRestaurants.phpp")) {
            List<String> typesCuisine = restaurantRepositoryImp.getTypesOfCuisine();
            req.setAttribute("typesCuisine", typesCuisine);
            String name = req.getParameter("name");
            String location = req.getParameter("location");
            String cuisineType = req.getParameter("cuisineType");
            String rating = req.getParameter("rating");
            if(name.equals(""))
                name = null;
            else
                req.setAttribute("name", name);
            if(location.equals(""))
                location = null;
            else
                req.setAttribute("location", location);
            if(cuisineType.equals("All Categories"))
                cuisineType = null;
            else
                req.setAttribute("cuisineType", cuisineType);
            if(rating.equals("0"))
                rating = null;
            else
                req.setAttribute("rating", rating);
            int currentPage = 1;

            if(req.getParameter("page") != null) {
                currentPage = Integer.parseInt(req.getParameter("page"));
            }

            javafx.util.Pair<List<Restaurant>, Integer> P = restaurantRepositoryImp.getByMultipleCriteria(name, cuisineType, location, rating,
                    currentPage);
            req.setAttribute("search", true);

            int count = P.getValue();
            int nbPages ;
            if(count % restaurantRepositoryImp.pageSize != 0) nbPages = (int) count/restaurantRepositoryImp.pageSize + 1;
            else nbPages = (int) count/3;

            List<Restaurant> restaurantsPage = P.getKey();
            System.out.println(restaurantsPage.size());
            req.setAttribute("currentPage", currentPage);
            req.setAttribute("nbPages", nbPages);
            req.setAttribute("restaurantsPage", restaurantsPage);
            if(name == null) req.setAttribute("name", "");
            if(rating == null) req.setAttribute("rating", "0");
            if(location == null) req.setAttribute("location", "");
            if(cuisineType == null) req.setAttribute("cuisineType", "All Categories");
            req.getRequestDispatcher("views/listRestaurants.jsp").forward(req, resp);
            //=========================================================================\\
        }else if (Path.equalsIgnoreCase("/restaurantDetail.phpp")) {
            Long id = Long.valueOf(req.getParameter("id"));
            Restaurant restaurant = restaurantRepositoryImp.getRestaurant(id);
            req.setAttribute("restaurant", restaurant);

            //--Handling-Images----//
            List<String> Images = new ArrayList<>();
            String[] arrOfStr = restaurant.getImages().split(":");
            for(String s : arrOfStr)
                Images.add(s);
            req.setAttribute("Images", Images);

            List<String> menuImages = new ArrayList<>();
            String[] arrOfStr1 = restaurant.getMenuImages().split(":");
            for(String s1 : arrOfStr1)
                menuImages.add(s1);
            req.setAttribute("menuImages", menuImages);
            //--End-Handling-Images----//

            //--Handling-Tags----//
            List<String> tags = new ArrayList<>();
            String[] arrOfStr2 = restaurant.getTags().split(",");
            for(String s1 : arrOfStr2)
                tags.add(s1);
            req.setAttribute("tags", tags);
            //--End-Handling-Tags----//

            //--Handling-Pay-Methods----//
            List<String> pay = new ArrayList<>();
            String[] arrOfStr3 = restaurant.getPayment().split(",");
            for(String s1 : arrOfStr3)
                pay.add(s1);
            req.setAttribute("pay", pay);
            //--End-Handling-Pay-Methods----//

            //--Sending-Reviews----//
            List<Review> reviews = reviewRepositoryImp.getRestaurantReviews(id);
            req.setAttribute("reviews", reviews);


            double restaurantRating = 0;
            for(Review r : reviews)
                restaurantRating = restaurantRating + r.getRating();
            restaurantRating = Double.parseDouble(new DecimalFormat("##.#").format(restaurantRating/reviews.size()));
            req.setAttribute("restaurantRating", restaurantRating);
            System.out.println(reviews.size());
            System.out.println(restaurantRating);

            req.getRequestDispatcher("views/restaurantDetail.jsp").forward(req, resp);

            //=========================================================================\\
        }else if (Path.equalsIgnoreCase("/submitReview.phpp")) {
            Long rating = Long.valueOf(req.getParameter("rating"));
            Long id = Long.valueOf(req.getParameter("id"));
            String review_text = req.getParameter("review_text");

            Restaurant restaurant = restaurantRepositoryImp.getRestaurant(id);
            Review review = new Review();
            review.setRestaurant(restaurant);
            review.setReviewText(review_text);
            review.setRating(rating);
            //--Review-Date---//
            LocalDateTime myDateObj = LocalDateTime.now();
            DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("E, MMM dd yyyy");
            String formattedDate = myDateObj.format(myFormatObj);
            review.setDateReview(formattedDate);
            //--End-Review-Date---//
            review.setUser(userRepositoryImp.currentUser);
            reviewRepositoryImp.saveOrUpdateReview(review);
            List<Review> reviews = reviewRepositoryImp.getRestaurantReviews(id);

            req.setAttribute("reviews", reviews);

            double restaurantRating = 0;
            for(Review r : reviews)
                restaurantRating = restaurantRating + r.getRating();
            restaurantRating = Double.parseDouble(new DecimalFormat("##.#").format(restaurantRating/reviews.size()));
            req.setAttribute("restaurantRating", restaurantRating);
            System.out.println(reviews.size());
            System.out.println(restaurantRating);

            req.getRequestDispatcher("/restaurantDetail.phpp?id="+id).forward(req, resp);
            //=========================================================================\\
        } else if (Path.equalsIgnoreCase("/bookMarks.phpp")) {
            Long id_user = userRepositoryImp.currentUser.getId();
            User user = userRepositoryImp.getUser(id_user);
            Set<Restaurant> restaurantSet = user.getBookmarks();
            List<Restaurant> restaurants = new ArrayList<>();
            for(Restaurant r : restaurantSet)
                restaurants.add(r);
            req.setAttribute("restaurants", restaurants);

            //--Handling-Images----//
            List<String> allImages = new ArrayList<>();
            for(Restaurant r : restaurants)
                allImages.add(r.getImages());
            List<String> firstImages = new ArrayList<>();
            for(String s : allImages) {
                String[] arrOfStr = s.split(":", 2);
                firstImages.add(arrOfStr[0]);
            }
            req.setAttribute("firstImages", firstImages);
            //--End-Handling-Images----//

            //--Sending-Reviews-Sizes-&-rating--//
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

            req.setAttribute("reviewSizesPair", reviewSizesPair);
            req.setAttribute("ratingsPair", ratingsPair);

            req.getRequestDispatcher("views/bookMarks.jsp").forward(req, resp);
            //=========================================================================\\

        } else if (Path.equalsIgnoreCase("/removeBookMark.phpp")) {
            Long id_bookMark = Long.valueOf(req.getParameter("id"));
            User user = userRepositoryImp.getUser(userRepositoryImp.currentUser.getId());
            Set<Restaurant> restaurantSet = user.getBookmarks();
            Restaurant R = null;
            restaurantSet.removeIf(r -> r.getId() == id_bookMark);
            Set<Restaurant> restaurantSet2 = new HashSet<>();
            restaurantSet2.addAll(restaurantSet);

            user.setBookmarks(restaurantSet2);
            userRepositoryImp.saveOrUpdateUser(user, false);
            if(req.getParameter("fromList") != null)
                req.getRequestDispatcher("/listRestaurants.phpp").forward(req, resp);
            req.getRequestDispatcher("/bookMarks.phpp").forward(req, resp);
            //=========================================================================\\
        } else if (Path.equalsIgnoreCase("/addBookMark.phpp")) {
            Long id_bookMark = Long.valueOf(req.getParameter("id"));
            User user = userRepositoryImp.getUser(userRepositoryImp.currentUser.getId());
            Set<Restaurant> restaurantSet = user.getBookmarks();
            Restaurant R = restaurantRepositoryImp.getRestaurant(id_bookMark);
            restaurantSet.add(R);
            Set<Restaurant> restaurantSet2 = new HashSet<>();
            restaurantSet2.addAll(restaurantSet);
            user.setBookmarks(restaurantSet2);
            userRepositoryImp.saveOrUpdateUser(user, false);

            if(req.getParameter("fromList") != null)
                req.getRequestDispatcher("/listRestaurants.phpp").forward(req, resp);

            req.getRequestDispatcher("/bookMarks.phpp").forward(req, resp);
            //=========================================================================\\
        }
        //=========================================================================\\
        else if (Path.equalsIgnoreCase("/listRestReq.phpp")) {
            String param = req.getParameter("param");

            List<Restaurant> filteredList = restaurantRepositoryImp.getAllRestaurants()
                    .stream()
                    .filter(restaurant -> restaurant.getAddRequestStatus().equals(AddRequestStatus.PENDING))
                    .collect(Collectors.toList());
            RestaurantModel model1 = new RestaurantModel();
            model1.setKeyWord("restaurants");
            model1.setRestaurants(filteredList);
            req.setAttribute("modelRestaurant", model1);
            req.getRequestDispatcher("views/listRestaurantReq.jsp").forward(req, resp);
        }
        else {
            req.getRequestDispatcher("404.jsp").forward(req, resp);
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }

    private String[] saveFiles(HttpServletRequest request, Long id) throws ServletException, IOException {
        /*
        * The objective : store files in "/path-to-project-folder/src/main/webapp/upload/"
        * getServletContext().getRealPath("/") : return = /path-to-project-folder/target/RestaurentManagement-1.0-SNAPSHOT/
        * AppUtils.UPLOAD_DIRECTORY : return = /../../src/main/webapp/upload
        * the result :
        * /path-to-project-folder/target/RestaurentManagement-1.0-SNAPSHOT/../../src/main/webapp/upload = /path-to-project-folder/src/main/webapp/upload/
        * */
        String uploadPath = getServletContext().getRealPath("/") + AppUtils.UPLOAD_DIRECTORY_RESTAURANT;
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdirs();

        // result ex : "pic1.png:pic2.png:pic3.png:"
        StringBuilder pictures = new StringBuilder();
        StringBuilder menu = new StringBuilder();

        int p = 1, m = 1;
        String fileName, saveName;
        for (Part part : request.getParts()) {
            fileName = part.getSubmittedFileName();
            if (fileName != null && !fileName.equals("")){
                fileName = fileName.replaceAll(" ", "_").toLowerCase();
                if (part.getName().equals("pictures")){
                    saveName = id+"-PIC"+p+"-"+fileName;
                    part.write(uploadPath + File.separator + saveName);
                    pictures.append(saveName).append(":");
                    p++;
                }else if (part.getName().equals("menu")){
                    saveName = id+"-MENU"+m+"-"+fileName;
                    part.write(uploadPath + File.separator + saveName);
                    menu.append(saveName).append(":");
                    m++;
                }
            }
        }

        String[] ary = {pictures.toString(), menu.toString()};
        return ary;
    }

    private String[] updateFiles(HttpServletRequest request, Long id) throws ServletException, IOException {
        String uploadPath = getServletContext().getRealPath("/") + AppUtils.UPLOAD_DIRECTORY_RESTAURANT;
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdirs();

        Restaurant restaurant = restaurantRepositoryImp.getRestaurant(id);

        // result ex : "pic1.png:pic2.png:pic3.png:"
        StringBuilder pictures = new StringBuilder();
        StringBuilder menu = new StringBuilder();
        pictures.append(restaurant.getImages());
        menu.append(restaurant.getMenuImages());

        String[] array_pictures = pictures.toString().split(":");
        String[] array_menu = menu.toString().split(":");
        Matcher matcher;

        String s = array_pictures[array_pictures.length-1];
        matcher = Pattern.compile("\\d+").matcher(s);
        matcher.find();matcher.find();
        int p = Integer.parseInt(matcher.group())+1;

        String ss = array_menu[array_menu.length-1];
        matcher = Pattern.compile("\\d+").matcher(ss);
        matcher.find();matcher.find();
        int m = Integer.parseInt(matcher.group())+1;

//        int p = array_pictures.length+1, m = array_menu.length+1;
        String fileName, saveName;
        for (Part part : request.getParts()) {
            fileName = part.getSubmittedFileName();
            if (fileName != null && !fileName.equals("")){
                fileName = fileName.replaceAll(" ", "_").toLowerCase();
                if (part.getName().equals("pictures")){
                    saveName = id+"-PIC"+p+"-"+fileName;
                    part.write(uploadPath + File.separator + saveName);
                    pictures.append(saveName).append(":");
                    p++;
                }else if (part.getName().equals("menu")){
                    saveName = id+"-MENU"+m+"-"+fileName;
                    part.write(uploadPath + File.separator + saveName);
                    menu.append(saveName).append(":");
                    m++;
                }
            }
        }

        String[] ary = {pictures.toString(), menu.toString()};
        return ary;
    }

    private boolean setMainPicture(Long id, int index){
        Restaurant restaurant = restaurantRepositoryImp.getRestaurant(id);
        String images = restaurant.getImages();

        String[] arrOfStr = images.split(":");
        swap(arrOfStr, 0, index);
        restaurant.setImages(arrToString(arrOfStr));

        return restaurantRepositoryImp.saveOrUpdateRestaurant(restaurant);
    }

    private boolean deletePicture(Long id, int index, String path, String type){
        Restaurant restaurant = restaurantRepositoryImp.getRestaurant(id);
        String images;
        if (type.equals("PIC"))
            images = restaurant.getImages();
        else // MENU
            images = restaurant.getMenuImages();

        String[] arrOfStr = images.split(":");
        if (arrOfStr.length == 1) return false;
        String imageToDelete = arrOfStr[index];

        arrOfStr[index] = "";
        arrOfStr = removeEmptyElements(arrOfStr);

        if (type.equals("PIC"))
            restaurant.setImages(arrToString(arrOfStr));
        else // MENU
            restaurant.setMenuImages(arrToString(arrOfStr));

        File file = new File(path, imageToDelete);

        if (file.delete())
            return restaurantRepositoryImp.saveOrUpdateRestaurant(restaurant);

        return false;
    }

    private <T> void swap (T[] a, int i, int j) {
        T t = a[i];
        a[i] = a[j];
        a[j] = t;
    }

    private String arrToString (String[] a) {
        StringBuilder result = new StringBuilder();
        for (String s: a) {
            result.append(s).append(":");
        }

        return result.toString();
    }

    private String[] removeEmptyElements (String[] a) {
        List<String> list = new ArrayList<String>();

        for(String s : a) {
            if(s != null && s.length() > 0) {
                list.add(s);
            }
        }

        return list.toArray(new String[0]);
    }

}
