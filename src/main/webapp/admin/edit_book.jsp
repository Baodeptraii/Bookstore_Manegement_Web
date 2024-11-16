<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ page isELIgnored="false" %>
<%@ page import="com.DAO.BookDAOImpl" %>
<%@ page import="com.DB.DBConnect" %>
<%@ page import="java.util.*" %>
<%@ page import="com.entity.Book_data" %>
            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Admin: Edit books</title>
                <%@ include file="allCss.jsp" %>
            </head>

            <body style = "background-color: #f0f2f2">
                <%@ include file="navbar.jsp" %>
                    <div class="container">
                        <div class="row">
                            <div class="col-md-4 offset-md-4 p-4">
                                <div class="card">
                                    <div class="card-body">
                                        <h4 class="text-center">Edit Book</h4>

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


                                        <%
                                            int id = Integer.parseInt(request.getParameter("id"));
                                            BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
                                            Book_data book = dao.getBookById(id);
                                         %>

                                        <form action="../edit_books" method="post">
                                            <input type="hidden" name="id" value="<%=book.getBookID()%>">

                                            <div class="form-group">
                                                <label for="exampleInputEmail1">Book Name*</label>
                                                <input type="text" class="form-control" id="exampleInputEmail1"
                                                    name="book" aria-describedby="emailHelp"
                                                    placeholder="Enter Book Name" value ="<%=book.getBookName()%>">
                                            </div>

                                            <div class="form-group">
                                                <label for="exampleInputPassword1">Author Name*</label>
                                                <input type="text" class="form-control" id="exampleInputPassword1"
                                                    name="author" aria-describedby="emailHelp"
                                                    placeholder="Enter Author Name" value ="<%=book.getAuthor()%>">
                                            </div>

                                            <div class="form-group">
                                                <label for="exampleInputPassword1">Price*</label>
                                                <input type="text" class="form-control" id="exampleInputPassword1"
                                                    name="price" placeholder="Enter Price" value ="<%=book.getPrice()%>">
                                            </div>

                                            <div class="form-group">
                                                <label for="inputState">Book Categories</label>
                                                <select id="inputState" name="category" class="form-control">
                                                    <%
                                                    if("New".equals(book.getStatus())){
                                                    %>
                                                    <option value="New">New Book</option>
                                                    <option value="Old">Old Book</option>
                                                    <%
                                                    }else{
                                                    %>
                                                    <option value="Old">Old Book</option>
                                                    <option value="New">New Book</option>
                                                    <%
                                                    }
                                                    %>
                                                </select>
                                            </div>

                                            <div class="form-group">
                                                <label for="inputState">Book Status</label>
                                                <select id="inputState" name="status" class="form-control">
                                                    <%
                                                    if("Active".equals(book.getStatus())){
                                                    %>
                                                    <option value="Active">Active</option>
                                                    <option value="Inactive">Inactive</option>
                                                    <%
                                                    }else{
                                                    %>
                                                    <option value="Inactive">Inactive</option>
                                                    <option value="Active">Active</option>
                                                    <%
                                                    }
                                                    %>
                                                </select>
                                            </div>



                                            <button type="submit" class="btn btn-primary">Update</button>



                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div style="margin-top: 50px">
                        <%@ include file="footer.jsp" %>
                    </div>

            </body>

            </html>