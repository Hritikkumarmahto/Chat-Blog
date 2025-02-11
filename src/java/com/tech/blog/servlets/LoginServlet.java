package com.tech.blog.servlets;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.connectionProvider;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");

        // Fetching user login details
        String userEmail = request.getParameter("email");
        String userPassword = request.getParameter("password");

        // Checking if fields are empty
        if (userEmail == null || userEmail.trim().isEmpty() || userPassword == null || userPassword.trim().isEmpty()) {
            response.getWriter().write("Email and password cannot be empty!");
            return;
        }

        // Creating DAO object to validate login credentials
        UserDao dao = new UserDao(connectionProvider.getConnection());
        User u = dao.getEmailandPassword(userEmail, userPassword);

        if (u == null) {
             // response.getWriter().write("Invalid email or password!");
            Message msg=new Message("Invailed Details!","error","alert-danger");
          
           
           HttpSession s=request.getSession();
           s.setAttribute("msg",msg);
           response.sendRedirect("login_page.jsp");
        } else {
            // Create session and redirect to profile page
            HttpSession session = request.getSession();
            session.setAttribute("currentUser", u);
            response.sendRedirect("profile.jsp"); // Redirect to profile page
        }
    }
}
