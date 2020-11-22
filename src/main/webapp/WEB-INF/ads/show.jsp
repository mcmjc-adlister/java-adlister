<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="${ad.getTitle()}"/>
    </jsp:include>
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/css/bootstrap-select.min.css">
</head>
<body class="bgColor">

<jsp:include page="/WEB-INF/partials/navbar.jsp"/>

<div class="container">
    <%@ include file="../partials/adCard.jsp" %>

<%--    <c:if test="${ad.getUserId() == user.getId()}">--%>
<%--        <button type="button" class="btn btn-primary" data-toggle="modal"--%>
<%--                data-target="#editModal"--%>
<%--                onclick='fillModal("${ad.getId()}", "${ad.getTitle()}", "${ad.getDescription()}")'>--%>
<%--            Edit--%>
<%--        </button>--%>
<%--        <a href="/ads/delete?id=${ad.getId()}">Delete</a>--%>
<%--    </c:if>--%>

    <input type="hidden" name="id" id="id" form="editAd">
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
                    <span id="errorMsg"></span>
                    <form method="POST" action="/ads/edit" id="editAd">
                        <label>
                            Title<br>
                            <input type="text" id="title" name="title">
                        </label>
                        <label>Categories: (select up to three)
                            <select class="selectpicker" data-width="fit" data-max-options="3" name="newCategories"
                                    id="newCategories" multiple>
                                <c:forEach items="${categories}" var="category">
                                    <c:choose>
                                        <c:when test="${adCategories.contains(category.getCategory())}">
                                            <option value="${category.getCategory()}" selected>${category.getCategory()}</option>
                                        </c:when>
                                        <c:otherwise>
                                            <option value="${category.getCategory()}">${category.getCategory()}</option>
                                        </c:otherwise>
                                    </c:choose>
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
                    <button type="button" class="btn btn-primary" form="editAd" onclick="submitTest()">Save changes</button>
                </div>
            </div>
        </div>
    </div>
    <script>
        function fillModal(id, title, description) {
            document.getElementById('id').value = id;
            document.getElementById('title').value = title;
            document.getElementById('description').value = description;
        }

        function submitTest() {

            let err = document.getElementById("errorMsg");

            console.log(document.getElementById("newCategories").value);

            if (document.getElementById("title").value.trim().length === 0 ) {
                err.innerText = "A title must be entered";
            } else if (document.getElementById("description").value.trim().length === 0) {
                err.innerText = "A description must be entered";
            } else if (document.getElementById("newCategories").value === "") {
                err.innerText = "At least one category must be selected";
            } else {
                err.innerText = "";
                document.getElementById("editAd").submit();
            }
        }

    </script>
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
<script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/js/bootstrap-select.min.js"></script>
</body>
<jsp:include page="/WEB-INF/partials/footer.jsp"></jsp:include>
</html>
