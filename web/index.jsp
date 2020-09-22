<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="_doctype.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<div class="container my-5">
    <div class="card p-3 mb-5 card-bordered">
        <form action="CreatePostController" method="POST" id="form-create-post">
            <h4>Bạn đang nghĩ gì?</h4>
            <c:if test="${sessionScope.USER != null}">
                <input type="hidden" name="txtEmail" value="${sessionScope.USER.email}">
            </c:if>
            <div class="row">
                <div class="col-md-8">
                    <div class="form-group">
                        <input class="form-control" name="txtTitle" placeholder="Title" required="">
                    </div>
                    <div class="form-group">
                        <textarea class="form-control" name="txtContent" rows="3" placeholder="Content" required=""></textarea>
                    </div>
                    <input type="hidden" class="form-control" name="txtImage" value="" id="image" />
                    <div class="row ml-0">
                        <div class="col-md-6 custom-file">
                            <input type="file" class="custom-file-input" id="upload">
                            <label class="custom-file-label">Choose a picture...</label>
                        </div>
                        <div class="col-md-6">
                            <button class="btn btn-outline-primary float-right px-5" type="submit">Post</button>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="view text-center">
                        <img class="rounded" src="ASSET/img/default.jpg" id="show-image" alt="" width="250">
                    </div>
                </div>
            </div>
        </form>
    </div>
    <c:if test="${sessionScope.USER != null}">
        <div class="card p-3 mb-5 card-bordered">
            <div class="alert alert-success mb-0" role="alert">
                <form class="mb-2" action="GetNoticeController" method="POST">
                    <input type="hidden" name="txtEmail" value="${sessionScope.USER.email}">
                    <button class="btn btn-outline-danger" type="submit">Notifications !!!</button>
                </form>
                <p>Aww yeah, you successfully read this important alert message. This example text is going to run a bit longer so that you can see how spacing within an alert works with this kind of content.</p>
            </div>
            <c:if test="${requestScope.NOTICES != null}">
                <c:forEach var="notice" items="${requestScope.NOTICES}">
                    <a class="mt-3" href="PostDetails?txtId=${notice.postId}">
                        <div class="card p-2 card-bordered p-3">
                            <p class="mb-0"><span class="font-weight-bold">${notice.email}</span> ${notice.content} <span class="text-success">${notice.date}</span></p>
                        </div>
                    </a>
                </c:forEach>
            </c:if>
        </div>
    </c:if>
</div>

<%@include file="_script.jsp" %>
