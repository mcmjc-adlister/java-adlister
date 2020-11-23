<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<form method="get" action="${pageContext.request.contextPath}/ads/edit">
    <input type="hidden" name="id" value="${ad.id}">
<%--    <button type="button" class="btn btn-primary mr-2" data-toggle="modal"--%>
<%--        data-target="#editModal" id="btn${ad.id}">--%>
<%--    Edit--%>
<%--    </button>--%>
    <button type="button" class="btn btn-danger"><a
        href="${pageContext.request.contextPath}/ads/delete?id=${ad.getId()}"
        class="anchorStyleRemove">Delete</a>
    </button>
</form>

<script>

    document.getElementById("btn${ad.id}").addEventListener("click", function(event){
        event.preventDefault()
        document.getElementById("modalTitle").value = "${ad.title}";
        document.getElementById("modalDescription").value = '${ad.getDescription()}';
    });

</script>