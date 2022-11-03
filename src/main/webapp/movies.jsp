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
              <li><a href="<%=request.getContextPath()%>/movies" class="nav-link">Movies</a></li>
              <li><a href="<%=request.getContextPath()%>/cart" class="nav-link">Cart</a></li>
              <c:if test="${auth != null}">
                <li><a href="<%=request.getContextPath()%>/logout" class="nav-link">Logout</a></li>
              </c:if>
            </ul>
        </nav>
    </header>
    <br>

    <div class="row">

        <div class="container col-9">
            <h3 class="text-center">Available Movies</h3>
            <hr>
            <br>
            <div class="card-columns">
              <c:forEach var="movie" items="${movies}">
                <div class="card" style="width: 200px, max-height: 200px">
                  <img class="card-img-top" src=<c:out value='${movie.imageURL}'/> alt=<c:out value='${movie.title}'/> />
                  <div class="card-body">
                    <h5 class="card-title"><c:out value="${movie.title}" /></h5>
                    <p class="card-text"><c:out value="${movie.summary}" /></p>
                    <p class="card-text font-weight-light">$<c:out value="${movie.price}" /></p>
                  </div>
                  <div class="card-footer d-flex justify-content-center">
                    <a href="addtocart?id=<c:out value='${movie.id}' />" class="btn btn-primary">Add to Cart</a>
                  </div>
                </div>
              </c:forEach>
            </div>
        </div>
    </div>
</body>

</html>


