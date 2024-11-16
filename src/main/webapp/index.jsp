<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@ page import="com.DAO.BookDAOImpl" %>
<%@ page import="com.DAO.CartDAOImpl" %>
<%@ page import="com.DB.DBConnect" %>
<%@ page import="java.util.*" %>
<%@ page import="com.entity.Book_data" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="com.entity.User" %>
<%@ page import="com.entity.Cart" %>
<%@ page import="com.DAO.CartDAO" %>

<!DOCTYPE html>
<html>

<head>
    <title>Bookstore</title>
    <%@ include file="all_component/allCss.jsp" %>
        <style>
            .back-img {
                background: url("img/book-bg.jpg");
                height: 35vh;
                width: 100%;
                background-size: cover;
                background-position: center;
                background-repeat: no-repeat;
                display: flex;
                align-items: center;
                justify-content: center;
                color: white;
                text-shadow: 3px 3px 0 black;
                font-size: 50px;

            }

            .card {
                border: 1px solid #ccc;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            .card-header {
                background-color: #f7f7f7;
                padding: 10px;
                border-bottom: 1px solid #ccc;
            }

            .card-body {
                padding: 10px;
            }
            .card:hover {
                background-color: #f0e9e4;
                transition: background-color 0.3s ease; /* Smooth transition effect */
            }

        </style>

</head>

<body style="background-color:#f7f7f7;" >

    <%
        User u =(User)session.getAttribute("userobj");
    %>


    <%@ include file="all_component/navbar.jsp" %>
        <div class="container-fluid back-img">
            <h2 class="text-center"
                style="color: white; text-shadow: 3px 3px 0 black, -3px -3px 0 black, 3px -3px 0 black, -3px 3px 0 black; font-size : 50px; padding-top : 50px">
                <i class="fa-solid fa-book"></i>
                Bookstore Management System
            </h2>
        </div>



<!-- Recent Book -->

        <div class="container mt-3">

            <h3 class="text-center"> Recent Book</h3>

            <div class="row">

                <%
                    Connection conn2 = DBConnect.getConn();
                    BookDAOImpl dao2 = new BookDAOImpl(conn2);
                    List<Book_data> list2 = dao2.getRecentBook();
                    for(Book_data book : list2) {
                %>
                    <div class="col-md-3">
                        <div class="card">
                            <div class="card-body text-center">
                                <img src="book/<%= book.getPhoto() %>" alt="" style="width: 150px; height: 200px;" class="img-thumblin">
                                <p style="font-size: 18px; font-weight: bold; margin-top: 5px"><%= book.getBookName() %></p>
                                <p>Author: <%= book.getAuthor() %></p>
                                <p>Categories: <%= book.getCategory() %></p>
                                <div class="row justify-content-center">

                                    <% if (!"Old".equals(book.getCategory())) { %>
                                        <% if (u != null) { %>
                                            <a href="cart?bid=<%=book.getBookID() %>&&uid=<%=u.getId()%>" class="btn btn-danger btn-sm ml-2">Add Cart</a>
                                        <% } else { %>
                                            <a href="login.jsp" class="btn btn-danger btn-sm ml-2">Add Cart</a>
                                        <% } %>
                                    <% } %>
                                    <a href="view_book.jsp?bid=<%=book.getBookID()%>" class="btn btn-success btn-sm ml-1">Details</a>
                                    <a href="#" class="btn btn-danger btn-sm ml-1"><%= book.getPrice() %> $</a>
                                </div>
                            </div>
                        </div>
                    </div>
                <%
                    }
                %>

            </div>

            <div class="text-center mt-3">
                <a href="all_recent_book.jsp" class="btn btn-danger btn-sm text-white">View All</a>
            </div>

        </div>
<!-- End Recent Book -->

<hr>

<!-- New Book -->

        <div class="container">

            <h3 class="text-center"> New Book</h3>

            <div class="row">
                <%
                    Connection conn = DBConnect.getConn();
                    BookDAOImpl dao = new BookDAOImpl(conn);
                    List<Book_data> list = dao.getNewBook();
                    for(Book_data book : list) {
                %>
                    <div class="col-md-3">
                        <div class="card">
                            <div class="card-body text-center">
                                <img src="book/<%= book.getPhoto() %>" alt="" style="width: 150px; height: 200px;" class="img-thumbnail">
                                <p style="font-size: 18px; font-weight: bold; margin-top: 5px"><%= book.getBookName() %></p>
                                <p>Author: <%= book.getAuthor() %></p>
                                <p>Categories: <%= book.getCategory() %></p>
                                <div class="row justify-content-center">

                                    <% if (!"Old".equals(book.getCategory())) { %>
                                        <% if (u != null) { %>
                                            <a href="cart?bid=<%=book.getBookID() %>&&uid=<%=u.getId()%>" class="btn btn-danger btn-sm ml-2">Add Cart</a>
                                        <% } else { %>
                                            <a href="login.jsp" class="btn btn-danger btn-sm ml-2">Add Cart</a>
                                        <% } %>
                                    <% } %>
                                    <a href="view_book.jsp?bid=<%=book.getBookID()%>" class="btn btn-success btn-sm ml-1">Details</a>
                                    <a href="#" class="btn btn-danger btn-sm ml-1"><%= book.getPrice() %> $</a>
                                </div>
                            </div>
                        </div>
                    </div>

                <%
                    }
                %>


            </div>

            <div class="text-center mt-3">
                <a href="all_new_book.jsp" class="btn btn-danger btn-sm text-white">View All</a>
            </div>

        </div>
<!-- End New Book -->

<hr>


<!-- Old Book -->

        <div class="container">

            <h3 class="text-center"> Old Book</h3>

            <div class="row">

                <%
                Connection conn1 = DBConnect.getConn();
                BookDAOImpl dao1 = new BookDAOImpl(conn1);
                List<Book_data> list1 = dao1.getOldBook();
                for(Book_data book : list1) {
                %>
                <div class="col-md-3">
                    <div class="card">
                        <div class="card-body text-center">
                            <img src="book/<%= book.getPhoto() %>" alt="" style="width: 150px; height: 200px;" class="img-thumblin">
                            <p style="font-size: 18px; font-weight: bold; margin-top: 5px"><%= book.getBookName() %></p>
                            <p>Author: <%= book.getAuthor() %></p>
                            <p>Categories: <%= book.getCategory() %></p>
                            <div class="row justify-content-center">
                                <a href="view_book.jsp?bid=<%=book.getBookID()%>" class="btn btn-success btn-sm ml-1">Details</a>
                                <a href="#" class="btn btn-danger btn-sm ml-1"><%= book.getPrice() %> $</a>
                            </div>
                        </div>
                    </div>
                </div>
            <%
                }
            %>

            </div>

            <div class="text-center mt-3">
                <a href="all_old_book.jsp" class="btn btn-danger btn-sm text-white">View All</a>
            </div>

        </div>
<!-- End Old Book -->

<hr>
        <div style="margin-top: 50px">
            <%@ include file="all_component/footer.jsp" %>
        </div>

</body>


</html>