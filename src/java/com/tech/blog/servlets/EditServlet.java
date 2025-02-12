package com.tech.blog.servlets;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.connectionProvider;
import com.tech.blog.helper.Helper;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig
public class EditServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {
            // Fetching user details from the request
            String userEmail = request.getParameter("user-email");
            String userName = request.getParameter("user-name");
            String userPassword = request.getParameter("user-password");
            String userAbout = request.getParameter("user-about");

            // Fetching the profile picture part
            Part part = request.getPart("image");
            String imageName = part.getSubmittedFileName();

            // Retrieving the current user from the session
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("currentUser");

            // Updating user details
            user.setEmail(userEmail);
            user.setName(userName);
            user.setPassword(userPassword);
            user.setAbout(userAbout);

            // Handling profile picture update
            String oldFile = user.getProfile();

            if (imageName != null && !imageName.isEmpty()) {
                user.setProfile(imageName);
            }

            // Updating user in the database
            UserDao userDao = new UserDao(connectionProvider.getConnection());
            boolean isUpdated = userDao.updateUser(user);

            if (isUpdated) {
                // Define paths for the new and old profile pictures
                String uploadPath = getServletContext().getRealPath("/") + "pics" + File.separator;
                String newFilePath = uploadPath + user.getProfile();
                String oldFilePath = uploadPath + oldFile;

                // Delete the old profile picture if it's not the default
                if (!"default.png".equals(oldFile) && (imageName != null && !imageName.isEmpty())) {
                    Helper.deleteFile(oldFilePath);
                }

                // Save the new profile picture
                if (imageName != null && !imageName.isEmpty()) {
                    try (InputStream is = part.getInputStream()) {
                        Helper.saveFile(is, newFilePath);
                    }
                }

                // Set success message and redirect to profile page
                Message msg = new Message("Profile updated successfully!", "success", "alert-success");
                session.setAttribute("msg", msg);
                response.sendRedirect("profile.jsp");
            } else {
                // Set error message
                Message msg = new Message("Something went wrong!", "error", "alert-danger");
                session.setAttribute("msg", msg);
                response.sendRedirect("edit_profile.jsp");
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "EditServlet handles user profile updates.";
    }
}
