package com.DB;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {

    public static Connection conn;

    public static Connection getConn() {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/book_web", "root", "123456");
        } catch (Exception e) {
            System.out.println("Error connecting to database: " + e.getMessage());

            e.printStackTrace();
        }

        return conn;
    }

}

