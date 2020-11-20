<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="navbar navbar-default navColor">
    <div class="container-fluid ">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <a class="navbar-brand textWhiteColor" href="/ads">Adlister</a>
        </div>
        <ul class="nav navbar-nav navbar-right">

            <jsp:include page="/WEB-INF/partials/searchBar.jsp" />

<%-- TODO add conditional logic to determine what's displayed --%>

            <c:if test="${sessionScope.user == null}">
            <li><a href = "/register" class="textWhiteColor"> Register </a></li>
            <li><a href = "/login" class="textWhiteColor"> Login </a></li>
            </c:if>
            <c:if test="${sessionScope.user != null}">
            <li><a href = "/logout" class="textWhiteColor"> Logout </a ></li >
            </c:if>
        </ul>
    </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
