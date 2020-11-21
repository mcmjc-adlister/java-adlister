<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="navbar navbar-default navColor justify-content-between align-bottom">
    <div class="navbar-header">
<%--        <img src="<c:url value="/img/rad.png"/>" alt="" width="100" height="100">--%>
        <img src="${pageContext.request.contextPath}img/bolt.png" alt=""  width="30" height="30">
        <img src="img/rad.png" alt=""  width="100" height="100">

        <a class="navbar-brand textWhiteColor" href="/ads">RadLister</a>
    </div>
    <div class="d-inline-flex align-items-center">
        <jsp:include page="/WEB-INF/partials/searchBar.jsp" />
        <c:if test="${sessionScope.user == null}">
            <a href = "/register" class="textWhiteColor mr-4"> Register </a>
            <a href = "/login" class="textWhiteColor mr-4"> Login </a>
        </c:if>
        <c:if test="${sessionScope.user != null}">
            <a href="/ads/create" class="textWhiteColor mr-4">Create Ad</a>
            <a href="/profile" class="textWhiteColor mr-4">Profile</a>
            <a href = "/logout" class="textWhiteColor mr-4"> Logout </a>
        </c:if>
    </div>
</nav>
