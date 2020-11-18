<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="partials/head.jsp">
        <jsp:param name="title" value="Filter Results" />
    </jsp:include>
</head>
<body>

<c:forEach items="${ads}" var="ad">
    ${ad.getTitle()}
</c:forEach>

</body>
</html>
