<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<c:out value="ID = ${ad.getId()}" />
<c:out value="UserId = ${ad.getUserId()}" />
<c:out value="Username = ${poster.getUsername()}" />
<c:out value="Title = ${ad.getTitle()}" />
<c:out value="Description = ${ad.getDescription()}" />
<c:out value="Timestamp = ${ad.getTimestamp().toString()}" />

<%-- TODO display categories --%>

</body>
</html>
