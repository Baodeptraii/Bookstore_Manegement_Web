package com.admin.servlet;

import com.DAO.BookDAOImpl;
import com.DB.DBConnect;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/delete_book")
public class BooksDelete extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
            boolean f = dao.deleteBook(id);
            HttpSession session = request.getSession();
            if (f) {
                session.setAttribute("succMsg", "Book Deleted Successfully");
                response.sendRedirect("admin/all_book.jsp");
            } else {
                session.setAttribute("errMsg", "Something went wrong on server");
                response.sendRedirect("admin/all_book.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
