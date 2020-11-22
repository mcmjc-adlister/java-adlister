<%--
  Created by IntelliJ IDEA.
  User: caleb
  Date: 11/22/20
  Time: 12:10 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
        <div class="card mt-5">
            <div class="d-flex card-header">
                <h2 class="mr-auto"><c:out value="${ad.getTitle()}"/></h2>
                <c:if test="${user.getId() == ad.getUserId()}">
                    <%@ include file="cardButtons.jsp" %>
                </c:if>
            </div>
            <div class="card-body pb-0">
                <p class="card-title"><c:out value="${ad.description}"/></p>
                <ul class="card-subtitle d-flex m-0 p-0 pt-1" style="list-style: none; font-size: 12px">
                    <li class="pr-2">Categories:</li>
                    <c:forEach items="${adCategories}" var="category">
                        <li class="pr-2"><a href="/view?category=${category}"><c:out value="${category}"/></a></li>
                    </c:forEach>
                    <li class="ml-auto">
                        <p class="text-right mb-1 mr-1" style="font-size: small;"><c:out
                                value="posted by ${poster.getUsername()} at ${ad.getTimestamp().toString()} UTC"/></p>
                    </li>
                </ul>

            </div>
        </div>

