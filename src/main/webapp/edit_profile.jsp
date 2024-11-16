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
<title>Profile</title>
<%@ include file="all_component/allCss.jsp" %>
<style>

            .card {
                border: 1px solid #ccc;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            .card:hover {
                background-color: white;
            }
        </style>
</head>
<body style="background-color: #f0f1f2">

    <%@ include file="all_component/navbar.jsp" %>

    <div class="container">
        <div class="row">
            <div class="col-md-6 offset-md-3 p-5">
                <div class="card">
                    <div class="card-body">
                        <h3 class="text-center"> Edit profile </h3>

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

                        <form action="update_profile" method="post">

                            <input type="hidden" value="${userobj.id }" name = "id">
                            <div class="form-group">
                                <label for="exampleInputEmail1">Name </label>
                                <input type="text" class="form-control" id="exampleInputEmail1"
                                    aria-describedby="emailHelp" required="required" name = "fname" value="${userobj.username}">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1">Email address </label>
                                <input type="email" class="form-control" id="exampleInputEmail1"
                                    aria-describedby="emailHelp" required="required" name ="email" value="${userobj.email}">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1">Phone </label>
                                <input type="num" class="form-control" id="exampleInputEmail1"
                                    aria-describedby="emailHelp" required="required" name ="phone" value="${userobj.phone}">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1">Password </label>
                                <input type="password" class="form-control" id="exampleInputPassword1"
                                    required="required" name ="password">
                            </div>

                            <button type="submit" class="btn btn-primary"> Update</button>
                        </form>



                    </div>
                </div>
            </div>
        </div>
    </div>

    <%@ include file="all_component/footer.jsp" %>

</body>

</html>




