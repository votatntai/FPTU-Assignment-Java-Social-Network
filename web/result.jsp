<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="_doctype.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<c:if test="${sessionScope.USER != null}">
    <div class="container">
        <c:if test="${requestScope.RESULT != null}">
            <c:forEach var="post" items="${requestScope.RESULT}">
                <div class="card card-bordered my-5">
                    <h5 class="card-header font-weight-bold text-primary">${post.email}<a href="PostDetails?txtId=${post.id}" class="float-right">${post.date}</a></h5>
                    <div class="card-body">
                        <h5 class="card-title">${post.title}</h5>
                        <p class="card-text">${post.content}</p>
                    </div>
                </div>
            </c:forEach>
        </c:if>
        <c:if test="${requestScope.RESULT == null || requestScope.RESULT.isEmpty()}">
            Not record found
        </c:if>
        <div class="text-center mb-5">
            <form class="d-inline mx-3" action="SearchController" method="POST">
                <input type="hidden" name="txtSearch" value="${param.txtSearch}">
                <input type="hidden" name="txtPageNumber" value="${param.txtPageNumber - 1}">
                <button class="btn btn-outline-info" type="submit">Previous</button>
            </form>
            <form class="d-inline mx-3" action="SearchController" method="POST">
                <input type="hidden" name="txtSearch" value="${param.txtSearch}">
                <input type="hidden" name="txtPageNumber" value="${param.txtPageNumber + 1}">
                <button class="btn btn-outline-info" type="submit">Next</button>
            </form>
        </div>
    </div>
</c:if>

<%@include file="_script.jsp" %>
