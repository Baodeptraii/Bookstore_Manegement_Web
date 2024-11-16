package com.user.servlet;

import com.DAO.BookDAO;
import com.DAO.BookDAOImpl;
import com.DB.DBConnect;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/delete_old_book")
public class DeleteOldBook extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String em = request.getParameter("em");
        int id = Integer.parseInt(request.getParameter("id"));
        BookDAOImpl bookDAO = new BookDAOImpl(DBConnect.getConn());
        boolean f = bookDAO.deleteOldBook(em, "Old", id);
        HttpSession session = request.getSession();

        if (f) {
            session.setAttribute("succMsg", "Book Deleted Successfully");
            response.sendRedirect("old_book.jsp");
        } else {
            session.setAttribute("errMsg", "Something went wrong on server");
            response.sendRedirect("old_book.jsp");
        }
    }
}
