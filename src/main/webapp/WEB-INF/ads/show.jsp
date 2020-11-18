<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="${ad.getTitle()}"/>
    </jsp:include>
</head>
<body>

<jsp:include page="/WEB-INF/partials/navbar.jsp"/>

<div class="container">
    <div class="card">
        <h2 class="card-title"><c:out value="${ad.getTitle()}"/></h2>
        <span class="card-subtitle">posted by ${poster.getUsername()} at ${ad.getTimestamp().toString()} UTC</span>
        <ul class="card-subtitle d-flex m-0 p-0 pt-1" style="list-style: none; font-size: 12px">
            <li class="pr-2">Categories:</li>
            <c:forEach items="${categories}" var="category">
                <li class="pr-2"><a href="/view?category=${category}">${category}</a></li>
            </c:forEach>
        </ul>
        <p class="card-text"><c:out value="${ad.getDescription()}"/></p>
    </div>
    <%-- TODO add modal or other way to edit info and submit it to EditAdServlet;  --%>
    <c:if test="${ad.getUserId() == user.getId()}">
        <a href="#">Edit</a>
        <a href="/ads/delete?id=${ad.getId()}">Delete</a>
    </c:if>
</div>

</body>
</html>
