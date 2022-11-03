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

    <div class="row text-center">

        <div class="container col-9">
          <c:if test="${category != null}">
              <form action="adminupdatecategory" method="post">
          </c:if>
          <c:if test="${category == null}">
              <form action="admininsertcategory" method="post">
          </c:if>

          <caption>
              <h2>
                  <c:if test="${category != null}">
                      Edit Category
                  </c:if>
                  <c:if test="${category == null}">
                      Add New Category
                  </c:if>
              </h2>
          </caption>

          <c:if test="${category != null}">
              <input type="hidden" name="id" value="<c:out value='${category.id}' />" />
          </c:if>

          <fieldset class="form-group">
              <label>Category</label> <input type="text" value="<c:out value='${category.name}' />" class="form-control" name="name">
          </fieldset>

          <button type="submit" class="btn btn-success">Save</button>
          </form>
        </div>
    </div>
</body>

</html>


