package com.user.servlet;

import com.DAO.CartDAOImpl;
import com.DAO.OrderDAOImpl;
import com.DB.DBConnect;
import com.entity.Cart;
import com.entity.Order;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

@WebServlet("/order")
public class OrderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String address = request.getParameter("address");
            String phone = request.getParameter("phone");
            int id = Integer.parseInt(request.getParameter("id"));

            CartDAOImpl dao = new CartDAOImpl(DBConnect.getConn());

            List<Cart> list = dao.getBookByUser(id);
            HttpSession session = request.getSession();

            if (list.isEmpty()) {
                session.setAttribute("errMsg", "Your cart is empty!");
                response.sendRedirect("cart.jsp");
            } else {
                OrderDAOImpl dao2 = new OrderDAOImpl(DBConnect.getConn());

                ArrayList<Order> orderList = new ArrayList<Order>();


                Order order = null;
                session.setAttribute("order", order);
                Random r = new Random();
                for (Cart c : list) {
                    order = new Order();
                    order.setOrder_id("BOOK-ORD-00" + r.nextInt(1000));
                    order.setName(name);
                    order.setEmail(email);
                    order.setAddress(address);
                    order.setPhone(phone);
                    order.setBookname(c.getBookName());
                    order.setAuthor(c.getAuthor());
                    order.setPrice(c.getPrice() + " ");
                    orderList.add(order);

                }


                boolean isOrderSaved = dao2.saveOrder(orderList);

                if (isOrderSaved) {

                    boolean isCartDeleted = dao.deleteAllBook(id);

                    if (isCartDeleted) {
                        System.out.println("Cart deleted successfully after order.");
                    } else {
                        System.out.println("Failed to delete cart after order.");
                    }

                    response.sendRedirect("order.jsp");
                } else {
                    session.setAttribute("errMsg", "Something went wrong!");
                    response.sendRedirect("cart.jsp");
                }
            }


        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
