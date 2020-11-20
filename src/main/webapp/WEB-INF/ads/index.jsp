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
    <div class="row justify-content-center">
    <c:forEach var="ad" items="${ads}">
        <div class="col-auto md-6">
            <div class="card h-100 shadow p-3 mb-5 bg-white rounded" style="width: 30rem;">
                <div class="card-body cardColor shadow rounded">
        <%-- TODO make ads clickable to go to its own page -> show.jsp?id= --%>
            <a href="show?id=${ad.getId()}"><h2 class="card-title text-center textWhiteColor"><c:out value="${ad.title}" /></h2></a>
            <p><c:out value="${ad.description}" /></p>
                </div>
            </div>
        </div>

    </c:forEach>
    </div>
</div>

<jsp:include page="../partials/JQuery.jsp" />
</body>
<jsp:include page="/WEB-INF/partials/footer.jsp"></jsp:include>
</html>
