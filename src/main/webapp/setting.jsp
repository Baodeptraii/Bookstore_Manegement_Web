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
<title>Setting</title>
<%@ include file="all_component/allCss.jsp" %>
<style>
    a{
    text-decoration: none;
    color: black;
    }
    a:hover{
    text-decoration: none;
    }

</style>
</head>
<body style="background-color: #f0f1f2">

    <%@ include file="all_component/navbar.jsp" %>

    <div class="container">
            <div class="row p-5 text-center">
                <div class="col-md-6 mt-3">
                    <a href="sell_book.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <div class="text-primary">
                                    <i class="fa-solid fa-book-open fa-3x"></i>
                                </div>
                                <h3>Sell old book</h3>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-md-6 mt-3">
                    <a href="edit_profile.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <div class="text-primary">
                                    <i class="fa-solid fa-user-pen fa-3x"></i>
                                </div>
                                <h3>Login & Security</h3>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-md-6 mt-3">
                    <a href="user_address.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <div class="text-primary">
                                    <i class="fa-solid fa-location-dot fa-3x"></i>
                                </div>
                                <h3>Edit address</h3>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-md-6 mt-3">
                    <a href="old_book.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <div class="text-primary">
                                    <i class="fa-solid fa-store fa-3x"></i>
                                </div>
                                <h3>Your old books</h3>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-md-6 mt-3">
                    <a href="https://chatgpt.com/">
                        <div class="card">
                            <div class="card-body text-center">
                                <div class="text-primary">
                                    <i class="fa-solid fa-circle-question fa-3x"></i>
                                </div>
                                <h3>Help Center</h3>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-md-6 mt-3">
                    <a href="https://drive.google.com/file/d/15QDYUfkTogn9VoS0YEn8PhN3XdI4CTrw/view?usp=sharing">
                        <div class="card">
                            <div class="card-body text-center">
                                <div class="text-primary">
                                    <i class="fa-solid fa-hand-holding-dollar fa-3x"></i>
                                </div>
                                <h3>Donation</h3>
                            </div>
                        </div>
                    </a>
                </div>

            </div>
    </div>
    <%@ include file="all_component/footer.jsp" %>

</body>

</html>




