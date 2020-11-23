<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="${ad.getTitle()}"/>
    </jsp:include>
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/css/bootstrap-select.min.css">
</head>
<body class="bgColor">

<jsp:include page="/WEB-INF/partials/navbar.jsp"/>

<div class="container">
    <%@ include file="../partials/adCard.jsp" %>
</div>
</body>
<jsp:include page="/WEB-INF/partials/footer.jsp" />
</html>
