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

    <div class="container-fluid">
        <h1>Welcome, ${sessionScope.user.username}!</h1>
    </div>

        <button><a href="${pageContext.request.contextPath}/update">Edit Profile</a></button>
        <c:choose>
            <c:when test="${usersAds.isEmpty()}">
                <h2>No ads posted.</h2>
            </c:when>
            <c:otherwise>
                <h2 class="text-center">Your Ads</h2>
                <div class="row justify-content-center">
                    <c:forEach items="${usersAds}" var="ad">
                        <div class="col-auto mb-5">
                            <div class="card h-100" style="width: 30rem;">
                                <div class="card-body">
                                    <h4 class="card-title text-center">${ad.title}</h4>
                                    <p class="card-title">${ad.description}</p>
                                    <p class="text-right" style="font-size: small;">Posted on: ${ad.timestamp}</p>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>
