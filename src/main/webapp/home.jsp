<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page isELIgnored="false" %>
    <!DOCTYPE html>
    <html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Home</title>
        <%@ include file="all_component/allCss.jsp" %>

    </head>
    <body>
        <%@ include file="all_component/navbar.jsp" %>

            <div class="container p-5">
                <div class="row">
                    <div class="col-md-6 offset-md-3">
                        <div class="card">
                            <div class="card-header">
                                <h3>Home Page</h3>
                            </div>
                            <div class="card-body">

                                <h1>Welcome to Home Page</h1>

                                <c:if test="${not empty userobj}">
                                    <h1> Welcome ${userobj.username} </h1>
                                    <h1> Your email is ${userobj.email} </h1>

                                </c:if>



                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <%@ include file="all_component/footer.jsp" %>
    </body>
    </html>