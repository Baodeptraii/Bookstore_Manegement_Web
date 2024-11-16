package com.user.servlet;

import com.DAO.BookDAOImpl;
import com.DAO.CartDAOImpl;
import com.DB.DBConnect;
import com.entity.Book_data;
import com.entity.Cart;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int bid = Integer.parseInt(request.getParameter("bid"));
            int uid = Integer.parseInt(request.getParameter("uid"));

            BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
            Book_data book = dao.getBookById(bid);

            Cart c = new Cart();
            c.setBid(bid);
            c.setUid(uid);
            c.setBookName(book.getBookName());
            c.setAuthor(book.getAuthor());
            c.setPrice(Double.parseDouble(book.getPrice()));
            c.setTotal(Double.parseDouble(book.getPrice()));

            CartDAOImpl dao2 = new CartDAOImpl(DBConnect.getConn());
            boolean f = dao2.addCart(c);
            HttpSession session = request.getSession();
            if (f) {
                session.setAttribute("addCart", "Book added to cart successfully");
                response.sendRedirect("all_new_book.jsp");
            } else {
                session.setAttribute("errCart", "Something went wrong");
                response.sendRedirect("all_new_book.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
