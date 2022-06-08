package com.example.restaurantmanagement.controllers;

import com.example.restaurantmanagement.entities.Restaurant;
import com.example.restaurantmanagement.entities.User;
import com.example.restaurantmanagement.model.UserModel;
import com.example.restaurantmanagement.services.RestaurantRepository;
import com.example.restaurantmanagement.services.RestaurantRepositoryImp;
import com.example.restaurantmanagement.services.UserRepository;
import com.example.restaurantmanagement.services.UserRepositoryImp;
import com.example.restaurantmanagement.utils.AppUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
// TODO FIX CURRENT USER
@MultipartConfig
@WebServlet(name="UserServlet", urlPatterns = "*.php")
public class UserServlet extends HttpServlet {
    UserRepository userRepository;
    RestaurantRepository restaurantRepository;
    String errorMessage;

        public void init() {
            userRepository = new UserRepositoryImp();
            restaurantRepository  = new RestaurantRepositoryImp();
        }
        public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
            response.setContentType("text/html");
            String Path = request.getServletPath();
            //=========================================================================\\
            if (Path.equalsIgnoreCase("/listUsers.php")) {
                UserModel model1 = new UserModel();
                model1.setKeyWord("users");
                List<User> users = userRepository.getAllUsers();
                model1.setUsers(users);
                request.setAttribute("modelUser", model1);
                request.getRequestDispatcher("views/listUsers.jsp").forward(request, response);
            }
            //=========================================================================\\
            else if (Path.equalsIgnoreCase("/addUsers.php")) {
                request.getRequestDispatcher("views/addUser.jsp").forward(request, response);
            }
            //=========================================================================\\
            else if (Path.equalsIgnoreCase("/saveUser.php")) {
                User user = new User();
                user.setFirstname(request.getParameter("firstname"));
                user.setLastname(request.getParameter("lastname"));
                user.setUsername(request.getParameter("username"));
                user.setEmail(request.getParameter("email"));
                user.setPassword(request.getParameter("password"));
                user.setRole(request.getParameter("role"));
                if (Long.valueOf(request.getParameter("id")) != 0)
                    user.setId(Long.valueOf(request.getParameter("id")));

                if (userRepository.saveOrUpdateUser(user, true)) {
                    savePicture(request, user.getId());

                    UserModel model1 = new UserModel();
                    model1.setKeyWord("users");
                    List<User> users = userRepository.getAllUsers();
                    model1.setUsers(users);
                    request.setAttribute("modelUser", model1);
                    errorMessage = "Saved Successfully";
                    request.setAttribute("errorMessage", errorMessage);
                    request.getRequestDispatcher("views/listUsers.jsp").forward(request, response);
                }
                else {
                    errorMessage = "Error while Saving ";
                    request.setAttribute("errorMessage", errorMessage);
                    request.getRequestDispatcher("views/addUser.jsp").forward(request, response);
                }
            }
            //=========================================================================\\
            else if (Path.equalsIgnoreCase("/editUser.php")) {
                Long userID = Long.valueOf(request.getParameter("id"));
                User user = userRepository.getUser(userID);
                request.setAttribute("user", user);
                request.getRequestDispatcher("views/editUser.jsp").forward(request, response);
            }
            //=========================================================================\\
            else if (Path.equalsIgnoreCase("/deleteUser.php")) {
                Long userID = Long.valueOf(request.getParameter("id"));

                if (userRepository.deleteUser(userID)) {
                    errorMessage = "Deleted Successfully";
                    request.setAttribute("errorMessage", errorMessage);
                } else {
                    errorMessage = "Error while Deleting";
                    request.setAttribute("errorMessage", errorMessage);

                }
                UserModel model1 = new UserModel();
                model1.setKeyWord("users");
                List<User> users = userRepository.getAllUsers();
                model1.setUsers(users);
                request.setAttribute("modelUser", model1);
                request.getRequestDispatcher("views/listUsers.jsp").forward(request, response);
                //=========================================================================\\
            } else if (Path.equalsIgnoreCase("/register.php")) {
                request.getRequestDispatcher("views/register.jsp").forward(request, response);
                //=========================================================================\\
            }else if (Path.equalsIgnoreCase("/saveRegister.php")) {
                User user = new User();
                user.setFirstname(request.getParameter("firstname"));
                user.setLastname(request.getParameter("lastname"));
                user.setUsername(request.getParameter("username"));
                user.setEmail(request.getParameter("email"));
                user.setPassword(request.getParameter("password1"));
                user.setRole("CLIENT");

                if (userRepository.saveOrUpdateUser(user, true)) {
                    errorMessage = "Registered Successfully";
                    request.setAttribute("errorMessage", errorMessage);
                    request.getRequestDispatcher("views/login.jsp").forward(request, response);
                }
                else {
                    errorMessage = "Error While Registering";
                    request.setAttribute("errorMessage", errorMessage);
                    request.getRequestDispatcher("views/register.jsp").forward(request, response);
                }
                //=========================================================================\\
            } else if (Path.equalsIgnoreCase("/index.php")) {
                dothis(request, response);
                request.getRequestDispatcher("index.jsp").forward(request, response);
                //=========================================================================\\
            } else if (Path.equalsIgnoreCase("/editProfile.php")) {
//                User currentUser = UserRepositoryImp.currentUser;
                User currentUser = (User) request.getSession().getAttribute("loginedUser");
                System.out.println(currentUser);
                request.setAttribute("currentUser", currentUser);
                request.getRequestDispatcher("views/editProfile.jsp").forward(request, response);
                //=========================================================================\\
            } else if (Path.equalsIgnoreCase("/saveEditProfile.php")) {
                //User currentUser = UserRepositoryImp.currentUser;
                User currentUser = (User) request.getSession().getAttribute("loginedUser");
                boolean firstSave = false;
                if (request.getParameter("emailChange") != null){

                    if(!request.getParameter("oldEmail").equals(currentUser.getEmail())){
                        errorMessage = "The Old Email is Wrong";
                        request.setAttribute("errorMessage", errorMessage);
                        request.getRequestDispatcher("views/editProfile.jsp").forward(request, response);
                    }

                    if(!request.getParameter("email1").equals(request.getParameter("email2"))){
                        errorMessage = "The Emails Do Not Match";
                        request.setAttribute("errorMessage", errorMessage);
                        request.getRequestDispatcher("views/editProfile.jsp").forward(request, response);
                    }
                }

                if (request.getParameter("passwordChange") != null){

                    if(!request.getParameter("oldPassword").equals(currentUser.getPassword())){
                        errorMessage = "The Old Password is Wrong";
                        request.setAttribute("errorMessage", errorMessage);
                        request.getRequestDispatcher("views/editProfile.jsp").forward(request, response);
                    }

                    if(!request.getParameter("password1").equals(request.getParameter("password2"))){
                        errorMessage = "The Passwords Do Not Match";
                        request.setAttribute("errorMessage", errorMessage);
                        request.getRequestDispatcher("views/editProfile.jsp").forward(request, response);
                    }
                }
                currentUser.setFirstname(request.getParameter("firstname"));
                currentUser.setLastname(request.getParameter("lastname"));
                currentUser.setUsername(request.getParameter("username"));
                if (request.getParameter("emailChange") != null)
                    currentUser.setEmail(request.getParameter("email1"));
                if (request.getParameter("passwordChange") != null){
                    firstSave = true;
                    currentUser.setPassword(request.getParameter("password1"));
                }

                if (userRepository.saveOrUpdateUser(currentUser, firstSave)) {
                    savePicture(request, currentUser.getId());
                    AppUtils.storeLoginedUser(request.getSession(), currentUser);
//                    // Destroy the session
//                    request.getSession().invalidate();
//                    // Destroy the cookie
//                    AppUtils.removeCookie(response);

                    //UserRepositoryImp.currentUser = null;
                    String succMessage = "Registered Successfully";
                    request.setAttribute("succMessage", succMessage);
                    request.getRequestDispatcher("views/editProfile.jsp").forward(request, response);
                }else{
                    request.getRequestDispatcher("views/editProfile.jsp").forward(request, response);
                }
                //=========================================================================\\
            } else{
                request.getRequestDispatcher("404.jsp").forward(request, response);
            }
        }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }

    private void savePicture(HttpServletRequest request, Long id) throws ServletException, IOException {
        /*
         * The objective : store files in "/path-to-project-folder/src/main/webapp/upload/"
         * getServletContext().getRealPath("/") : return = /path-to-project-folder/target/RestaurentManagement-1.0-SNAPSHOT/
         * AppUtils.UPLOAD_DIRECTORY : return = /../../src/main/webapp/upload
         * the result :
         * /path-to-project-folder/target/RestaurentManagement-1.0-SNAPSHOT/../../src/main/webapp/upload = /path-to-project-folder/src/main/webapp/upload/
         * */
        String uploadPath = getServletContext().getRealPath("/") + AppUtils.UPLOAD_DIRECTORY_USER;
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdirs();

        // result ex : "id-PIC.png"

        String fileName, saveName;
        for (Part part : request.getParts()) {
            fileName = part.getSubmittedFileName();
            if (fileName != null && !fileName.equals("")){
                if (part.getName().equals("picture") && part.getSize() > 0){
                    saveName = id+"-PIC.png";
                    part.write(uploadPath + File.separator + saveName);
                }
            }
        }
    }


    public void dothis(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Restaurant> topFive = restaurantRepository.topWhat(3, restaurantRepository.getAllRestaurants());
        req.setAttribute("topFive", topFive);
        System.out.println(restaurantRepository.getAllRestaurants());
        System.out.println(topFive);
        User user = null;
        List<Restaurant> bookmarks = null;
        User currentUser = (User) req.getSession().getAttribute("loginedUser");
        if (currentUser != null) {
            bookmarks = new ArrayList<>();
            user = currentUser;
            if (!user.getBookmarks().isEmpty()) {
                for (Restaurant r : user.getBookmarks())
                    bookmarks.add(r);
            } else {
                bookmarks = null;
                System.out.println("Empty");
            }
        }
        req.setAttribute("bookmarks", bookmarks);
    }
}





