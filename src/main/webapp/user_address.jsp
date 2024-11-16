<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Address</title>
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

                        <h3>Add address </h3>

                        <form action="" method="post">
                            <div class="form-group">
                                <label for="exampleInputEmail1">Your address </label>
                                <input type="text" class="form-control" id="exampleInputEmail1"
                                    aria-describedby="emailHelp" required="required" name = "fname">
                            </div>

                            <button type="submit" class="btn btn-primary"> Add</button>

                        </form>
                        <hr>
                         <p> Google map API with be here ! </p>

                        <iframe
                            src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAOVYRIgupAurZup5y1PRh8Ismb1A3lLao&libraries=places&callback=initMap"
                            width="100%" height="300" style="border:0;" allowfullscreen="" loading="lazy">
                        </iframe>

                    </div>
                </div>
            </div>
        </div>
    </div>

    <%@ include file="all_component/footer.jsp" %>

</body>

</html>




