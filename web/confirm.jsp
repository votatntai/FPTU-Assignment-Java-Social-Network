<%@include file="_doctype.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${sessionScope.CODE != null}">
    <div class="container">
        <div class="card card-bordered p-4 my-5">
            <div class="alert alert-success" role="alert">
                <h3 class="font-weight-bold text-muted mb-0">Verify your account</h3>
            </div>
            <form action="VerifyController" method="POST" id="form-verify">
                <input type="hidden"name="txtEmail" value="${sessionScope.EMAIL}">
                <div class="row">
                    <div class="col-md-8">
                        <input type="number" class="form-control" name="txtCode" placeholder="Verify Code" required="">
                    </div>
                    <div class="col-md-4">
                        <input type="submit" class="btn btn-outline-primary btn-block" name="action" value="Confirm">
                    </div>
                </div>
            </form>
        </div>
    </div>
</c:if>

<%@include file="_script.jsp" %>
