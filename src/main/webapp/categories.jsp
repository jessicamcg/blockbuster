<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>

<head>
    <title>Blockbuster</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>

<body>
    <header>
        <nav class="navbar navbar-expand-md navbar-dark" style="background-color: darkblue">
            <div>
                <a href="<%=request.getContextPath()%>/" class="navbar-brand text-warning font-weight-bold"> Blockbuster </a>
            </div>

            <ul class="navbar-nav">
              <li><a href="<%=request.getContextPath()%>/admincategories" class="nav-link">Categories</a></li>
              <li><a href="<%=request.getContextPath()%>/adminmovies" class="nav-link">Movies</a></li>
              <c:if test="${auth != null}">
                <li><a href="<%=request.getContextPath()%>/logout" class="nav-link">Logout</a></li>
              </c:if>
            </ul>
        </nav>
    </header>
    <br>

    <div class="row text-center">

        <div class="container col-9">
            <h3 class="text-center">Categories</h3>
            <hr>
            <a class="btn btn-primary" href="adminnewcategoryform">Add New Category</a>
            <br>
            <div class="row justify-content-center">
              <c:forEach var="category" items="${categories}">
                <div class="card col-sm-12 col-md-4 col-lg-3 p-0 m-2" style="width: 200px, max-height: 200px">
                  <div class="card-body">
                    <h5 class="card-title"><c:out value="${category.name}" /></h5>
                  </div>
                  <div class="card-footer d-flex justify-content-around">
                    <a href="admineditcategoryform?id=<c:out value='${category.id}' />" class="btn btn-primary">Edit</a>
                    <a href="admindeletecategory?id=<c:out value='${category.id}' />" class="btn btn-warning">Delete</a>
                  </div>
                </div>
              </c:forEach>
            </div>
        </div>
    </div>
</body>

</html>


