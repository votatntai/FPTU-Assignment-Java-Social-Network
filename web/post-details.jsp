<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="_doctype.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<c:if test="${sessionScope.USER != null}">
    <div class="container my-5">
        <c:if test="${requestScope.POST != null}">
            <div class="card card-bordered">
                <h5 class="card-header font-weight-bold text-primary">Author - ${requestScope.POST.email}</h5>
                <div class="card-body">
                    <h5 class="card-title">${requestScope.POST.title}</h5>
                    <p class="card-text">${requestScope.POST.content}</p>
                    <form class="d-inline" action="LikeController" method="POST">
                        <input type="hidden" name="txtEmail" value="${sessionScope.USER.email}">
                        <input type="hidden" name="txtPostId" value="${requestScope.POST.id}">
                        <button type="submit" class="btn btn-outline-primary mr-3"><i class="far fa-thumbs-up"></i></button>
                    </form>
                    <form class="d-inline" action="DislikeController" method="POST">
                        <input type="hidden" name="txtEmail" value="${sessionScope.USER.email}">
                        <input type="hidden" name="txtPostId" value="${requestScope.POST.id}">
                        <button type="submit" class="btn btn-outline-primary mr-3"><i class="far fa-thumbs-down"></i></button>
                    </form>
                    <p class="d-inline float-right"><span class="text-primary">${requestScope.POST.like}</span> Like and <span class="text-primary">${requestScope.POST.dislike}</span> Dislike</p>
                </div>
                <div class="card-footer">
                    <form action="CommentController" method="POST">
                        <input type="hidden" name="txtPostId" value="${requestScope.POST.id}">
                        <c:if test="${sessionScope.USER != null}">
                            <input type="hidden" name="txtEmail" value="${sessionScope.USER.email}">
                        </c:if>
                        <div class="form-group">
                            <textarea class="form-control" rows="2" name="txtContent" placeholder="Comment" required=""></textarea>
                        </div>
                        <input type="submit" class="btn btn-primary text-right" name="action" value="Comment">
                    </form>
                    <c:if test="${requestScope.COMMENTS != null}">
                        <c:forEach var="comment" items="${requestScope.COMMENTS}">
                            <div class="card-body">
                                <div class="card p-3">
                                    <span class="font-weight-bold text-primary">${comment.email}</span>
                                    <span>${comment.content}</span>
                                </div>
                            </div>
                        </c:forEach>
                    </c:if>
                </div>
            </div>
        </c:if>
    </div>
</c:if>
F
<%@include file="_script.jsp" %>
