<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile" />
    </jsp:include>
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />

    <div class="container">
        <h1>Welcome, ${sessionScope.user.username}!</h1>
        <c:choose>
            <c:when test="${usersAds.isEmpty()}">
                <h2>No ads posted.</h2>
            </c:when>
            <c:otherwise>
                <h2>Your Ads</h2>
                <c:forEach items="${usersAds}" var="ad">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">${ad.title}</h4>
                            <h5 class="card-title">${ad.description}</h5>
                            <span>${ad.timestamp}</span>
                        </div>
                    </div>
                </c:forEach>
            </c:otherwise>
        </c:choose>
    </div>

</body>
</html>
