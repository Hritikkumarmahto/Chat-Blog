package com.tech.blog.helper;

import java.sql.*;
public class connectionProvider {

    private static Connection con;

    public static Connection getConnection() {

        try {
            if (con == null) {
//                Class.forName("com.mysql.jdbc.Driver");
//                con = DriverManager.getConnection("jdbc:mysql://localhost:3606/techblog", "root", "Hritik@1234");
                Class.forName("com.mysql.cj.jdbc.Driver");

                String url = "jdbc:mysql://localhost:3306/techblog";
                String userName = "root"; 
                String passWord = "Hritik@1234";

                con = DriverManager.getConnection(url, userName, passWord);
              
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return con;
    }
}
