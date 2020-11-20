<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Create a new Ad"/>
    </jsp:include>
</head>
<body class="bgColor">
    <jsp:include page="/WEB-INF/partials/navbar.jsp"/>
    <div class="container">
        <h1>Create a new Ad</h1>
        <jsp:include page="/WEB-INF/partials/error.jsp"/>
        <form action="/ads/create" method="post">
            <div class="form-group">
                <label for="title">Title</label>
                <%--Sticky forms check--%>
                <c:choose>
                    <%--If an enteredTitle value is passed in, fill it as the value for this input--%>
                    <c:when test="${!(enteredTitle.equals(null))}">
                        <input id="title" name="title" class="form-control" type="text" value="${enteredTitle}">
                    </c:when>
                    <%--Otherwise, as normal--%>
                    <c:otherwise>
                        <input id="title" name="title" class="form-control" type="text">
                    </c:otherwise>
                </c:choose>
            </div>
            <label>Categories:
                <select class="custom-select" name="newCategories" id="newCategories"
                        multiple>
                    <c:forEach items="${categories}" var="category">
                        <option value="${category.getCategory()}">${category.getCategory()}</option>
                        <c:out value="${category.getCategory()}"/>
                    </c:forEach>
                </select>
            </label>
            <div class="form-group">
                <label for="description">Description</label>
                <c:choose>
                    <%--If an enteredDescription value is passed in, fill it as the value for this input--%>
                    <c:when test="${!(enteredDescription.equals(null))}">
                        <textarea id="description" name="description" class="form-control" type="text">${enteredDescription}</textarea>
                    </c:when>
                    <%--Otherwise, as normal--%>
                    <c:otherwise>
                        <textarea id="description" name="description" class="form-control" type="text"></textarea>
                    </c:otherwise>
                </c:choose>
            </div>
            <input type="submit" class="btn btn-block btn-primary">
        </form>
    </div>
</body>
<jsp:include page="/WEB-INF/partials/footer.jsp"></jsp:include>
</html>
