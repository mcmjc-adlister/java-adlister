<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Edit Profile Information"/>
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>
<div class="container">
<%-- TODO white text on white background currently makes them unreadable --%>
    <h1 class="text-center text-white">${sessionScope.user.username}'s Information</h1>
    <hr>
    <form action="/update" method="post">
        <div class="form-group text-white">
            <label for="username">Username</label>
            <input id="username"  value="<c:out value='${user.username}' />" name="username" class="form-control" type="text">
        </div>
        <div class="form-group text-white">
            <label for="email">Email</label>
            <input id="email" value="<c:out value='${user.email}' />" name="email" class="form-control" type="text">
        </div>
        <div class="form-group text-white">
            <label for="password">Password</label>
            <jsp:include page="partials/error.jsp"/>
            <input id="password" value="<c:out value='${password}' />" name="password" class="form-control" type="password">
        </div>
        <div class="form-group text-white">
            <label for="confirm_password">Confirm Password</label>
            <input id="confirm_password" value="<c:out value='${password}' />" name="confirm_password" class="form-control" type="password">
        </div>
        <button type="submit" class="btn btn-primary btn-block">Update</button>
    </form>

<%-- TODO (suggestion/optional) make delete user an admin only option --%>
    <form action="/delete" method="post">
        <button type="submit" class="btn btn-danger">Delete User</button>
    </form>
</div>
</body>
</html>
