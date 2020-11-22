<%--
  Created by IntelliJ IDEA.
  User: caleb
  Date: 11/20/20
  Time: 3:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<button type="button" class="btn btn-primary mr-2" data-toggle="modal"
        data-target="#editModal"
        onclick='fillModal("${ad.getId()}", "${ad.getTitle()}", "${ad.getDescription()}")'>
    Edit
</button>
<button type="button" class="btn btn-danger"><a
        href="/ads/delete?id=${ad.getId()}"
        class="anchorStyleRemove">Delete</a>
</button>
