package com.admin.servlet;

import com.DAO.BookDAOImpl;
import com.DB.DBConnect;
import com.entity.Book_data;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;

@WebServlet("/add_books")
@MultipartConfig
public class BooksAdd extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String bookName = request.getParameter("book");
            String author = request.getParameter("author");
            String price = request.getParameter("price");
            String category = request.getParameter("category");
            String status = request.getParameter("status");
            Part part = request.getPart("bimg");
            String photo = part.getSubmittedFileName();

            Book_data book_data = new Book_data(bookName, author, price, category, status, photo, "admin");

            BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());

            boolean f = dao.addBook(book_data);

            HttpSession session = request.getSession();

            if (f) {

                String path = getServletContext().getRealPath("") + "book";
                File file = new File(path);
                part.write(path + File.separator + photo);


                session.setAttribute("succMsg", "Book Added Successfully");
                response.sendRedirect("admin/add_book.jsp");
            } else {
                session.setAttribute("errMsg", "Something went wrong on server");
                response.sendRedirect("admin/add_book.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
