package com.tech.blog.dao;

import java.sql.*;
import com.tech.blog.entities.User;

public class UserDao {

    private Connection con;

    // Constructor to initialize the database connection
    public UserDao(Connection con) {
        this.con = con;
    }

    // Method to save user data to the database
    public boolean saveUser(User user) {
        boolean result = false; // Variable to hold the status of the operation

        try {
            String query = "INSERT INTO user(name, email, password, gender, about) VALUES(?, ?, ?, ?, ?)";
            PreparedStatement pstm = this.con.prepareStatement(query);
            pstm.setString(1, user.getName());
            pstm.setString(2, user.getEmail());
            pstm.setString(3, user.getPassword());
            pstm.setString(4, user.getGender());
            pstm.setString(5, user.getAbout());

            // Execute the query to insert data
            pstm.executeUpdate();
            result = true;
        } catch (Exception e) {
            e.printStackTrace(); // Print the exception details if any error occurs
        }
        return result; // Return whether the operation was successful or not
    }

    public User getEmailandPassword(String email, String password) {
        User user = null;

        try {
            String query = "SELECT * FROM user WHERE email = ? AND password = ?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, email);
            pstmt.setString(2, password);

            ResultSet set = pstmt.executeQuery();

            if (set.next()) {
                user = new User();

                // Fetching data from the database
                user.setId(set.getInt("id"));
                user.setName(set.getString("name"));
                user.setEmail(set.getString("email"));
                user.setPassword(set.getString("password"));
                user.setGender(set.getString("gender"));
                user.setAbout(set.getString("about"));
                user.setDateTime(set.getTimestamp("rdate"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

    public boolean updateUser(User user) {
        boolean f = false;
        try {
            String query = "UPDATE user SET name=?, email=?, password=?, gender=?, about=?, profile=? WHERE id=?";
            PreparedStatement p = con.prepareStatement(query);
            p.setString(1, user.getName());
            p.setString(2, user.getEmail());
            p.setString(3, user.getPassword());
            p.setString(4, user.getGender());
            p.setString(5, user.getAbout());
            p.setString(6, user.getProfile());
            p.setInt(7, user.getId());
            
            p.executeUpdate();
            f=true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return f;
    }
}
