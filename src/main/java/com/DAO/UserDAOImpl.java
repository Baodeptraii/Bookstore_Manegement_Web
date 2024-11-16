package com.DAO;

import com.entity.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAOImpl implements UserDAO {
    private Connection conn;

    public UserDAOImpl(Connection conn) {
        this.conn = conn;
    }

    @Override
    public boolean userRegister(User us) {
        boolean f = false;

        try {

            PreparedStatement ps = conn.prepareStatement("insert into user(name, email, phone, password) values(?,?,?,?)");

            ps.setString(1, us.getUsername());
            ps.setString(2, us.getEmail());
            ps.setString(3, us.getPhone());
            ps.setString(4, us.getPassword());

            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    @Override
    public User login(String email, String password) {
        User us = null;


        try {

            PreparedStatement ps = conn.prepareStatement("select * from user where email=? and password=?");
            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                us = new User();
                us.setId(rs.getInt(1));
                us.setUsername(rs.getString(2));
                us.setEmail(rs.getString(3));
                us.setPhone(rs.getString(4));
                us.setPassword(rs.getString(5));
                us.setAddress(rs.getString(6));


            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return us;

    }

    @Override
    public boolean checkPassword(int id, String ps) {
        boolean f = false;

        try {
            PreparedStatement ps1 = conn.prepareStatement("select * from user where id=? and password=?");
            ps1.setInt(1, id);
            ps1.setString(2, ps);

            ResultSet rs = ps1.executeQuery();
            while (rs.next()) {
                f = true;
            }


        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    @Override
    public boolean updateUser(User us) {
        boolean f = false;

        try {
            PreparedStatement ps = conn.prepareStatement("update user set name=?, email=?, phone=? where id=?");

            ps.setString(1, us.getUsername());
            ps.setString(2, us.getEmail());
            ps.setString(3, us.getPhone());
            ps.setInt(4, us.getId());

            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }
}
