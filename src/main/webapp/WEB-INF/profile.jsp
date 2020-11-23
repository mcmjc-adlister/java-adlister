<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile"/>
    </jsp:include>
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/css/bootstrap-select.min.css">
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

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/js/bootstrap-select.min.js"></script>

</body>
<jsp:include page="/WEB-INF/partials/footer.jsp"></jsp:include>
</html>
