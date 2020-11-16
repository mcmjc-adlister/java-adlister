<%--
  Created by IntelliJ IDEA.
  User: jwmcnay
  Date: 11/16/20
  Time: 4:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<c:out value="ID = ${ad.getId()}" />
<c:out value="UserId = ${ad.getUserId()}" />
<c:out value="Title = ${ad.getTitle()}" />
<c:out value="Description = ${ad.getDescription()}" />

</body>
</html>
