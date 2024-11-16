<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    <%@ include file="allCss.jsp" %>
    <style>
        body {
            background-color: #f0f2f2;
        }
        .container {
            max-width: 1200px;
            margin: auto;
        }
        .card {
            border: none;
            border-radius: 10px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s, box-shadow 0.3s;
            cursor: pointer;
        }
        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.2);
        }
        .card-body {
            padding: 20px;
        }
        .card i {
            font-size: 3rem;
            margin-bottom: 10px;
        }
        .card h4 {
            font-size: 1.25rem;
            font-weight: bold;
        }
        .text-primary { color: #007bff !important; }
        .text-warning { color: #ffca2c !important; }
        .text-danger { color: #dc3545 !important; }
        a { text-decoration: none; color: inherit; }
        a:hover { text-decoration: none; color: inherit; }
    </style>
</head>

<body>
    <%@ include file="navbar.jsp" %>

    <div class="container py-5">
        <div class="row gy-4">
            <div class="col-md-3">
                <a href="add_book.jsp">
                    <div class="card text-center">
                        <div class="card-body text-primary">
                            <i class="fa-solid fa-square-plus"></i>
                            <h4>Add Books</h4>
                        </div>
                    </div>
                </a>
            </div>

            <div class="col-md-3">
                <a href="all_book.jsp">
                    <div class="card text-center">
                        <div class="card-body text-warning">
                            <i class="fa-solid fa-book-open"></i>
                            <h4>View All Books</h4>
                        </div>
                    </div>
                </a>
            </div>

            <div class="col-md-3">
                <a href="orders.jsp">
                    <div class="card text-center">
                        <div class="card-body text-primary">
                            <i class="fa-solid fa-box-open"></i>
                            <h4>Orders</h4>
                        </div>
                    </div>
                </a>
            </div>

            <div class="col-md-3">
                <a href="../LogoutServlet">
                    <div class="card text-center">
                        <div class="card-body text-danger">
                            <i class="fa-solid fa-right-from-bracket"></i>
                            <h4>Logout</h4>
                        </div>
                    </div>
                </a>
            </div>
        </div>
    </div>

    <%@ include file="footer.jsp" %>
</body>
</html>
