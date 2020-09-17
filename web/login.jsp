<%@include file="_doctype.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<div class="container">
    <div class="row">
        <div class="col-md-6 mt-5">
            <div class="card p-3 card-bordered">
                <form action="LoginController" method="POST" id="form-login">
                    <h3 class="font-weight-bold text-muted text-uppercase">Login</h3>
                    <div class="form-group">
                        <label>Email</label>
                        <input type="email" class="form-control" name="txtEmail" placeholder="Enter email" required="">
                    </div>
                    <div class="form-group">
                        <label>Password</label>
                        <input type="password" class="form-control" name="txtPassword" placeholder="Password" required="">
                    </div>
                    <input type="submit" class="btn btn-primary float-right" name="action" value="Login">
                </form>
            </div>
        </div>
        <div class="col-md-6 mt-5">
            <div class="card p-3 card-bordered">
                <form action="RegisterController" method="POST" id="form-register">
                    <h3 class="font-weight-bold text-muted text-uppercase">Register</h3>
                    <div class="form-group">
                        <label>Email</label>
                        <input type="email" class="form-control" name="txtEmail" placeholder="Enter email" required="">
                    </div>
                    <div class="form-group">
                        <label>Name</label>
                        <input type="text" class="form-control" name="txtName" placeholder="Fullname" required="">
                    </div>
                    <div class="form-group">
                        <label>Password</label>
                        <input type="password" class="form-control" name="txtPassword" placeholder="Password" required="">
                    </div>
                    <div class="form-group">
                        <label>Confirm Password</label>
                        <input type="password" class="form-control" name="txtConfirm" placeholder="Confirm Password" required="">
                    </div>
                    <input type="submit" class="btn btn-info float-right" name="action" value="Register">
                </form>
            </div>
        </div>
    </div>
</div>

<%@include file="_script.jsp" %>
