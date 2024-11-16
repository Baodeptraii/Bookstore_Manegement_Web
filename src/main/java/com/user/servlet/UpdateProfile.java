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
@WebServlet("/update_profile")
public class UpdateProfile extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("fname");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String password = request.getParameter("password");

            // Validate inputs here

            User user = new User();
            user.setId(id);
            user.setUsername(name);
            user.setEmail(email);
            user.setPhone(phone);

            UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());
            boolean isPasswordCorrect = dao.checkPassword(id, password);

            if (isPasswordCorrect) {
                boolean isUpdated = dao.updateUser(user);
                if (isUpdated) {
                    session.setAttribute("succMsg", "Profile Updated Successfully");
                } else {
                    session.setAttribute("errMsg", "Something went wrong on server");
                }
            } else {
                session.setAttribute("errMsg", "Password is incorrect");
            }
            response.sendRedirect("edit_profile.jsp");

        } catch (NumberFormatException e) {
            session.setAttribute("errMsg", "Invalid user ID format");
            response.sendRedirect("edit_profile.jsp");
        } catch (Exception e) {
            session.setAttribute("errMsg", "An unexpected error occurred");
            e.printStackTrace();
            response.sendRedirect("edit_profile.jsp");
        }
    }
}
