<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@ page import="com.DAO.OrderDAOImpl" %>
<%@ page import="com.DB.DBConnect" %>
<%@ page import="java.util.*" %>
<%@ page import="com.entity.Order" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin: Orders</title>
    <%@ include file="allCss.jsp" %>
    <style>
        body {
            background-color: #f0f2f2;
        }
        .container {
            max-width: 1600px;
            margin: auto;
            padding: 20px;
        }
        .table {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .table th {
            background-color: #007bff;
            color: white;
            font-weight: bold;
            text-align: center;
        }
        .table td, .table th {
            text-align: center;
            vertical-align: middle;
        }
        .text-center {
            margin-top: 5px;
            font-size: 1.5rem;
        }
    </style>
</head>

<body>
    <%@ include file="navbar.jsp" %>

    <c:if test="${empty userobj}">
        <c:redirect url="../login.jsp"/>
    </c:if>

    <c:if test="${not empty succMsg}">
        <div class="alert alert-success alert-dismissible fade show text-center" role="alert">
            ${succMsg}
        </div>
        <c:remove var="succMsg" scope="session"/>
    </c:if>

    <c:if test="${not empty errMsg}">
        <div class="alert alert-danger alert-dismissible fade show text-center" role="alert">
            ${errMsg}
        </div>
        <c:remove var="errMsg" scope="session"/>
    </c:if>

    <div class="container">
        <h2 class="text-center mb-4">All Orders</h2>

        <table class="table table-striped table-hover">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Address</th>
                    <th>Phone Number</th>
                    <th>Book Name</th>
                    <th>Author</th>
                    <th>Price</th>
                    <th>Action</th>
                </tr>
            </thead>

            <tbody>
                <%
                    OrderDAOImpl dao = new OrderDAOImpl(DBConnect.getConn());
                    List<Order> list = dao.getOrder();
                    for(Order order : list) {
                %>
                <tr>
                    <td><%=order.getOrder_id() %></td>
                    <td><%=order.getName() %></td>
                    <td><%=order.getEmail() %></td>
                    <td><%=order.getAddress() %></td>
                    <td><%=order.getPhone() %></td>
                    <td><%=order.getBookname() %></td>
                    <td><%=order.getAuthor() %></td>
                    <td>$<%=order.getPrice() %></td>
                    <td>
                        <a href="../delete_order?id=<%=order.getOrder_id() %>" class="btn btn-danger">Remove</a>
                    </tr>
                <% } %>
            </tbody>
        </table>
    </div>

    <%@ include file="footer.jsp" %>
</body>

</html>
