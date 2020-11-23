<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The Ads" />
    </jsp:include>
</head>
<body class="bgColor">
<jsp:include page="/WEB-INF/partials/navbar.jsp" />

<div class="container">
    <h1 class="titleFont my-4 text-center">Current Rads:</h1>
    <jsp:include page="../partials/adCards.jsp" />
</div>
</body>
<jsp:include page="/WEB-INF/partials/footer.jsp" />

</html>
