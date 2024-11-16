<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ page isELIgnored="false" %>
<%@ page import="com.DAO.BookDAOImpl" %>
<%@ page import="com.DB.DBConnect" %>
<%@ page import="java.util.*" %>
<%@ page import="com.entity.Book_data" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="com.entity.User" %>
            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Search book</title>
                <%@ include file="all_component/allCss.jsp" %>
                <style>
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

            <body style="background-color:#f7f7f7;">

                <%
                    User u = (User) session.getAttribute("userobj");
                %>

                <%@ include file="all_component/navbar.jsp" %>

                    <!-- Recent Book -->
                    <h3 class="text-center" style="padding-top:8px">Your Searched Books </h3>
                    <div class="container-fluid">
                        <div class="row">

                            <%
                                String search = request.getParameter("search");
                                Connection conn2=DBConnect.getConn();
                                BookDAOImpl dao2=new BookDAOImpl(conn2);
                                List<Book_data> list2 = dao2.searchBook(search);
                                for(Book_data book : list2) {
                                %>
                                <div class="col-md-3 p-5">
                                    <div class="card">
                                        <div class="card-body text-center">
                                            <img src="book/<%= book.getPhoto() %>" alt=""
                                                style="width: 150px; height: 200px;" class="img-thumblin">
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
                                                        <a href="#" class="btn btn-danger btn-sm ml-1"><%= book.getPrice() %> $
                                                        </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <% }
                                %>
                        </div>
                    </div>


                    <hr>
                            <div style="margin-top: 50px">
                                <%@ include file="all_component/footer.jsp" %>
                            </div>

            </body>

            </html>