package com.tech.blog.servlets;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.User;
import com.tech.blog.helper.connectionProvider;
import javax.servlet.annotation.MultipartConfig;  // Import this

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@MultipartConfig

public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {

            // Fetching all the data
            String check = request.getParameter("check");

            if (check == null) {
                out.println("Accept terms and conditions");
                return;
            }

            String name = request.getParameter("user_name");
            String email = request.getParameter("user_email");
            String password = request.getParameter("user_password");
            String gender = request.getParameter("gender");
            String about = request.getParameter("about");

            // Creating user object
            User user = new User(name, email, password, gender, about);

            // Saving user to database
            UserDao dao = new UserDao(connectionProvider.getConnection());

            if (dao.saveUser(user)) {
                out.println("done");
            } else {
                out.println("Ohh ! Ohh ! You missed somthing please check again");
            }
        }
    }
}