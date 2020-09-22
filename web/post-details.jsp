<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="_doctype.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<div class="container my-5">
    <c:if test="${sessionScope.USER == null}">
        <div class="alert alert-danger my-5" role="alert">
            Sorry, you must login to use this feature !!!
        </div>
    </c:if>
    <c:if test="${sessionScope.USER != null}">
        <c:if test="${requestScope.POST == null}">
            <div class="alert alert-danger my-5" role="alert">
                Sorry, this post does not exist or has been deleted !!!
            </div>
        </c:if>
        <c:if test="${requestScope.POST != null}">
            <div class="card card-bordered">
                <div class="card-header">
                    <h5 class="font-weight-bold text-primary d-inline">Author - ${requestScope.POST.email}</h5>
                    <c:if test="${requestScope.POST.email.equals(sessionScope.USER.email)}">
                        <form class="d-inline" action="RemovePostController" method="POST" id="delete-post">
                            <input type="hidden" name="txtId" value="${requestScope.POST.id}">
                            <button class="btn btn-sm btn-outline-danger float-right" type="submit">Delete</button>
                        </form>
                    </c:if>
                </div>
                <div class="card-body">
                    <img src="ASSET/img/${requestScope.POST.image}" class="w-100 card-bordered">
                    <h5 class="card-title mt-3">${requestScope.POST.title}</h5>
                    <p class="card-text">${requestScope.POST.content}</p>
                    <form class="form-reaction d-inline" action="LikeController" method="POST">
                        <input type="hidden" name="txtEmail" value="${sessionScope.USER.email}">
                        <input type="hidden" name="txtPostId" value="${requestScope.POST.id}">
                        <button type="submit" class="btn btn-outline-primary mr-3"><i class="far fa-thumbs-up"></i></button>
                    </form>
                    <form class="form-reaction d-inline" action="DislikeController" method="POST">
                        <input type="hidden" name="txtEmail" value="${sessionScope.USER.email}">
                        <input type="hidden" name="txtPostId" value="${requestScope.POST.id}">
                        <button type="submit" class="btn btn-outline-primary mr-3"><i class="far fa-thumbs-down"></i></button>
                    </form>
                    <p class="d-inline float-right"><span class="text-primary" id="likes">${requestScope.POST.like}</span> Like and <span class="text-primary" id="dislikes">${requestScope.POST.dislike}</span> Dislike</p>
                </div>
                <div class="card-footer">
                    <form action="CommentController" method="POST" id="form-comment">
                        <input type="hidden" name="txtPostId" value="${requestScope.POST.id}">
                        <c:if test="${sessionScope.USER != null}">
                            <input type="hidden" name="txtEmail" value="${sessionScope.USER.email}">
                        </c:if>
                        <div class="form-group">
                            <textarea class="form-control" rows="2" name="txtContent" placeholder="Comment" required=""></textarea>
                        </div>
                        <input type="submit" class="btn btn-primary text-right" name="action" value="Comment">
                    </form>
                    <div class="render-comment">
                        <c:if test="${requestScope.COMMENTS != null}">
                            <c:forEach var="comment" items="${requestScope.COMMENTS}">
                                <div class="card-body">
                                    <div class="card p-3">
                                        <div class="d-block">
                                            <c:if test="${comment.email.equals(sessionScope.USER.email)}">
                                                <form class="delete-comment d-inline" action="RemoveCommentController" method="POST">
                                                    <input type="hidden" name="txtId" value="${comment.id}">
                                                    <button class="btn btn-sm btn-outline-danger float-right line-height-1" type="submit">x</button>
                                                </form>
                                            </c:if>
                                            <div class="w-75">
                                                <span class="font-weight-bold text-primary">${comment.email}</span>
                                                <span>${comment.content}</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:if>
                    </div>
                </div>
            </div>
        </c:if>
    </c:if>
</div>

<%@include file="_script.jsp" %>
