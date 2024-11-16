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
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>View book</title>
                <%@ include file="all_component/allCss.jsp" %>
                <style>
                .container .col-md-6:hover {
                    background-color: #e9e9e9; /* Light gray hover effect */
                    transition: background-color 0.3s ease;
                }

                </style>
            </head>

            <body style="background-color:#f7f7f7;">

                <%@ include file="all_component/navbar.jsp" %>
                <%
                    User u = (User) session.getAttribute("userobj");
                %>
                <c:if test="${empty userobj}">
                       <c:redirect url="login.jsp"/><c/:redirect>
                    </c:if>

                    <%
                        int bid = Integer.parseInt(request.getParameter("bid"));
                        Connection conn = DBConnect.getConn();
                        BookDAOImpl dao = new BookDAOImpl(conn);
                        Book_data book = dao.getBookById(bid);

                     %>

                    <div class="container">
                        <div class="row p-5">
                            <div class="col-md-6 text-center p-5 border">
                                <img src="book/<%=book.getPhoto() %>" style="height: 200px; width: 200px;"><br>
                                <h4 class="mt-3">Book Name: <%=book.getBookName() %></h4>
                                <h4>Author: <%=book.getAuthor() %></h4>
                                <h4>Category: <%=book.getCategory() %></h4>
                            </div>
                            <div class="col-md-6 text-center p-5 border ">
                                <h1><%=book.getBookName() %></h1><br>
                                <div class="row">
                                    <div class="col-md-4 text-center text-danger p-2">
                                        <i class="fa-solid fa-money-bill-wave fa-3x"></i>
                                        <p>Cash On Delivery</p>
                                    </div>
                                    <div class="col-md-4 text-center text-danger p-2">
                                        <i class="fa-solid fa-rotate-left fa-3x"></i>
                                        <p>Easy Return</p>
                                    </div>
                                    <div class="col-md-4 text-center text-danger p-2">
                                        <i class="fa-solid fa-truck-fast fa-3x"></i>
                                        <p>Fast Delivery</p>
                                    </div>
                                </div>

                                <div class="text-center p-5">
                                    <% if (!"Old".equals(book.getCategory())) { %>
                                        <a href="cart?bid=<%=book.getBookID() %>&&uid=<%=u.getId()%>" class="btn btn-primary "><i class="fa-solid fa-cart-plus"></i>Add to Cart</a>
                                        <a href="" class="btn btn-danger "><%=book.getPrice() %> $</a>
                                    <% } else {%>
                                    <a href="mailto: <%=book.getUser_email() %>" class="btn btn-primary "><i class="fa-solid fa-envelope"></i>    Contact to: <%=book.getUser_email() %></a>
                                    <a href="" class="btn btn-danger "><%=book.getPrice() %> $</a>
                                    <% } %>
                                </div>
                            </div>
                        </div>
                    </div>


                    <hr>
                <div style="margin-top: 50px">
                    <%@ include file="all_component/footer.jsp" %>
                </div>

            </body>

            </html>