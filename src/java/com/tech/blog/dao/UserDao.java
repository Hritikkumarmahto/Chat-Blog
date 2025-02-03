package com.tech.blog.dao;

import java.sql.*;
import com.tech.blog.entities.User;

public class UserDao {

    private Connection con;

    public UserDao(Connection con) {
        this.con = con;
    }

    public void saveUser(User user) {
        try {

            // user --> database connectin
            boolean f = false;
            String query = "insert into user(name,email,password,gender,about) values(?,?,?,?,?)";

            PreparedStatement pstm = this.con.prepareStatement(query);
            pstm.setString(1, user.getName());
            pstm.setString(2, user.getEmail());
            pstm.setString(3, user.getPassword());
            pstm.setString(4, user.getGender());
            pstm.setString(5, user.getAbout());

            pstm.executeUpdate();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
