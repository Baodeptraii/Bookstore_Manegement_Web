package com.admin.servlet;

import com.DAO.OrderDAOImpl;
import com.DB.DBConnect;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/delete_order")
public class OrderRemove extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String id = req.getParameter("id");
            OrderDAOImpl dao = new OrderDAOImpl(DBConnect.getConn());
            boolean f = dao.deleteOrder(id);
            HttpSession session = req.getSession();
            if (f) {
                session.setAttribute("succMsg", "Order Deleted Successfully");
                resp.sendRedirect("admin/orders.jsp");
            } else {
                session.setAttribute("errMsg", "Something went wrong on server");
                resp.sendRedirect("admin/orders.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
