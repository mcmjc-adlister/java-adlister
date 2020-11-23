<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="partials/head.jsp">
        <jsp:param name="title" value="Filter Results"/>
    </jsp:include>
</head>
<body class="bgColor">
    <jsp:include page="partials/navbar.jsp"/>
    <h3 class="text-center"><c:out value="${cat}"/></h3>
    <%@ include file="partials/adCards.jsp" %>
</body>
<jsp:include page="/WEB-INF/partials/footer.jsp"></jsp:include>
</html>
