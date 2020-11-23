<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Welcome to my site!" />
    </jsp:include>
</head>
<body class="bgColor">
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />
    <div class="container">
        <h1 class="text-center my-4 titleFont">Welcome to RadLister!</h1>
        <h2 class="text-center subtitleFont mb-3">Here are some current Rads:</h2>
        <jsp:include page="WEB-INF/partials/adCards.jsp" />
    </div>
</body>
</html>
