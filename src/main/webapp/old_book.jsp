<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@ page import="com.DAO.BookDAOImpl, com.DAO.CartDAOImpl, com.DB.DBConnect, java.util.*, com.entity.Book_data, java.sql.Connection, com.entity.User, com.entity.Cart, com.DAO.CartDAO" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Old Book</title>
    <%@ include file="all_component/allCss.jsp" %>
    <style>
        body {
            background-color: #f0f1f2;
        }
        .container {
            max-width: 1200px;
            margin: auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .table thead {
            background-color: #007bff;
            color: #ffffff;
        }
        .table th, .table td {
            vertical-align: middle;
            text-align: center;
        }
        .table tbody tr:hover {
            background-color: #f8f9fa;
        }
        .book-image {
            width: 50px;
            height: 50px;
            border-radius: 5px;
            object-fit: cover;
        }
        .status-message {
            font-size: 16px;
            margin: 15px 0;
            padding: 10px;
            border-radius: 5px;
        }
        .text-success {
            background-color: #e9f6ec;
            color: #28a745;
        }
        .text-danger {
            background-color: #fbe4e4;
            color: #dc3545;
        }
        .btn-danger {
            background-color: #dc3545;
            color: #ffffff;
            transition: background-color 0.3s;
        }
        .btn-danger:hover {
            background-color: #c82333;
            color: #ffffff;
        }
        .delete-btn {
            padding: 5px 15px;
            font-size: 14px;
        }
    </style>
</head>
<body>

    <%@ include file="all_component/navbar.jsp" %>

    <div class="container">
        <!-- Display Success or Error Message -->
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

        <h2 class="text-center mb-4">Your Old Books</h2>

        <table class="table table-hover table-bordered">
            <thead>
                <tr>
                    <th scope="col">Image</th>
                    <th scope="col">Book Name</th>
                    <th scope="col">Author</th>
                    <th scope="col">Price</th>
                    <th scope="col">Action</th>
                </tr>
            </thead>
            <tbody>
                <%
                    User u = (User) session.getAttribute("userobj");
                    BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
                    List<Book_data> list = dao.getBookByOld(u.getEmail(), "Old");
                    for (Book_data book : list) {
                %>
                <tr>
                    <td><img src="book/<%= book.getPhoto() %>" class="book-image" alt="Book Image"></td>
                    <td><%= book.getBookName() %></td>
                    <td><%= book.getAuthor() %></td>
                    <td>$<%= book.getPrice() %></td>
                    <td>
                        <a href="delete_old_book?em=<%= u.getEmail() %>&&id=<%= book.getBookID() %>" class="btn btn-danger delete-btn">Delete</a>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>

    <%@ include file="all_component/footer.jsp" %>

</body>
</html>
