package com.user.servlet;

import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());

            HttpSession session = request.getSession();

            if ("admin@gmail.com".equals(email) && "admin".equals(password)) {
                User us = new User();
                // Assuming you want to set attributes for the admin user
                us.setEmail(email);
                us.setUsername("Admin"); // Set a username or other attributes as necessary
                session.setAttribute("userobj", us); // Set the actual User object, not a String
                response.sendRedirect("admin/home.jsp");
            } else {
                User us = dao.login(email, password);
                if (us != null) {
                    session.setAttribute("userobj", us);
                    response.sendRedirect("index.jsp");
                } else {
                    session.setAttribute("errMsg", "Email or Password is incorrect");
                    response.sendRedirect("login.jsp");
                }
            }



        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
