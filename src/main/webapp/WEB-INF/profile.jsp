<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile"/>
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>

<div class="container-fluid">
    <h1>Welcome, ${sessionScope.user.username}!</h1>

    <button><a href="${pageContext.request.contextPath}/update">Edit Profile</a></button>
    <input type="hidden" name="id" id="id" form="editAd">
    <c:choose>
        <c:when test="${usersAds.isEmpty()}">
            <h2>No ads posted.</h2>
        </c:when>
        <c:otherwise>
            <h2 class="text-center">Your Ads</h2>
            <div class="row justify-content-center">
                <c:forEach items="${usersAds}" var="ad">
                    <div class="col-auto mb-5">
                        <div class="card h-100" style="width: 30rem;">
                            <div class="card-body">
                                <a href="/show?id=${ad.getId()}"><h4 class="card-title text-center"><c:out
                                        value="${ad.title}"/></h4></a>
                                <p class="card-title"><c:out value="${ad.description}"/></p>
                                <p class="text-right" style="font-size: small;"><c:out
                                        value="Posted on: ${ad.timestamp}"/></p>
                            </div>
                        </div>
                            <%-- TODO add ability to edit ad --%>
                        <c:if test="${user.getId() == ad.getUserId()}">
                            <button type="button" class="btn btn-primary" data-toggle="modal"
                                    data-target="#editModal" onclick='fillModal("${ad.getId()}", "${ad.getTitle()}", "${ad.getDescription()}")'>
                                Edit
                            </button>
                            <a href="/ads/delete?id=${ad.getId()}">Delete</a>
                        </c:if>
                    </div>
                    <!-- Modal -->
                </c:forEach>
            </div>
        </c:otherwise>
    </c:choose>

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

</div>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
<script>
    function fillModal(id, title, description) {
        console.log("works");

        document.getElementById('id').value = id
        document.getElementById('title').value = title
        document.getElementById('description').value = description
    }
</script>
</body>
</html>
