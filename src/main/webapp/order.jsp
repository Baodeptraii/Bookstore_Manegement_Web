<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@ page import="com.DAO.BookDAOImpl, com.DAO.CartDAOImpl, com.DB.DBConnect, java.util.*, java.sql.Connection, com.entity.Book_data, com.entity.User, com.entity.Cart, com.entity.Order, com.DAO.CartDAO, com.DAO.OrderDAO, com.DAO.OrderDAOImpl" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Confirmation</title>
    <%@ include file="all_component/allCss.jsp" %>
    <style>
        body {
            background-color: #f3f4f6;
        }
        .container {
            max-width: 750px;
            margin: auto;
            padding: 30px;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }
        .thank-you-icon {
            color: #28a745;
            font-size: 70px;
        }
        .thank-you-message {
            font-size: 26px;
            font-weight: bold;
            color: #333;
            margin-top: 15px;
        }
        .summary-message {
            font-size: 16px;
            color: #555;
            margin: 15px 0 30px;
        }
        .order-details {
            padding: 20px;
            background-color: #f9f9f9;
            border-radius: 10px;
            margin-top: 20px;
        }
        .order-details h2 {
            font-size: 20px;
            color: #333;
            border-bottom: 2px solid #eee;
            padding-bottom: 10px;
        }
        .order-info, .address-info {
            margin-top: 15px;
            font-size: 16px;
            color: #555;
            text-align: left;
        }
        .order-info p, .address-info p {
            margin: 8px 0;
        }
        .order-info strong, .address-info strong {
            color: #333;
        }
        .back-home-btn {
            display: inline-block;
            padding: 10px 20px;
            margin-top: 25px;
            background-color: #dc3545;
            color: #ffffff;
            border-radius: 5px;
            text-decoration: none;
            transition: background-color 0.3s;
        }
        .back-home-btn:hover {
            background-color: #c82333;
            color: #ffffff;
        }
    </style>
</head>

<body>
    <%@ include file="all_component/navbar.jsp" %>
    <%
        User u = (User) session.getAttribute("userobj");
        OrderDAOImpl dao = new OrderDAOImpl(DBConnect.getConn());
        Order o = dao.getOrderAddress(u.getUsername());
    %>
    <c:if test="${empty userobj}">
        <c:redirect url="login.jsp"/>
    </c:if>

    <div class="container text-center ">
        <i class="fas fa-check-circle thank-you-icon"></i>
        <h1 class="thank-you-message">Thank You for Your Order!</h1>
        <p class="summary-message">
            Your order has been placed successfully and will be delivered to your address shortly.
            Please keep your phone handy.
        </p>

        <!-- User Info -->
        <div class="order-details">
            <h2>Your Order Summary</h2>
            <div class="address-info">
                <p><strong>Recipient:</strong> <%= u.getUsername() %></p>
                <p><strong>Address:</strong> <%= o.getAddress() %></p>
                <p><strong>Email:</strong> <%= u.getEmail() %></p>
                <p><strong>Phone:</strong> <%= u.getPhone() %></p>
            </div>
        </div>

        <p> Please check your email for the order confirmation.</p>
        <p> For any queries, please contact us at <strong>
            <a href="mailto: admin@gmail.com"> admin@gmail.com
            </p>
        </strong>


        <a href="index.jsp" class="btn btn-danger">Back to Home</a>
        <a href="check_order.jsp" class="btn btn-success">Check my order</a>
    </div>

    <div style="margin-top: 50px;">
        <%@ include file="all_component/footer.jsp" %>
    </div>
</body>

</html>
