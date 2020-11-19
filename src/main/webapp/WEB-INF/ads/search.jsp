<%--
  Created by IntelliJ IDEA.
  User: caleb
  Date: 11/19/20
  Time: 9:03 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Searched Ads"/>
    </jsp:include>
</head>
<body>
<h1>Search Page</h1>
<%--<div class="container">--%>
<%--    <h1>Create a new Ad</h1>--%>
<%--    <form action="/ads/search" method="post">--%>
<%--        <div class="form-group">--%>
<%--            <label for="title">Title</label>--%>
<%--            <input id="title" name="title" class="form-control" type="text">--%>
<%--        </div>--%>
<%--        <div class="container">--%>
<%--            <div class="row">--%>
<%--                <c:forEach items="${categories}" var="category">--%>
<%--                    <div class="col-2 checkbox-inline">--%>
<%--                        <label>--%>
<%--                            <input type="checkbox"--%>
<%--                                   id="${category.getCategory()}${category.getId()}" name="categories" value="${category.getCategory()}">--%>
<%--                                ${category.getCategory()}--%>
<%--                        </label>--%>
<%--                    </div>--%>
<%--                </c:forEach>--%>
<%--            </div>--%>
<%--        </div>--%>

<%--        <div class="form-group">--%>
<%--            <label for="description">Description</label>--%>
<%--            <textarea id="description" name="description" class="form-control" type="text"></textarea>--%>
<%--        </div>--%>
<%--        <input type="submit" class="btn btn-block btn-primary">--%>
<%--    </form>--%>
<%--</div>--%>
</body>
</html>
