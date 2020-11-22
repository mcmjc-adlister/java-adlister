<%--
  Created by IntelliJ IDEA.
  User: caleb
  Date: 11/19/20
  Time: 9:03 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Searched Ads"/>
    </jsp:include>
</head>
<body class="bgColor">
<jsp:include page="/WEB-INF/partials/navbar.jsp" />

<div class="container">
    <h1>Searched Ads</h1>
<%@ include file="../partials/adCards.jsp" %>
</div>

</body>
<jsp:include page="/WEB-INF/partials/footer.jsp"></jsp:include>
</html>
