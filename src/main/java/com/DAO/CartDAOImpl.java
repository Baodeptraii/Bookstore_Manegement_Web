package com.DAO;

import com.entity.Cart;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CartDAOImpl implements CartDAO {

    private Connection conn;

    public CartDAOImpl(Connection conn) {
        this.conn = conn;
    }


    @Override
    public boolean addCart(Cart c) {

        boolean f = false;

        try {
            String query = "insert into cart(bid, uid, bookName, author, price, total) values(?,?,?,?,?,?)";
            PreparedStatement ps = this.conn.prepareStatement(query);
            ps.setInt(1, c.getBid());
            ps.setInt(2, c.getUid());
            ps.setString(3, c.getBookName());
            ps.setString(4, c.getAuthor());
            ps.setDouble(5, c.getPrice());
            ps.setDouble(6, c.getTotal());

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
    public List<Cart> getBookByUser(int user_id) {
        List<Cart> list = new ArrayList<Cart>();
        Cart c = null;
        double total = 0;

        try {
            String query = "select * from cart where uid=?";
            PreparedStatement ps = this.conn.prepareStatement(query);
            ps.setInt(1, user_id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                c = new Cart();
                c.setCid(rs.getInt("cid"));
                c.setBid(rs.getInt("bid"));
                c.setUid(rs.getInt("uid"));
                c.setBookName(rs.getString("bookName"));
                c.setAuthor(rs.getString("author"));
                c.setPrice(rs.getDouble("price"));
                total = total + rs.getDouble("price");
                c.setTotal(total);

                list.add(c);
            }


        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;

    }

    @Override
    public boolean deleteBook(int bid, int uid, int cid) {

        boolean f = false;

        try {

            String query = "delete from cart where bid=? and uid=? and cid=?";
            PreparedStatement ps = this.conn.prepareStatement(query);
            ps.setInt(1, bid);
            ps.setInt(2, uid);
            ps.setInt(3, cid);

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
    public boolean deleteAllBook(int uid) {
        boolean f = false;

        try {
            String query = "delete from cart where uid=?";
            PreparedStatement ps = this.conn.prepareStatement(query);
            ps.setInt(1, uid);
            int i = ps.executeUpdate();
            if (i >= 1) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
}
