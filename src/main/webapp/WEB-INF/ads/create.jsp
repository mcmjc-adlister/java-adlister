<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Create a new Ad"/>
    </jsp:include>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/css/bootstrap-select.min.css">
    <script src="https://kit.fontawesome.com/6fa36e9c98.js" crossorigin="anonymous"></script>
</head>
<body class="bgColor">
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
        <label>Categories: (select up to three)
            <select class="selectpicker" data-width="fit" data-max-options="3" name="newCategories" id="newCategories" multiple>
                <c:forEach items="${categories}" var="category">
                    <option value="${category.getCategory()}">${category.getCategory()}</option>
                </c:forEach>
            </select>
        </label>
        <div class="row justify-content-around w-25" id="catsToAdd"></div>
        <div class="form-group">
            <label for="description">Description</label>
            <c:choose>
                <%--If an enteredDescription value is passed in, fill it as the value for this input--%>
                <c:when test="${!(enteredDescription.equals(null))}">
                    <textarea id="description" name="description" class="form-control"
                              type="text">${enteredDescription}</textarea>
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

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/js/bootstrap-select.min.js"></script>
</html>
