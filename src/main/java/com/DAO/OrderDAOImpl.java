package com.DAO;

import com.entity.Order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class OrderDAOImpl implements OrderDAO {
    private Connection conn;

    public OrderDAOImpl(Connection conn) {
        this.conn = conn;
    }


    @Override
    public boolean saveOrder(List<Order> order) {
        boolean f = false;
        PreparedStatement ps = null;

        try {
            String query = "INSERT INTO `order` (order_id, username, email, address, phone, bookname, author, price) VALUES(?,?,?,?,?,?,?,?)";
            conn.setAutoCommit(false);  // Start transaction
            ps = conn.prepareStatement(query);

            for (Order o : order) {
                ps.setString(1, o.getOrder_id());
                ps.setString(2, o.getName());
                ps.setString(3, o.getEmail());
                ps.setString(4, o.getAddress());
                ps.setString(5, o.getPhone());
                ps.setString(6, o.getBookname());
                ps.setString(7, o.getAuthor());
                ps.setString(8, o.getPrice());
                ps.addBatch();
            }

            int[] count = ps.executeBatch();
            conn.commit();  // Commit transaction
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
            try {
                if (conn != null) conn.rollback();  // Rollback transaction on failure
            } catch (Exception rollbackEx) {
                rollbackEx.printStackTrace();
            }
        } finally {
            try {
                if (ps != null) ps.close();
                if (conn != null) conn.setAutoCommit(true);  // Restore auto-commit mode
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
        return f;
    }

    @Override
    public List<Order> getOrder() {
        List<Order> list = new ArrayList<Order>();
        Order o = null;
        try {

            String sql = "SELECT * FROM `order`";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                o = new Order();
                o.setOrder_id(rs.getString("order_id"));
                o.setName(rs.getString("username"));
                o.setEmail(rs.getString("email"));
                o.setAddress(rs.getString("address"));
                o.setPhone(rs.getString("phone"));
                o.setBookname(rs.getString("bookname"));
                o.setAuthor(rs.getString("author"));
                o.setPrice(rs.getString("price"));
                list.add(o);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;

    }

    @Override
    public Order getOrderAddress(String username) {

        Order o = null;
        try {

            String sql = "SELECT address FROM `order` WHERE username=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                o = new Order();
                o.setAddress(rs.getString("address"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return o;
    }

    @Override
    public boolean deleteOrder(String id) {

        boolean f = false;
        try {
            String sql = "DELETE FROM `order` WHERE order_id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, id);
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
    public List<Order> searchOrder(String search) {

        List<Order> list = new ArrayList<Order>();
        Order o = null;
        try {

            String sql = "SELECT * FROM `order` WHERE order_id like ? or username like ? or email like ? or address like ? or phone like ? or bookname like ? or author like ? or price like ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + search + "%");
            ps.setString(2, "%" + search + "%");
            ps.setString(3, "%" + search + "%");
            ps.setString(4, "%" + search + "%");
            ps.setString(5, "%" + search + "%");
            ps.setString(6, "%" + search + "%");
            ps.setString(7, "%" + search + "%");
            ps.setString(8, "%" + search + "%");


            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                o = new Order();
                o.setOrder_id(rs.getString("order_id"));
                o.setName(rs.getString("username"));
                o.setEmail(rs.getString("email"));
                o.setAddress(rs.getString("address"));
                o.setPhone(rs.getString("phone"));
                o.setBookname(rs.getString("bookname"));
                o.setAuthor(rs.getString("author"));
                o.setPrice(rs.getString("price"));
                list.add(o);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;


    }

    @Override
    public List<Order> getOrderByEmail(String email) {
        List<Order> list = new ArrayList<Order>();
        Order o = null;
        try {

            String sql = "SELECT * FROM `order` WHERE email=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                o = new Order();
                o.setOrder_id(rs.getString("order_id"));
                o.setName(rs.getString("username"));
                o.setEmail(rs.getString("email"));
                o.setAddress(rs.getString("address"));
                o.setPhone(rs.getString("phone"));
                o.setBookname(rs.getString("bookname"));
                o.setAuthor(rs.getString("author"));
                o.setPrice(rs.getString("price"));
                list.add(o);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }


        return list;


    }

}
