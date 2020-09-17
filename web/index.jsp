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
                    <div class="row" style="margin-right: 0">
                        <div class="col-md-6 form-group">
                            <input class="form-control" name="txtTitle" placeholder="Title" required="">
                        </div>
                        <div class="col-md-6 custom-file">
                            <input type="file" class="custom-file-input" id="upload">
                            <label class="custom-file-label">Choose a picture...</label>
                        </div>
                    </div>
                    <div class="form-group">
                        <textarea class="form-control" name="txtContent" rows="3" placeholder="Content" required=""></textarea>
                    </div>
                    <input type="hidden" class="form-control" name="txtImage" value="" id="image" />
                    <button class="btn btn-primary float-right px-5" type="submit">Post</button>
                </div>
                <div class="col-md-4">
                    <div class="view text-center">
                        <img class="rounded" src="" id="show-image" alt="" width="200">
                    </div>
                </div>
            </div>
        </form>
    </div>
    <c:if test="${sessionScope.USER != null}">
        <div class="card p-3 mb-5 card-bordered">
            <form class="d-inline mb-2" action="GetNoticeController" method="POST">
                <input type="hidden" name="txtEmail" value="${sessionScope.USER.email}">
                <button class="btn btn-outline-danger float-right" type="submit">Get Notice</button>
            </form>
            <c:if test="${requestScope.NOTICES != null}">
                <c:forEach var="notice" items="${requestScope.NOTICES}">
                    <a class="my-2" href="PostDetails?txtId=${notice.postId}">
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
