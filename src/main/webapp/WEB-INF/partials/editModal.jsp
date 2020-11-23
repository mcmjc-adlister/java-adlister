<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                    <input type="hidden" name="id" id="modalId" value="${ad.id}">
                    <label>
                        Title<br>
                        <input type="text" id="modalTitle" name="title">
                    </label>
                    <label>Categories: (select up to three)
                        <select class="selectpicker" data-width="fit" data-max-options="3" name="newCategories"
                                id="newCategories" multiple>
                            <c:forEach items="${categoryNames}" var="category">
                                <option value="${category}">${category}</option>
                            </c:forEach>
                        </select>
                    </label>
                    <label>
                        Description<br>
                        <textarea id="modalDescription" name="description"></textarea>
                    </label>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="sumbit" class="btn btn-primary" form="editAd">Save changes</button>
            </div>
        </div>
    </div>
</div>