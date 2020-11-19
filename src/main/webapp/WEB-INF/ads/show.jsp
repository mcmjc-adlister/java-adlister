<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="${ad.getTitle()}"/>
    </jsp:include>
</head>
<body>

<jsp:include page="/WEB-INF/partials/navbar.jsp"/>

<div class="container">
    <div class="card">
        <h2 class="card-title"><c:out value="${ad.getTitle()}"/></h2>
        <span class="card-subtitle"><c:out value="posted by ${poster.getUsername()} at ${ad.getTimestamp().toString()} UTC" /></span>
        <ul class="card-subtitle d-flex m-0 p-0 pt-1" style="list-style: none; font-size: 12px">
            <li class="pr-2">Categories:</li>
            <c:forEach items="${adCategories}" var="category">
                <li class="pr-2"><a href="/view?category=${category}"><c:out value="${category}" /></a></li>
            </c:forEach>
        </ul>
        <p class="card-text"><c:out value="${ad.getDescription()}"/></p>
    </div>
    <c:if test="${ad.getUserId() == user.getId()}">
        <input type="hidden" name="id" id="id" form="editAd">
        <button type="button" class="btn btn-primary" data-toggle="modal"
                data-target="#editModal" onclick='fillModal("${ad.getId()}", "${ad.getTitle()}", "${ad.getDescription()}")'>
            Edit
        </button>
        <a href="/ads/delete?id=${ad.getId()}">Delete</a>
        <div class="modal fade" id="editModal" tabindex="-1" role="dialog"
             aria-labelledby="editModalLabel"
             aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="editModalLabel">Edit Ad Info</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form method="POST" action="/ads/edit" id="editAd">
                            <label>
                                Title<br>
                                <input type="text" id="title" name="title">
                            </label>
                            <label>Categories:
                                <select class="custom-select" name="newCategories" id="newCategories"
                                        multiple>
                                    <c:forEach items="${categories}" var="category">
                                        <option value="${category.getCategory()}">${category.getCategory()}</option>
                                        <c:out value="${category.getCategory()}"/>
                                    </c:forEach>
                                </select>
                            </label>
                            <label>
                                Description<br>
                                <textarea id="description" name="description"></textarea>
                            </label>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary" form="editAd">Save changes</button>
                    </div>
                </div>
            </div>
        </div>
        <script>
            function fillModal(id, title, description) {
                document.getElementById('id').value = id
                document.getElementById('title').value = title
                document.getElementById('description').value = description
            }
        </script>
    </c:if>
</div>

</body>
</html>
