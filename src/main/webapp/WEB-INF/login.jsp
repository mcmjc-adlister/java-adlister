<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Please Log In" />
    </jsp:include>
</head>
<body class="bgColor">
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />
    <div class="container">
        <h1>Please Log In</h1>
        <form action="/login" method="POST">
            <div class="form-group">
                <label for="username">Username</label>
<%--                Sticky forms check--%>
                <c:choose>
<%--                If an enteredUsername value is passed in, fill it as the value for this input--%>
                    <c:when test="${!(enteredUsername.equals(null))}">
                        <input id="username" name="username" class="form-control" type="text" value="${enteredUsername}">
                    </c:when>
<%--                Otherwise, as normal--%>
                    <c:otherwise>
                        <input id="username" name="username" class="form-control" type="text">
                    </c:otherwise>
                </c:choose>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <jsp:include page="partials/error.jsp"/>
                <input id="password" name="password" class="form-control" type="password">
            </div>
            <input type="submit" class="btn btn-primary btn-block" value="Log In">
        </form>
    </div>
<jsp:include page="partials/JQuery.jsp" />
</body>
<jsp:include page="/WEB-INF/partials/footer.jsp"></jsp:include>
</html>
