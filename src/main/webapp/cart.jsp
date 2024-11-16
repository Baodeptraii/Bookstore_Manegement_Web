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
    <title>Cart</title>
    <%@ include file="all_component/allCss.jsp" %>
    <style>
    .card {
        box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        border: none;
        border-radius: 8px;
        overflow: hidden;
    }
    .card .cart-body {
        padding: 20px;
        background-color: #f9f9f9;
    }
    .form-group label {
        font-weight: 600;
        color: #555;
    }
    .form-group input[type="text"] {
        border: 1px solid #ccc;
        border-radius: 4px;
        padding: 10px;
    }

    .btn-primary:hover, .btn-danger:hover {
        opacity: 0.9;
    }
    </style>

</head>

<body style="background-color:#f7f7f7;">
    <%@ include file="all_component/navbar.jsp" %>

    <c:if test="${empty userobj}">
       <c:redirect url="login.jsp"/><c/:redirect>
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

            <div class="row p-3">

                <div class="col-md-6">

                    <div class="card bg-white">
                        <div class="card-body">
                            <h3 class="text-center text-success">Your selected book
                            </h3>
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th scope="col">Book name</th>
                                        <th scope="col">Author</th>
                                        <th scope="col">Price</th>
                                        <th scope="col">Action</th>
                                    </tr>
                                </thead>
                                <tbody>

                                <%

                                    User u = (User)session.getAttribute("userobj");
                                    CartDAOImpl dao = new CartDAOImpl(DBConnect.getConn());
                                    List<Cart> c = dao.getBookByUser(u.getId());
                                    Double total = 0.0;
                                    for(Cart cart : c) {
                                        total += cart.getPrice();
                                    %>
                                    <tr>
                                        <th scope="row"><%=cart.getBookName() %></th>
                                        <td><%=cart.getAuthor() %></td>
                                        <td><%=cart.getPrice() %></td>
                                        <td>
                                            <a href="remove_book?bid=<%=cart.getBid()%>&&uid=<%=cart.getUid()%>&&cid=<%=cart.getCid()%>" class ="btn btn-danger btn-sm">Remove</a>
                                        </td>
                                    </tr>
                                    <%
                                    }
                                %>
                                    <tr>
                                        <td colspan="2">Total</td>
                                        <td colspan="2"><%=total %></td>
                                    </tr>



                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="card">
                        <div class="cart-body">
                            <h3 class="text-center text-success">Your details for order</h3>
                            <form action="order" method="post">

                                <input type="hidden" value="<%=u.getId()%>" name="id">

                                <div class="form-group">
                                    <label for="inputAddress">Full Name</label>
                                    <input type="text" class="form-control" id="inputAddress"
                                    value="<%=u.getUsername()%>" readonly="readonly" name = "name" >
                                  </div>
                                 <div class="form-group">
                                    <label for="inputAddress">Email</label>
                                    <input type="text" class="form-control" id="inputAddress"
                                    value="<%=u.getEmail()%>" readonly="readonly" name="email">
                                  </div>
                                   <div class="form-group">
                                      <label for="inputAddress">Address</label>
                                      <input type="text" class="form-control" id="inputAddress"
                                      placeholder="Enter your address" name="address" required>
                                    </div>
                                     <div class="form-group">
                                        <label for="inputAddress">Phone Number</label>
                                        <input type="text" class="form-control" id="inputAddress"
                                        value="<%=u.getPhone()%>" readonly="readonly" name ="phone">
                                      </div>

                                    <div class="text-center">
                                    <a href="index.jsp" class="btn btn-danger">Back</a>
                                   <button type="submit" class="btn btn-primary">Order Now</button>
                                        </div>

                            </form>
                        </div>
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