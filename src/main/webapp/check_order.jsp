<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@ page import="com.DAO.BookDAOImpl, com.DAO.CartDAOImpl, com.DB.DBConnect, java.util.*, java.sql.Connection, com.entity.Book_data, com.entity.User, com.entity.Cart, com.entity.Order, com.DAO.CartDAO, com.DAO.OrderDAO, com.DAO.OrderDAOImpl" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Check order</title>
    <%@ include file="all_component/allCss.jsp" %>
    <style>
        /* Styles for the order page */
        .container {
            margin-top: 40px;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
        }
        h2 {
            color: #333333;
            font-weight: 600;
        }
        .table {
            margin-top: 20px;
            border: 1px solid #dee2e6;
        }
        .table thead th {
            background-color: #343a40;
            color: #ffffff;
            text-align: center;
            font-weight: 600;
        }
        .table-striped tbody tr:nth-of-type(odd) {
            background-color: #f2f2f2;
        }
        .table-hover tbody tr:hover {
            background-color: #e9ecef;
        }
        .table td, .table th {
            vertical-align: middle;
            text-align: center;
            padding: 12px;
        }
        footer {
            margin-top: 50px;
            padding: 15px 0;
            text-align: center;
            color: #777777;
            font-size: 0.9em;
            background-color: #343a40;
            color: #ffffff;
        }
    </style>
</head>
<body>
    <%@ include file="all_component/navbar.jsp" %>

    <%
        User u = (User) session.getAttribute("userobj");
        if (u == null) {
            response.sendRedirect("login.jsp");
            return;
        }
    %>

    <div class="container">
        <h2 class="text-center mb-4">All your orders</h2>

        <table class="table table-striped table-hover">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Address</th>
                    <th>Book Name</th>
                    <th>Author</th>
                    <th>Price</th>
                </tr>
            </thead>

            <tbody>
                <%
                    String userEmail = u.getEmail();
                    OrderDAOImpl dao = new OrderDAOImpl(DBConnect.getConn());
                    List<Order> list = dao.getOrderByEmail(userEmail);
                    double totalPrice = 0;
                    for (Order order : list) {
                        String priceStr = order.getPrice();
                        if (priceStr.startsWith("$")) {
                            priceStr = priceStr.substring(1); // Remove the dollar sign
                        }
                        try {
                            double price = Double.parseDouble(priceStr); // Convert to double
                            totalPrice += price;
                        } catch (NumberFormatException e) {
                            e.printStackTrace();
                            // Optionally handle invalid price format here
                        }
                %>
                <tr>
                    <td><%=order.getOrder_id() %></td>
                    <td><%=order.getAddress() %></td>
                    <td><%=order.getBookname() %></td>
                    <td><%=order.getAuthor() %></td>
                    <td>$<%=order.getPrice() %></td>

                </tr>
                <% } %>
            </tbody>
        </table>
    </div>


    <div class="text-center">
        <h3 class="text-center">Total Orders: <%=list.size() %></h3>
        <h3>Total Price: $<%= String.format("%.2f", totalPrice) %></h3>

        <p>Thank you for shopping with us.</p>
        <p>For any queries, please contact us at <strong>
            <a href="mailto: admin@gmail.com">admin@gmail.com</a>
        </strong></p>
    </div>
    <br>

    <div style="margin-top: 50px">
        <%@ include file="all_component/footer.jsp" %>
    </div>

</body>
</html>
