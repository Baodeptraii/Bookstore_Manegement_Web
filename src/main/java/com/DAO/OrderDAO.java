package com.DAO;

import com.entity.Order;

import java.util.List;

public interface OrderDAO {

    public boolean saveOrder(List<Order> order);

    public List<Order> getOrder();

    public Order getOrderAddress( String username);

    public boolean deleteOrder(String id);

    public List<Order> searchOrder(String search);

    public List<Order> getOrderByEmail(String email);
}
