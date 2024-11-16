package com.DAO;

import com.entity.Cart;

import java.util.List;

public interface CartDAO {
    public boolean addCart(Cart c);

    public List<Cart> getBookByUser(int user_id);

    public boolean deleteBook(int bid, int uid, int cid);

    public boolean deleteAllBook(int uid);
}
