<%@ page import="com.DAO.BookDAOImpl" %>
<%@ page import="com.DB.DBConnect" %>
<%@ page import="java.util.*" %>
<%@ page import="com.entity.Book_data" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin: All Books</title>
    <%@ include file="allCss.jsp" %>
    <style>
        body {
            background-color: #f0f2f2;
        }
        .container {
            max-width: 1400px;
            margin: auto;
            padding: 20px;
        }
        .table {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .table th {
            background-color: #007bff;
            color: white;
            font-weight: bold;
            text-align: center;
        }
        .table td {
            text-align: center;
            vertical-align: middle;
        }
        .text-center {
            margin-top: 10px;
            font-size: 1.1rem;
        }
        .btn {
            padding: 5px 10px;
            font-size: 0.9rem;
        }
        .btn-warning {
            color: #fff;
            background-color: #ffc107;
            border: none;
        }
        .btn-danger {
            color: #fff;
            background-color: #dc3545;
            border: none;
        }
        .btn-warning:hover,
        .btn-danger:hover {
            opacity: 0.9;
        }

    </style>
</head>

<body>
    <%@ include file="navbar.jsp" %>

    <div class="container my-4">

        <!-- Search form -->
            <!-- <form action="all_books.jsp" method="get" class="sorting-form mb-3">
                <div class="sorting-options">
                    <div class="form-group">
                        <label for="sortCriteria" class="form-label">Sort by:</label>
                        <select name="sortCriteria" id="sortCriteria" class="form-select">
                            <option value="bookName">Book Name</option>
                            <option value="author">Author</option>
                            <option value="price">Price</option>
                            <option value="category">Category</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="sortOrder" class="form-label">Order:</label>
                        <select name="sortOrder" id="sortOrder" class="form-select">
                            <option value="asc">Ascending</option>
                            <option value="desc">Descending</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <button type="submit" class="btn btn-primary sort-btn">Sort</button>
                    </div>
                </div>
            </form> -->



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

        <table class="table table-striped table-hover">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Image</th>
                    <th>Book Name</th>
                    <th>Author</th>
                    <th>Price</th>
                    <th>Category</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
                    List<Book_data> list = dao.getAllBooks();
                    for(Book_data book : list){
                %>
                <tr>
                    <td><%=book.getBookID()%></td>
                    <td><img src="../book/<%=book.getPhoto()%>" style="width: 50px; height: 50px; border-radius: 4px;"></td>
                    <td><%=book.getBookName()%></td>
                    <td><%=book.getAuthor()%></td>
                    <td>$<%=book.getPrice()%></td>
                    <td><%=book.getCategory()%></td>
                    <td><%=book.getStatus()%></td>
                    <td>
                        <a href="edit_book.jsp?id=<%=book.getBookID()%>" class="btn btn-warning">Edit</a>
                        <a href="../delete_book?id=<%=book.getBookID()%>" class="btn btn-danger">Delete</a>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>

    <%@ include file="footer.jsp" %>
</body>
</html>
