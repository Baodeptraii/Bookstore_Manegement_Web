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

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {

            String name = request.getParameter("fname");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String password = request.getParameter("password");
            String check = request.getParameter("check");


            User us = new User();
            us.setUsername(name);
            us.setEmail(email);
            us.setPhone(phone);
            us.setPassword(password);

            HttpSession session = request.getSession();

            if (check != null) {
                UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());

                boolean f = dao.userRegister(us);

                if (f) {
                    session.setAttribute("succMsg", "Registration Successful");
                    response.sendRedirect("register.jsp");

                } else {
                    session.setAttribute("errMsg", "Something went wrong on server");
                    response.sendRedirect("register.jsp");

                }
            } else {
                session.setAttribute("errMsg", "You have not agreed to terms and conditions");
                response.sendRedirect("register.jsp");
            }


        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
