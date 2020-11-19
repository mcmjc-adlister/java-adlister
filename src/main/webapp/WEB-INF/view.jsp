<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="partials/head.jsp">
        <jsp:param name="title" value="Filter Results" />
    </jsp:include>
</head>
<body>

<h3><c:out value="${cat}" /></h3>

<c:forEach items="${ads}" var="ad">
    <a href="/show?id=${ad.getId()}"><c:out value="${ad.getTitle()}" /></a>
</c:forEach>

</body>
</html>
