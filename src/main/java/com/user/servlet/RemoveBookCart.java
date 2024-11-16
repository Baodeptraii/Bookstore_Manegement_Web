package com.user.servlet;

import com.DAO.CartDAOImpl;
import com.DB.DBConnect;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/remove_book")
public class RemoveBookCart extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        int bid = Integer.parseInt(request.getParameter("bid"));
        int uid = Integer.parseInt(request.getParameter("uid"));
        int cid = Integer.parseInt(request.getParameter("cid"));
        CartDAOImpl dao = new CartDAOImpl(DBConnect.getConn());
        boolean f = dao.deleteBook(bid, uid, cid);
        HttpSession session = request.getSession();

        if (f) {
            session.setAttribute("succMsg", "Book removed from cart successfully");
            response.sendRedirect("cart.jsp");
        } else {
            session.setAttribute("errMsg", "Something went wrong");
            response.sendRedirect("cart.jsp");
        }


    }
}
