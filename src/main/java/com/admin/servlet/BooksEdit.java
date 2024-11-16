package com.admin.servlet;

import com.DAO.BookDAOImpl;
import com.DB.DBConnect;
import com.entity.Book_data;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/edit_books")
public class BooksEdit extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            String bookName = request.getParameter("book");
            String author = request.getParameter("author");
            String price = request.getParameter("price");
            String category = request.getParameter("category");
            String status = request.getParameter("status");


            Book_data b = new Book_data();
            b.setBookID(id);
            b.setBookName(bookName);
            b.setAuthor(author);
            b.setPrice(price);
            b.setCategory(category);
            b.setStatus(status);


            BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());

            boolean f = dao.updateBook(b);
            HttpSession session = request.getSession();

            if (f) {
                session.setAttribute("succMsg", "Book Updated Successfully");
                response.sendRedirect("admin/all_book.jsp?id=" + id);
            } else {
                session.setAttribute("errMsg", "Something went wrong on server");
                response.sendRedirect("admin/edit_book.jsp?id=" + id);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
