<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ page isELIgnored="false" %>

            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Admin: Add books</title>
                <%@ include file="allCss.jsp" %>
            </head>

            <body style = "background-color: #f0f2f2">
                <%@ include file="navbar.jsp" %>
                    <div class="container">
                        <div class="row">
                            <div class="col-md-4 offset-md-4 p-4">
                                <div class="card">
                                    <div class="card-body">
                                        <h4 class="text-center">Add Book</h4>

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


                                        <form action="../add_books" method="post"
                                            enctype="multipart/form-data">
                                            <div class="form-group">
                                                <label for="exampleInputEmail1">Book Name*</label>
                                                <input type="text" class="form-control" id="exampleInputEmail1"
                                                    name="book" aria-describedby="emailHelp"
                                                    placeholder="Enter Book Name">
                                            </div>

                                            <div class="form-group">
                                                <label for="exampleInputPassword1">Author Name*</label>
                                                <input type="text" class="form-control" id="exampleInputPassword1"
                                                    name="author" aria-describedby="emailHelp"
                                                    placeholder="Enter Author Name">
                                            </div>

                                            <div class="form-group">
                                                <label for="exampleInputPassword1">Price*</label>
                                                <input type="text" class="form-control" id="exampleInputPassword1"
                                                    name="price" placeholder="Enter Price">
                                            </div>

                                            <div class="form-group">
                                                <label for="inputState">Book Categories</label>
                                                <select id="inputState" name="category" class="form-control">
                                                    <option value="New">New Book</option>
                                                    <option value="Old">Old Book</option>
                                                </select>
                                            </div>

                                            <div class="form-group">
                                                <label for="inputState">Book Status</label>
                                                <select id="inputState" name="status" class="form-control">
                                                    <option value="Active">Active</option>
                                                    <option value="Inactive">Inactive</option>
                                                </select>
                                            </div>

                                            <div class="form-group">
                                                <label for="exampleFormControlFile1">Upload Photo</label>
                                                <input type="file" class="form-control-file"
                                                    id="exampleFormControlFile1" name="bimg">
                                            </div>

                                            <button type="submit" class="btn btn-primary">Add</button>



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