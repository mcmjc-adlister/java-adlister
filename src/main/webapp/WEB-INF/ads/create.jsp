<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Create a new Ad" />
    </jsp:include>
</head>
<body>
    <div class="container">
        <h1>Create a new Ad</h1>
        <form action="/ads/create" method="post">
            <div class="form-group">
                <label for="title">Title</label>
                <input id="title" name="title" class="form-control" type="text">
            </div>
            <div class="form-group">
                <label for="description">Description</label>
                <textarea id="description" name="description" class="form-control" type="text"></textarea>
            </div>

            <c:forEach items="${categories}" var="category">

                <input type="checkbox" id="${category.getCategory()}${category.getId()}" name="categories">
                <label for="${category.getCategory()}${category.getId()}">${category.getCategory()}</label><br>

            </c:forEach>

            <input type="submit" class="btn btn-block btn-primary">
        </form>
    </div>
</body>
</html>
