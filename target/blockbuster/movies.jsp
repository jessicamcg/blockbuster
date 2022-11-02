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
                <a href="<%=request.getContextPath()%>/" class="navbar-brand"> Blockbuster </a>
            </div>

            <ul class="navbar-nav">
                <li><a href="<%=request.getContextPath()%>/movies" class="nav-link">Movies</a></li>
            </ul>
        </nav>
    </header>
    <br>

    <div class="row">

        <div class="container">
            <h3 class="text-center">Available Movies</h3>
            <hr>
            <br>
            <div class="d-flex p-2">
              <c:forEach var="movie" items="${movies}">
                <div class="card" style="width: 400px;">
                  <img class="card-img-top" src=<c:out value='${movie.imageURL}'/> alt=<c:out value='${movie.title}'/> />
                  <div class="card-body">
                    <h5 class="card-title"><c:out value="${movie.title}" /></h5>
                    <p class="card-text"><c:out value="${movie.summary}" /></p>
                    <a href="addtocart?id=<c:out value='${movie.id}' />" class="btn btn-primary">Add to Cart</a>
                  </div>
                </div>
              </c:forEach>
            </div>
        </div>
    </div>
</body>

</html>


