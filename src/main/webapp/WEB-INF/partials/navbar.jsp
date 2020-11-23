<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="navbar navbar-default navColor justify-content-between align-bottom">
    <div class="navbar-header">
        <a class="navbar-brand textWhiteColor" href="/">
        <img src="<c:url value="/img/rad.png"/>" alt="" height="75" width="100">
        </a>
        <a class="logoFont text-white" href="/ads">View all Rads</a>
    </div>
    <div class="d-inline-flex align-items-center logoFont">
        <jsp:include page="/WEB-INF/partials/searchBar.jsp" />
        <c:if test="${sessionScope.user == null}">
            <a href = "/register" class="text-white mr-4"> Register </a>
            <a href = "/login" class="text-white mr-4"> Login </a>
        </c:if>
        <c:if test="${sessionScope.user != null}">
            <a href="/ads/create" class="text-white mr-4">Create Ad</a>
            <a href="/profile" class="text-white mr-4">Profile</a>
            <a href = "/logout" class="text-white mr-4"> Logout </a>
        </c:if>
    </div>

</nav>
