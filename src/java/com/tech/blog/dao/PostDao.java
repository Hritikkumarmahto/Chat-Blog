package com.tech.blog.dao;

import com.tech.blog.entities.Category;
import java.sql.*;
import java.util.ArrayList;

public class PostDao {

    Connection con;

    public PostDao(Connection con) {
        this.con = con;
    }

    public ArrayList<Category> getAllCategories() {
        ArrayList<Category> list = new ArrayList<>();

        try {
            String q = "SELECT * FROM categories";
            Statement st = this.con.createStatement(); // Ensure 'this.con' is a valid Connection object
            ResultSet set = st.executeQuery(q);
           while(set.next()){
               int cid=set.getInt("cid");
               String name=set.getString("name");
               String description=set.getString("description");
               Category c=new Category(cid,name,description);
               list.add(c);
           }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

}
    