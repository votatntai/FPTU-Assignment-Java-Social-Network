<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="_doctype.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<div class="container">
    <c:if test="${sessionScope.USER == null}">
        <div class="alert alert-danger my-5" role="alert">
            Sorry, you must login to use this feature !!!
        </div>
    </c:if>
    <c:if test="${sessionScope.USER != null}">
        <c:if test="${requestScope.RESULT != null}">
            <c:forEach var="post" items="${requestScope.RESULT}">
                <div class="card card-bordered my-5  h-100">
                    <h5 class="card-header font-weight-bold text-primary">${post.email}<a href="PostDetails?txtId=${post.id}" class="float-right">${post.date}</a></h5>
                    <div class="card-body">
                        <h5 class="card-title">${post.title}</h5>
                        <p class="card-text text-limit">${post.content}</p>
                    </div>
                </div>
            </c:forEach>
        </c:if>
        <c:if test="${requestScope.RESULT == null || requestScope.RESULT.isEmpty()}">
            <div class="alert alert-danger my-5" role="alert">
                No record found !!!
            </div>
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
    </c:if>
</div>

<%@include file="_script.jsp" %>
