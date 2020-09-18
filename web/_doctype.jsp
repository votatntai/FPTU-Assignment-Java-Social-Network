<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Mini Social Network</title>
        <link rel="stylesheet" href="ASSET/css/bootstrap.min.css" />
        <link rel="stylesheet" href="ASSET/css/style.css" />
        <link rel="stylesheet" href="ASSET/css/sweetalert2.min.css" />
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">
        <link href="https://fonts.googleapis.com/css2?family=Roboto+Condensed&display=swap" rel="stylesheet">
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-light">
            <div class="container-fluid">
                <a class="navbar-brand text-primary font-weight-bold" href="LogoutController">Fakebook</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item active">
                            <form action="SearchController" class="form-inline" method="POST">
                                <input type="hidden" name="txtPageNumber" value="1">
                                <input class="form-control mr-sm-2 my-1" type="search" name="txtSearch" placeholder="Search" aria-label="Search">
                                <button class="btn btn-outline-primary my-1" type="submit">Search</button>
                            </form>
                        </li>
                    </ul>
                    <c:if test="${sessionScope.USER == null}">
                        <div class="form-inline my-2 my-lg-0">
                            <a class="btn btn-outline-primary px-5" href="login.jsp">Login</a>
                        </div>
                    </c:if>
                    <c:if test="${sessionScope.USER != null}">
                        <div class="form-inline my-2 my-lg-0">
                            <a class="btn btn-outline-primary px-5" href="index.jsp">${sessionScope.USER.name}</a>
                        </div>
                    </c:if>
                </div>
            </div>
        </nav>