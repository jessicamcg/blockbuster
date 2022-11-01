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
                <li><a href="<%=request.getContextPath()%>/movies" class="nav-link">movies</a></li>
            </ul>
        </nav>
    </header>
    <br>
    <div class="row">
        <div class="container col-md-6">
            <div class="card"
                <div class="card-body p-2">
                <h3 class="mx-auto mt-3">Sign up</h3>
                    <form class="p-3" action="newcustomer" method="post">
                       <fieldset class="form-group">
                           <label>First Name: </label> <input type="text" class="form-control" name="firstname">
                       </fieldset>
                       <fieldset class="form-group">
                           <label>Last Name: </label> <input type="text" class="form-control" name="lastname">
                       </fieldset>
                       <fieldset class="form-group">
                           <label>Phone: </label> <input type="text" class="form-control" name="phone">
                       </fieldset>
                       <fieldset class="form-group">
                           <label>Address: </label> <input type="text" class="form-control" name="address">
                       </fieldset>
                       <fieldset class="form-group">
                           <label>Email</label> <input type="text" class="form-control" name="email">
                       </fieldset>

                       <fieldset class="form-group">
                           <label>Password</label> <input type="password" class="form-control" name="password">
                       </fieldset>

                       <input type="submit" value="Sign Up">
                       <a href="<%=request.getContextPath()%>/login">Already have an account? Login instead</a>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>

</html>


