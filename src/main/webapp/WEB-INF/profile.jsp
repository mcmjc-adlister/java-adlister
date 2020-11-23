<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile"/>
    </jsp:include>
</head>
<body class="bgColor">
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>
<div class="container-fluid">

    <h1 class="my-4 text-center titleFont">Welcome, ${sessionScope.user.username}!<a href="${pageContext.request.contextPath}/update"
                                                  class="btn btn-primary ml-5" role="button">Edit Profile</a></h1>
    <c:choose>
        <c:when test="${usersAds.isEmpty()}">
            <h2 class="subtitleFont">No Rads posted <a href="/ads/create" class="btn btn-primary ml-4" role="button">Create an Ad</a></h2>
        </c:when>
        <c:otherwise>
            <h2 class="subtitleFont text-center">Your Rads: <a href="/ads/create" class="btn btn-primary ml-4" role="button">Create a Rad</a></h2>
            <%@ include file="partials/adCards.jsp" %>
        </c:otherwise>
    </c:choose>
</div>
</body>
<jsp:include page="/WEB-INF/partials/footer.jsp" />
</html>
