<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile"/>
    </jsp:include>
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/css/bootstrap-select.min.css">
</head>
<body class="bgColor">
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>
<div class="container-fluid">

    <h1>Welcome, ${sessionScope.user.username}!<a href="${pageContext.request.contextPath}/update"
                                                  class="btn btn-primary ml-5" role="button">Edit Profile</a></h1>
    <c:choose>
        <c:when test="${usersAds.isEmpty()}">
            <h2>No Rads posted. <a href="/ads/create" class="btn btn-primary ml-4" role="button">Create an Ad</a></h2>
        </c:when>
        <c:otherwise>
            <h2 class="text-center">Your Rads <a href="/ads/create" class="btn btn-primary ml-4" role="button">Create an Ad</a></h2>
            <div class="row justify-content-center">
                <c:forEach items="${usersAds}" var="ad">
                    <div class="col-auto mb-5">
                        <div class="card h-100" style="width: 30rem;">
                            <div class="d-flex card-header">
                                <a href="/show?id=${ad.getId()}" class="mr-auto"><h4><c:out
                                        value="${ad.title}"/></h4>
                                </a>
                                <c:if test="${user.getId() == ad.getUserId()}">
                                    <button type="button" class="btn btn-primary mr-2" data-toggle="modal"
                                            data-target="#editModal"
                                            onclick="fillModal('${ad.getId()}', '${ad.getTitle()}', '${ad.getDescription()}', '${adCategories.get(ad.getId())}', '${categoryNames}')">
                                        Edit
                                    </button>
                                    <button type="button" class="btn btn-danger"><a
                                            href="/ads/delete?id=${ad.getId()}"
                                            class="anchorStyleRemove">Delete</a>
                                    </button>
                                </c:if>
                            </div>
                            <div class="card-body pb-0">
                                <p class="card-title"><c:out value="${ad.description}"/></p>


                                <div class="row justify-content-between">
                                    <div>
                                        <span class="pr-2" style="font-size: 12px;">Categories:</span>
                                        <c:forEach items="${adCategories.get(ad.getId())}" var="cats">
                                            <c:forEach items="${cats}" var="cat">
                                                <a class="pr-2" style="font-size: 12px;" href="/view?category=${cat}"><c:out value="${cat}"/></a>
                                            </c:forEach>
                                        </c:forEach>
                                    </div>

                                    <p class="text-right mb-1 mr-1" style="font-size: small;"><c:out
                                        value="Posted on: ${ad.timestamp}"/></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </c:otherwise>
    </c:choose>
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
                        <label>Categories:
                            <select class="selectpicker" data-width="fit" data-max-options="3" name="newCategories"
                                    id="newCategories" multiple>
                                <c:forEach items="${categoryNames}" var="name">
                                    <option value="${name}" id="${name}">${name}</option>
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
</div>
<script>
    function fillModal(id, title, description, adCats, catNames) {
        document.getElementById('id').value = id;
        document.getElementById('title').value = title;
        document.getElementById('description').value = description;

        let str = adCats.replace("[", "").replace("]", "");
        let cats = catNames.replace("[", "").replace("]", "");

        for (let cat of cats.split(",")) {
            let option = document.getElementById(cat.trim());

            for (let s of str.split(",")) {
                console.log("s = " + s.trim());
                if (cat.trim() === s.trim()) {
                    option.selected = true;
                }
            }
        }

        $('.selectpicker').selectpicker('refresh');
    }

    function submitTest() {

        let err = document.getElementById("errorMsg");

        console.log(document.getElementById("newCategories").value);

        if (document.getElementById("title").value.trim().length === 0) {
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
