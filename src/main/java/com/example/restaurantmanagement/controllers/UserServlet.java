package com.example.restaurantmanagement.controllers;

import com.example.restaurantmanagement.entities.User;
import com.example.restaurantmanagement.model.UserModel;
import com.example.restaurantmanagement.services.userRepositoryImp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

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
                User user = new User();
                user.setFirstname(request.getParameter("firstname"));
                user.setLastname(request.getParameter("lastname"));
                user.setUsername(request.getParameter("username"));
                user.setEmail(request.getParameter("email"));
                user.setPassword(request.getParameter("password"));
                user.setRole(request.getParameter("role"));
                if (Long.valueOf(request.getParameter("id")) != 0)
                    user.setId(Long.valueOf(request.getParameter("id")));

                if (userRepositoryImp.saveOrUpdateUser(user)) {
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

                if (userRepositoryImp.saveOrUpdateUser(user)) {
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

    public void destroy() {
        }
    }





