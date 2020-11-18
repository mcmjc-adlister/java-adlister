<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The Ads" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />

<div class="container">
    <h1>Here Are all the ads!</h1>

    <%-- TODO display categories and sort ads into category sections --%>

    <c:forEach var="ad" items="${ads}">
        <div class="col-md-6">
        <%-- TODO make ads clickable to go to its own page -> show.jsp?id= --%>
            <a href="show?id=${ad.getId()}"><h2>${ad.title}</h2></a>
            <p>${ad.description}</p>
        </div>
    </c:forEach>
</div>

</body>
</html>
