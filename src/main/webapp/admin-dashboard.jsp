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
              <li><a href="<%=request.getContextPath()%>/admin/categories" class="nav-link">Categories</a></li>
              <li><a href="<%=request.getContextPath()%>/admin/movies" class="nav-link">Movies</a></li>
              <c:if test="${auth != null}">
                <li><a href="<%=request.getContextPath()%>/logout" class="nav-link">Logout</a></li>
              </c:if>
            </ul>
        </nav>
    </header>
    <br>
    <div class="row">
        <div class="container col-md-8">
            <div class="card py-3"
                <div class="card-body">
                  <h3 class="text-center mt-1">Admin Menu</h3>
                  <hr>
                  <div>
                    <h4 class="text-center">Category</h4>
                    <div class="text-center">
                      <a class="btn btn-primary" href="<%=request.getContextPath()%>/admincategories">View Categories</a>
                      <a class="btn btn-primary" href="<%=request.getContextPath()%>/adminnewcategoryform">Add a Category</a>
                    </div>
                  </div>
                  <hr>
                  <div>
                    <h4 class="text-center">Movie</h4>
                    <div class="text-center">
                      <a class="btn btn-primary" href="<%=request.getContextPath()%>/adminmovies">View Movies</a>
                      <a class="btn btn-primary" href="<%=request.getContextPath()%>/adminnewmovieform">Add a Movie</a>
                    </div>
                  </div>
                </div>
            </div>
        </div>
    </div>
</body>

</html>


