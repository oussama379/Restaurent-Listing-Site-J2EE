package com.example.restaurentmanagement.controllers;

import com.example.restaurentmanagement.entities.User;
import com.example.restaurentmanagement.model.UserModel;
import com.example.restaurentmanagement.services.userRepositoryImp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name="MainServlet", urlPatterns = "*.php")
public class MainServlet extends HttpServlet {
    userRepositoryImp userRepositoryImp;

        public void init() {
            userRepositoryImp = new userRepositoryImp();
        }
        public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
            response.setContentType("text/html");
            String Path = request.getServletPath();
            if (Path.equalsIgnoreCase("/listUsers.php")) {
                UserModel model = new UserModel();
                model.setKeyWord("users");
                List<User> users = userRepositoryImp.getAllUsers();
                model.setUsers(users);
                request.setAttribute("modelUser", model);
                request.getRequestDispatcher("views/tables.jsp").forward(request, response);
            }
            if (Path.equalsIgnoreCase("/addUsers.php")) {
                request.getRequestDispatcher("views/add-listing.jsp").forward(request, response);
            }
            if (Path.equalsIgnoreCase("/saveUser.php")) {
                 User user = new User();
                user.setFirstname(request.getParameter("firstname"));
                user.setLastname(request.getParameter("lastname"));
                user.setUsername(request.getParameter("username"));
                user.setEmail(request.getParameter("email"));
                user.setPassword(request.getParameter("password"));
                user.setRole(request.getParameter("role"));
                userRepositoryImp.saveOrUpdateUser(user);
                System.out.println(user);
                request.getRequestDispatcher("views/confirmation.jsp").forward(request, response);
            }
        }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }

    public void destroy() {
        }
    }





