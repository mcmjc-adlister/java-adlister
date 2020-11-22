<%--
  Created by IntelliJ IDEA.
  User: caleb
  Date: 11/20/20
  Time: 3:52 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="row justify-content-center">
    <c:forEach items="${usersAds}" var="ad">
        <div class="col-auto mb-5">
            <div class="card h-100" style="width: 30rem;">
                <div class="d-flex card-header">
                    <a href="/show?id=${ad.getId()}" class="mr-auto"><h4><c:out
                            value="${ad.title}"/></h4>
                    </a>
                    <c:if test="${user.getId() == ad.getUserId()}">
                        <%@ include file="cardButtons.jsp" %>
                    </c:if>
                </div>
                <div class="card-body pb-0">
                    <p class="card-title"><c:out value="${ad.description}"/></p>
                    <p class="text-right mb-1 mr-1" style="font-size: small;"><c:out
                            value="Posted on: ${ad.timestamp}"/></p>
                </div>
            </div>
        </div>
    </c:forEach>
</div>
