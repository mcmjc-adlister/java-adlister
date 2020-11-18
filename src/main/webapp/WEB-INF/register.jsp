<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <jsp:include page="partials/head.jsp">
        <jsp:param name="title" value="Register For Our Site!" />
    </jsp:include>
</head>
<body>
    <jsp:include page="partials/navbar.jsp" />
    <div class="container">
        <h1>Please fill in your information.</h1>
        <form action="/register" method="post">
            <div class="form-group">
                <jsp:include page="partials/error.jsp"/>
                <label for="username">Username</label>
                <c:if test="${requestScope.usernameError != null}">
                    <div class="alert alert-danger" role="alert">
                            ${requestScope.usernameError}
                    </div>
                </c:if>
                <%--Sticky forms check for Username--%>
                <c:choose>
                    <%--If an enteredUsername value is passed in, fill it as the value for this input--%>
                    <c:when test="${!(enteredUsername.equals(null))}">
                        <input id="username" name="username" class="form-control" type="text" value="${enteredUsername}">
                    </c:when>
                    <%--Otherwise, as normal--%>
                    <c:otherwise>
                        <input id="username" name="username" class="form-control" type="text">
                    </c:otherwise>
                </c:choose>
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <c:if test="${requestScope.emailError != null}">
                    <div class="alert alert-danger" role="alert">
                            ${requestScope.emailError}
                    </div>
                </c:if>
                <%--Sticky forms check for email--%>
                <c:choose>
                    <%--If an enteredEmail value is passed in, fill it as the value for this input--%>
                    <c:when test="${!(enteredEmail.equals(null))}">
                        <input id="email" name="email" class="form-control" type="text" value="${enteredEmail}">
                    </c:when>
                    <%--Otherwise, as normal--%>
                    <c:otherwise>
                        <input id="email" name="email" class="form-control" type="text">
                    </c:otherwise>
                </c:choose>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input id="password" name="password" class="form-control" type="password">
            </div>
            <div class="form-group">
                <label for="confirm_password">Confirm Password</label>
                <input id="confirm_password" name="confirm_password" class="form-control" type="password">
            </div>
            <input type="submit" class="btn btn-primary btn-block">
        </form>
    </div>
</body>
</html>
