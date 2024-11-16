<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ page isELIgnored="false" %>
<%@ page import="com.DAO.BookDAOImpl" %>
<%@ page import="com.DB.DBConnect" %>
<%@ page import="java.util.*" %>
<%@ page import="com.entity.Book_data" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="com.entity.User" %>



<style>

     .navbar {
            position: sticky;
            top: 0;
            z-index: 1000;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
</style>



<div class="container-fluid highlight-bar"></div>


<div class="container-fluid p-3 bg-light">
    <div class="row">
        <div class="col-md-3">
            <h3> My Bookstore</h3>
        </div>
        <div class="col-md-6">
            <form class="form-inline" action="search.jsp" method="post">
                <input class="form-control mr-sm-2 w-75" type="search" placeholder="Search books" aria-label="Search" name="search">
                <button class="btn btn-primary" type="submit">
                    <i class="fa-solid fa-magnifying-glass"></i> Search
                </button>
            </form>
        </div>
        <c:if test="${empty userobj}">

            <div class="col-md-3">
                <a href="login.jsp" class="btn btn-success"><i class="fa-solid fa-right-to-bracket"></i> Login</a>
                <a href="register.jsp" class="btn btn-primary"><i class="fa-solid fa-user-plus"></i> Register</a>
            </div>

        </c:if>

        <c:if test="${not empty userobj}">
            <div class="col-md-3 text-center ">
                <h4>Welcome ${userobj.username}</h4>
                <a href="cart.jsp" class="btn btn-primary"><i class="fa-solid fa-shopping-cart"></i> My cart</a>
                <a href="check_order.jsp" class="btn btn-success"><i class="fa-solid fa-shopping-bag"></i> Check my order</a>
            </div>
        </c:if>

    </div>
</div>

<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
    <a class="navbar-brand" href="#"></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="index.jsp"><i class="fa-solid fa-house"></i> Home <span
                        class="sr-only">(current)</span></a>
            </li>

            <li class="nav-item active">
                <a class="nav-link" href="all_recent_book.jsp"><i class="fa-solid fa-book-open"></i> Recent Book</a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="all_new_book.jsp"><i class="fa-solid fa-bookmark"></i> New Book</a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="all_old_book.jsp"><i class="fa-regular fa-bookmark"></i> Old Book</a>
            </li>

        </ul>
        <c:if test="${not empty userobj}">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="setting.jsp"><i class="fa-solid fa-gear"></i></i> More Feature</a>
                </li>
            </ul>
            <ul class="navbar-nav ml-3 ">
                <li class="nav-item active">
                    <a class="nav-link" href="LogoutServlet"><i class="fa-solid fa-arrow-right-from-bracket"></i> Logout</a>
                </li>
            </ul>
        </c:if>


    </div>


</nav>