<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Create a new Ad"/>
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
        <div class="container">
            <div class="row">

                <%-- TODO reduce number of categories? limit user to picking only 3? --%>
                <c:forEach items="${categories}" var="category">
                    <div class="col-2 checkbox-inline">
                        <label>
                            <input type="checkbox"
                                   id="${category.getCategory()}${category.getId()}" name="categories" value="${category.getCategory()}">
                                <c:out value="${category.getCategory()}" />
                        </label>
                    </div>
                </c:forEach>
            </div>
        </div>

        <div class="form-group">
            <label for="description">Description</label>
            <textarea id="description" name="description" class="form-control" type="text"></textarea>
        </div>

        <input type="submit" class="btn btn-block btn-primary">
    </form>
</div>
</body>
</html>
