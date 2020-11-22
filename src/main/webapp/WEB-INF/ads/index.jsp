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
    <h1>Here Are all the ads!</h1>

    <%-- TODO display categories and sort ads into category sections --%>
    <%@ include file="../partials/adCards.jsp" %>
<%--    <c:forEach var="ad" items="${ads}">--%>
<%--        <div class="col-md-6">--%>
<%--        &lt;%&ndash; TODO make ads clickable to go to its own page -> show.jsp?id= &ndash;%&gt;--%>
<%--            <a href="show?id=${ad.getId()}"><h2><c:out value="${ad.title}" /></h2></a>--%>
<%--            <p><c:out value="${ad.description}" /></p>--%>
<%--        </div>--%>
<%--    </c:forEach>--%>
</div>

<jsp:include page="../partials/JQuery.jsp" />
</body>
<jsp:include page="/WEB-INF/partials/footer.jsp"></jsp:include>
</html>
