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
            result=true;
        } catch (Exception e) {
            e.printStackTrace(); // Print the exception details if any error occurs
        }
        return result; // Return whether the operation was successful or not
    }
}
