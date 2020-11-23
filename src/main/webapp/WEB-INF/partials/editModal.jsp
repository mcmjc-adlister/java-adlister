<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
<%--                            <c:forEach items="${categories}" var="category">--%>
<%--                                <c:choose>--%>
<%--                                    <c:when test="${adCategories.contains(category.getCategory())}">--%>
<%--                                        <option value="${category.getCategory()}" selected>${category.getCategory()}</option>--%>
<%--                                    </c:when>--%>
<%--                                    <c:otherwise>--%>
<%--                                        <option value="${category.getCategory()}">${category.getCategory()}</option>--%>
<%--                                    </c:otherwise>--%>
<%--                                </c:choose>--%>
<%--                            </c:forEach>--%>
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