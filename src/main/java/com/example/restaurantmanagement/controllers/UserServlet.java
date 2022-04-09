package com.example.restaurantmanagement.controllers;

import com.example.restaurantmanagement.entities.Review;
import com.example.restaurantmanagement.entities.User;
import com.example.restaurantmanagement.model.UserModel;
import com.example.restaurantmanagement.services.userRepositoryImp;
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
import java.util.List;

@MultipartConfig
@WebServlet(name="UserServlet", urlPatterns = "*.php")
public class UserServlet extends HttpServlet {
    userRepositoryImp userRepositoryImp;
    String errorMessage;

        public void init() {
            userRepositoryImp = new userRepositoryImp();
        }
        public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
            response.setContentType("text/html");
            String Path = request.getServletPath();
            //=========================================================================\\
            if (Path.equalsIgnoreCase("/listUsers.php")) {
                UserModel model1 = new UserModel();
                model1.setKeyWord("users");
                List<User> users = userRepositoryImp.getAllUsers();
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
                // TODO to be tested (first_time)
                boolean first_time;
                User user = new User();
                user.setFirstname(request.getParameter("firstname"));
                user.setLastname(request.getParameter("lastname"));
                user.setUsername(request.getParameter("username"));
                user.setEmail(request.getParameter("email"));
                user.setPassword(request.getParameter("password"));
                user.setRole(request.getParameter("role"));
                if (Long.valueOf(request.getParameter("id")) != 0)
                    user.setId(Long.valueOf(request.getParameter("id")));

                if (userRepositoryImp.saveOrUpdateUser(user, true)) {
                    savePicture(request, user.getId());

                    UserModel model1 = new UserModel();
                    model1.setKeyWord("users");
                    List<User> users = userRepositoryImp.getAllUsers();
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
                User user = userRepositoryImp.getUser(userID);
                request.setAttribute("user", user);
                request.getRequestDispatcher("views/editUser.jsp").forward(request, response);
            }
            //=========================================================================\\
            else if (Path.equalsIgnoreCase("/deleteUser.php")) {
                Long userID = Long.valueOf(request.getParameter("id"));

                if (userRepositoryImp.deleteUser(userID)) {
                    errorMessage = "Deleted Successfully";
                    request.setAttribute("errorMessage", errorMessage);
                } else {
                    errorMessage = "Error while Deleting";
                    request.setAttribute("errorMessage", errorMessage);

                }
                UserModel model1 = new UserModel();
                model1.setKeyWord("users");
                List<User> users = userRepositoryImp.getAllUsers();
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

                if (userRepositoryImp.saveOrUpdateUser(user, true)) {
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
                request.getRequestDispatcher("index.jsp").forward(request, response);
                //=========================================================================\\
            }else{
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
            if (fileName != null){
                if (part.getName().equals("picture")){
                    saveName = id+"-PIC.png";
                    part.write(uploadPath + File.separator + saveName);
                }
            }
        }
    }
}





