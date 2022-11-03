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

        <div class="container col-8 col-xs-12">
          <c:if test="${movie != null}">
              <form action="adminupdatemovie" method="post">
          </c:if>
          <c:if test="${movie == null}">
              <form action="admininsertmovie" method="post">
          </c:if>

          <caption>
              <h2 class="text-center">
                  <c:if test="${movie != null}">
                      Edit Movie
                  </c:if>
                  <c:if test="${movie == null}">
                      Add New Movie
                  </c:if>
              </h2>
          </caption>

          <c:if test="${movie != null}">
              <input type="hidden" name="id" value="<c:out value='${movie.id}' />" />
          </c:if>
          <fieldset class="input-group row mb-2 mr-sm-2">
              <label class="col-sm-3 col-form-label">Title: </label>
              <input type="text" value="<c:out value='${movie.title}' />" class="form-control col-sm-9" name="title">
          </fieldset>
          <fieldset class="input-group row mb-2 mr-sm-2">
              <label class="col-sm-3 col-form-label">Summary: </label>
              <input type="text" value="<c:out value='${movie.summary}' />" class="form-control col-sm-9" name="summary">
          </fieldset>
          <fieldset class="input-group row mb-2 mr-sm-2">
              <label class="col-sm-3 col-form-label">Price: </label>
              <div class="input-group-prepend">
                <div class="input-group-text">$</div>
              </div>
              <input type="text" value="<c:out value='${movie.price}' />" class="form-control col-sm-9" name="price">
          </fieldset>
          <fieldset class="input-group row mb-2 mr-sm-2">
              <label class="col-sm-3 col-form-label">In Stock: </label>
              <input type="text" value="<c:out value='${movie.stock}' />" class="form-control col-sm-9" name="stock">
          </fieldset>
          <fieldset class="input-group row mb-2 mr-sm-2">
              <label class="col-sm-3 col-form-label">Image URL: </label>
              <input type="text" value="<c:out value='${movie.imageURL}' />" class="form-control col-sm-9" name="imageURL">
          </fieldset>
          <fieldset class="input-group row mb-2 mr-sm-2">
              <label class="col-sm-3 col-form-label">Category: </label>
              <select type="text" value="<c:out value='${movie.categoryID}' />" class="form-control col-sm-9" name="categoryID">
                <c:forEach var="category" items="${categories}">
                  <option
                      value="<c:out value='${category.id}'/>"
                      <c:if test="${movie.categoryID == category.id}">
                          selected
                      </c:if>
                      <c:if test="${movie == null}">
                          placeholder="Choose Category.."
                      </c:if>
                  >
                    <c:out value='${category.name}'/>
                  </option>
                </c:forEach>
              </select>
          </fieldset>

          <input class="btn btn-success mx-auto" type="submit" value="Save">
          </form>
        </div>
    </div>
</body>

</html>


