<%-- 
    Document   : manageaccount
    Created on : Sep 28, 2022, 11:36:59 PM
    Author     : NamND
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin Page</title>
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet"
              href="fonts\FontAwesome.Pro.6.0.0.alpha3\fontawesome6\pro\css\all.min.css">
        <link rel="stylesheet" href="css/swiper-bundle.min.css">
        <link rel="stylesheet" href="css/accountmanagement.css">
    </head>

    <body>
        <div id="app">
            <div id="sidebar" class="active">
                <div class="sidebar-wrapper active">
                    <div class="sidebar-header">
                        <div class="d-flex justify-content-between">
                            <div class="logo logo1">
                                <a href="#"><img src="images/common/logo-icon.png" alt="Logo" srcset=""></a>
                            </div>
                            <div class="logo logo2">
                                <a href="#"><img src="images/common/logo.png" alt="Logo" srcset=""></a>
                            </div>
                            <div class="toggler">
                                <a href="#" class="sidebar-hide d-xl-none d-block"><i class="bi bi-x bi-middle"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="sidebar-menu">
                        <ul class="menu">
                            <li class="sidebar-title">Menu</li>

                            <li class="sidebar-item  ">
                                <a href="#" class='sidebar-link'>
                                    <i class="fa-solid fa-chart-line-up"></i>
                                    <span>Dashboard</span>
                                </a>
                            </li>
                            <li class="sidebar-item active ">
                                <a href="accountmanagement" class='sidebar-link'>
                                    <i class="fa-solid fa-id-card"></i>
                                    <span>Account Management</span>
                                </a>
                            </li>
                            <li class="sidebar-item">
                                <a href="adminblogmanagement" class='sidebar-link'>
                                    <i class="fa-solid fa-newspaper"></i>
                                    <span>Blog Management</span>
                                </a>
                            </li>
                            <li class="sidebar-item">
                                <a href="helpmanagement" class='sidebar-link'>
                                    <i class="fa-solid fa-id-card"></i>
                                    <span>Help Management</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <button class="sidebar-toggler btn x"><i data-feather="x"></i></button>
                </div>
            </div>
            <div id="main">
                <header class='mb-3'>
                    <nav class="navbar navbar-expand navbar-light navbar-admin">
                        <div class="container-fluid">
                            <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                                <li class="nav-item dropdown me-1">
                                    <a class="nav-link active dropdown-toggle" href="#" data-bs-toggle="dropdown"
                                       aria-expanded="false">
                                        <i class="fa-regular fa-envelope"></i>
                                    </a>
                                </li>
                                <li class="nav-item dropdown me-3">
                                    <a class="nav-link active dropdown-toggle" href="#" data-bs-toggle="dropdown"
                                       aria-expanded="false">
                                        <i class="fa-regular fa-bell"></i>
                                    </a>
                                </li>
                            </ul>
                            <c:set var="account" value="${sessionScope.account}"/>
                            <div class="dropdown">
                                <a href="#" data-bs-toggle="dropdown" aria-expanded="false">
                                    <div class="user-menu d-flex">
                                        <div class="user-name text-end me-3">
                                            <h6 class="mb-0 text-gray-600">${account.fullname}</h6>
                                            <p class="mb-0 text-sm text-gray-600">Administrator</p>
                                        </div>
                                        <div class="user-img d-flex align-items-center">
                                            <div class="avatar avatar-md">
                                                <img src="images/avatar/${account.avatar}">
                                            </div>
                                        </div>
                                    </div>
                                </a>
                                <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                    <li>
                                        <h6 class="dropdown-header">Hello, Nam!</h6>
                                    </li>
                                    <li><a class="dropdown-item" href="#"><i class="fa-light fa-user"></i> My
                                            Profile</a></li>
                                    <li><a class="dropdown-item" href="#"><i class="fa-light fa-gear"></i>
                                            Settings</a></li>
                                    <hr class="dropdown-divider">
                                    <li><a class="dropdown-item" href="home"><i class="fa-light fa-house-user"></i> Home
                                            Page</a></li>
                                    <li><a class="dropdown-item" href="logout"><i
                                                class="fa-light fa-arrow-right-from-bracket"></i> Logout</a></li>
                                </ul>
                            </div>
                        </div>
                    </nav>
                </header>

                <div class="page-heading">
                    <div class="page-title">
                        <div class="row">
                            <div class="col-12 col-md-6 order-md-1 order-last">
                                <h3>Account List</h3>
                                <p class="text-subtitle">Admin account management</p>
                            </div>
                            <div class="col-12 col-md-6 order-md-2 order-first">
                                <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="#">Dashboard</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Account</li>
                                    </ol>
                                    <div class="col create-account">
                                        <button class="btn btn-success float-end" data-bs-toggle="modal"
                                                data-bs-target="#createAccount">
                                            <i class="fa-regular fa-user-plus"></i> Create Account</button>
                                    </div>
                                </nav>
                            </div>
                        </div>
                    </div>
                    <section class="section">
                        <form action="accountmanagement">
                            <div class="card">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-md-3">
                                            <div class="form-group position-relative has-icon-left">
                                                <input type="search" class="form-control round" placeholder="Search..." name="key" value="${key}">
                                                <input type="submit" hidden="">
                                                <div class="form-control-icon">
                                                    <i class="fa-regular fa-magnifying-glass"></i>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="input-group mb-3">
                                                <label class="input-group-text" for="role">Role</label>
                                                <select class="form-select" id="role" name="roleId" onchange="this.form.submit()">
                                                    <option ${roleId == 0 ? "selected" : ""} value="${0}">All roles</option>
                                                    <c:forEach items="${roleList}" var="role">
                                                        <option ${roleId == role.id ? "selected" : ""} value="${role.id}">${role.name}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="input-group mb-3">
                                                <label class="input-group-text" for="status">Status</label>
                                                <select class="form-select" id="status" name="statusId" onchange="this.form.submit()">
                                                    <option ${statusId == 0 ? "selected" : ""} value="${0}">All status</option>
                                                    <c:forEach items="${statusList}" var="status">
                                                        <option ${statusId == status.id ? "selected" : ""} value="${status.id}">${status.name}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="input-group mb-3">
                                                <label class="input-group-text" for="sort">Sort By</label>
                                                <select class="form-select" id="sort" name="sort" onchange="this.form.submit()">
                                                    <c:forEach items="${sortList}" var="s">
                                                        <option ${sort == s ? "selected" : ""} value="${s}">${s}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="d-flex align-items-center">
                                        <div class="form-group col-md-1">
                                            <input type="number" min="1" value="${entry}" name="entry" class="form-control round">
                                            <input type="submit" hidden="">
                                        </div>
                                        <p>
                                            &nbsp&nbsp Entries per page 
                                        </p>
                                    </div>

                                    <table class="table table-striped table-hover">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Fullname</th>
                                                <th>Username</th>
                                                <th>Email</th>
                                                <th>Phone</th>
                                                <th>Role</th>
                                                <th>Status</th>
                                                <th>&nbsp&nbspActions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${accountsPage}" var="a">
                                                <tr>
                                                    <td>${a.id}</td>
                                                    <td>${a.fullname}</td>
                                                    <td>${a.username}</td>
                                                    <td>${a.email}</td>
                                                    <td>${a.phone}</td>
                                                    <td>${a.role.name}</td>
                                                    <td>
                                                        <c:choose>
                                                            <c:when test="${a.status.id == 1}">
                                                                <span class="badge bg-success">${a.status.name}</span>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <span class="badge bg-danger">${a.status.name}</span>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                    <td>
                                                        <a class="btn" data-bs-toggle="modal"
                                                           data-bs-target="#accountDetail${a.id}" id="detailBtn${a.id}">
                                                            <i class="fa-solid fa-eye"></i>
                                                        </a>
                                                        <c:if test="${sessionScope.account.id != a.id}">
                                                            <c:choose>
                                                                <c:when test="${a.status.id == 1}">
                                                                    <a class="btn" data-bs-toggle="modal" data-bs-target="#blockForm${a.id}"
                                                                       id="blockBtn${a.id}" data-id="${a.id}">
                                                                        <i class="fa-solid fa-ban"></i>
                                                                    </a>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <a class="btn" data-bs-toggle="modal" data-bs-target="#blockForm${a.id}"
                                                                       id="blockBtn${a.id}" data-id="${a.id}">
                                                                        <i class="fa-solid fa-circle-check"></i>
                                                                    </a>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </c:if>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </c:forEach>

                                        </tbody>
                                    </table>
                                    <nav>
                                        <ul class="pagination pagination-primary justify-content-end">
                                            <c:choose>
                                                <c:when test="${page > 1}">
                                                    <li class="page-item">
                                                        <input type="radio" name="page" id="prev" value="${page - 1}" onclick="this.form.submit()">
                                                        <label for="prev"><a class="page-link">Prev</a></label>
                                                    </li>  
                                                </c:when>
                                                <c:otherwise>
                                                    <li class="page-item"><a class="page-link" href="#">Prev</a></li>
                                                    </c:otherwise>
                                                </c:choose>
                                                <c:forEach begin="${1}" end="${requestScope.numberPages}" var="i">
                                                <li class="page-item ${i == page ? "active" : ""}">
                                                    <input type="radio" name="page" id="${i}" value="${i}" onclick="this.form.submit()">
                                                    <label for="${i}">
                                                        <a class="page-link">${i}</a>
                                                    </label>
                                                </li>
                                            </c:forEach>
                                            <c:choose>
                                                <c:when test="${page < numberPages}">
                                                    <li class="page-item">
                                                        <input type="radio" name="page" id="prev" value="${page + 1}" onclick="this.form.submit()">
                                                        <label for="prev"><a class="page-link">Next</a></label>
                                                    </li>  
                                                </c:when>
                                                <c:otherwise>
                                                    <li class="page-item"><a class="page-link" href="#">Next</a></li>
                                                    </c:otherwise>
                                                </c:choose>
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                        </form>
                    </section>
                    <c:forEach items="${accountsPage}" var="a">
                        <form action="editaccount" method="post" enctype="multipart/form-data">
                            <div class="modal fade accountDetail" tabindex="-1" role="dialog" aria-hidden="true" id="accountDetail${a.id}">
                                <div class="modal-dialog modal-dialog-centered modal-dialog-centered modal-dialog-scrollable"
                                     role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title">
                                                User profile
                                            </h5>
                                            <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                                                <i data-feather="x"></i>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <input type="hidden" name="accountId" value="${a.id}"/>
                                            <div class="d-flex align-items-center row justify-content-center">
                                                <div class="avatar avatar-lg">
                                                    <img id="avatar" src="images/avatar/${a.avatar}"/>
                                                </div>
                                            </div>
                                            <div class="form-group row align-items-center">
                                                <div class="col-md-3">
                                                    <label class="col-form-label lbl-avatar">Avatar</label>
                                                </div>
                                                <div class="col-md-8">
                                                    <input class="form-control" type="file" id="formFile" accept="image/*"
                                                           onchange="readURL(this)" name="avatar">
                                                </div>
                                            </div>
                                            <div class="form-group row align-items-center">
                                                <div class="col-md-3">
                                                    <label class="col-form-label">User ID</label>
                                                </div>
                                                <div class="col-md-2">
                                                    <input type="text" class="form-control" name="fname" value="${a.id}" disabled>
                                                </div>
                                                <div class="col-md-2">
                                                    <label class="col-form-label">Role</label>
                                                </div>
                                                <div class="col-md-4">
                                                    <fieldset class="form-group">
                                                        <select class="form-select" id="basicSelect" name="roleId">
                                                            <c:forEach items="${roleList}" var="role">
                                                                <option ${a.role.id == role.id ? "selected" : ""} value="${role.id}">${role.name}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </fieldset>
                                                </div>
                                            </div>
                                            <div class="form-group row align-items-center">
                                                <div class="col-md-3">
                                                    <label class="col-form-label">Fullname</label>
                                                </div>
                                                <div class="col-md-8">
                                                    <input type="text"  class="form-control" name="fullname"
                                                           value="${a.fullname}" required="" pattern="^[a-zA-Z]+( [a-zA-Z]+)*$">
                                                </div>
                                            </div>
                                            <div class="form-group row align-items-center">
                                                <div class="col-md-3">
                                                    <label class="col-form-label">Username</label>
                                                </div>
                                                <div class="col-md-8">
                                                    <input type="text"  class="form-control" name="fname" value="${a.username}"
                                                           disabled>
                                                </div>
                                            </div>
                                            <div class="form-group row align-items-center">
                                                <div class="col-md-3">
                                                    <label class="col-form-label">Password</label>
                                                </div>
                                                <div class="col-md-8">
                                                    <input type="password"  class="form-control" name="fname" value="${a.password}"
                                                           disabled>
                                                </div>
                                            </div>
                                            <div class="form-group row align-items-center">
                                                <div class="col-md-3">
                                                    <label class="col-form-label">DOB</label>
                                                </div>
                                                <div class="col-md-8">
                                                    <input type="date"  class="form-control" name="dob" max="2021-12-31" value="${a.dob}" required="">
                                                </div>
                                            </div>
                                            <div class="form-group row align-items-center">
                                                <div class="col-md-3">
                                                    <label class="col-form-label">Email</label>
                                                </div>
                                                <div class="col-md-8">
                                                    <input type="email"  class="form-control" name="fname" value="${a.email}" disabled>
                                                </div>
                                            </div>
                                            <div class="form-group row align-items-center">
                                                <div class="col-md-3">
                                                    <label class="col-form-label">Phone</label>
                                                </div>
                                                <div class="col-md-8">
                                                    <input type="text"  class="form-control" name="phone" value="${a.phone}" pattern="[0-9]{10}" required>
                                                </div>
                                            </div>
                                            <c:if test="${alertPhoneEdit != null}">
                                                <div class="row justify-content-center">
                                                    <div class="alert alert-danger alert-dismissible show fade col-md-10">
                                                        ${alertPhoneEdit}
                                                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                                    </div>
                                                </div>
                                            </c:if>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-light-secondary" data-bs-dismiss="modal">
                                                <span class="d-none d-sm-block">Close</span>
                                            </button>
                                            <button onclick="this.form.submit()" class="btn btn-primary ml-1">
                                                <span class="d-none d-sm-block">Save change</span>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </c:forEach>
                    <c:forEach items="${accountsPage}" var="a">
                        <form action="blockaccount">
                            <div class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" id="blockForm${a.id}">
                                <div class="modal-dialog modal-dialog-centered modal-dialog-centered modal-dialog-scrollable"
                                     role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title">
                                                <c:if test="${a.status.id == 1}">
                                                    Send Block Account Message
                                                </c:if>
                                                <c:if test="${a.status.id == 2}">
                                                    Send Active Account Message
                                                </c:if>
                                            </h5>
                                            <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                                                <i data-feather="x"></i>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <input type="hidden" id="accountId${a.id}" name="accountId" value="${a.id}">
                                            <div class="form-group">
                                                <label for="subject">Subject</label>
                                                <input type="text" class="form-control" id="subject" name="subject" required="true">
                                            </div>
                                            <div class="form-group mb-3">
                                                <label for="content" class="form-label">Content</label>
                                                <textarea class="form-control" id="content" rows="3" name="content" required="true"></textarea>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-light-secondary" data-bs-dismiss="modal">
                                                <span class="d-none d-sm-block">Close</span>
                                            </button>
                                            <button type="submit" class="btn btn-primary ml-1">
                                                <span class="d-none d-sm-block">Send
                                                    email</span>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>        
                    </c:forEach>
                </div>
                <form action="createaccount" method="post" enctype="multipart/form-data">
                    <div class="modal fade createAccount" tabindex="-1" role="dialog" aria-hidden="true" id="createAccount">
                        <div class="modal-dialog modal-dialog-centered modal-dialog-centered modal-dialog-scrollable"
                             role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title">
                                        Create account
                                    </h5>
                                    <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                                        <i data-feather="x"></i>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <div class="d-flex align-items-center row justify-content-center">
                                        <div class="avatar avatar-lg">
                                            <img id="cavatar"/>
                                        </div>
                                    </div>
                                    <div class="form-group row align-items-center">
                                        <div class="col-md-3">
                                            <label class="col-form-label lbl-avatar">Avatar</label>
                                        </div>
                                        <div class="col-md-8">
                                            <input class="form-control" type="file" id="formFile" accept="image/*"
                                                   onchange="readURL(this)" name="cavatar">
                                        </div>
                                    </div>
                                    <div class="form-group row align-items-center">
                                        <div class="col-md-3">
                                            <label class="col-form-label">Fullname</label>
                                        </div>
                                        <div class="col-md-8">
                                            <input type="text"  class="form-control" name="cfullname"
                                                   value="${cfullname}" required="" pattern="^[a-zA-Z]+( [a-zA-Z]+)*$">
                                        </div>
                                    </div>
                                    <div class="form-group row align-items-center">
                                        <div class="col-md-3">
                                            <label class="col-form-label">Username</label>
                                        </div>
                                        <div class="col-md-8">
                                            <input type="text"  class="form-control" name="cusername" value="${cusername}" pattern="^[a-zA-Z0-9]([._-](?![._-])|[a-zA-Z0-9]){4,30}[a-zA-Z0-9]$"
                                                   required="">
                                        </div>
                                    </div>
                                    <c:if test="${alertUsername != null}">
                                        <div class="row justify-content-center">
                                            <div class="alert alert-danger alert-dismissible show fade col-md-10">
                                                ${alertUsername}
                                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                            </div>
                                        </div>
                                    </c:if>
                                    <div class="form-group row align-items-center">
                                        <div class="col-md-3">
                                            <label class="col-form-label">Password</label>
                                        </div>
                                        <div class="col-md-8">
                                            <input type="password"  class="form-control" name="cpassword" value="${cpasssword}" pattern="^[a-zA-Z0-9]{6,32}$"
                                                   required="">
                                        </div>
                                    </div>
                                    <div class="form-group row align-items-center">
                                        <div class="col-md-3">
                                            <label class="col-form-label">Confirm-Password</label>
                                        </div>
                                        <div class="col-md-8">
                                            <input type="password"  class="form-control" name="crepassword" value="${crepassword}" pattern="^[a-zA-Z0-9]{6,32}$"
                                                   required="">
                                        </div>
                                    </div>
                                    <c:if test="${alertPassword != null}">
                                        <div class="row justify-content-center">
                                            <div class="alert alert-danger alert-dismissible show fade col-md-10">
                                                ${alertPassword}
                                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                            </div>
                                        </div>
                                    </c:if>
                                    <div class="form-group row align-items-center">
                                        <div class="col-md-3">
                                            <label class="col-form-label">DOB</label>
                                        </div>
                                        <div class="col-md-8">
                                            <input type="date"  class="form-control" name="cdob" value="${cdob}" max="2021-12-31" required="">
                                        </div>
                                    </div>
                                    <div class="form-group row align-items-center">
                                        <div class="col-md-3">
                                            <label class="col-form-label">Email</label>
                                        </div>
                                        <div class="col-md-8">
                                            <input type="email" class="form-control" name="cemail" value="${cemail}" required="">
                                        </div>
                                    </div>
                                    <c:if test="${alertEmail != null}">
                                        <div class="row justify-content-center">
                                            <div class="alert alert-danger alert-dismissible show fade col-md-10">
                                                ${alertEmail}
                                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                            </div>
                                        </div>
                                    </c:if>
                                    <div class="form-group row align-items-center">
                                        <div class="col-md-3">
                                            <label class="col-form-label">Phone</label>
                                        </div>
                                        <div class="col-md-8">
                                            <input type="text"  class="form-control" name="cphone" value="${cphone}" pattern="[0-9]{10}" required="">
                                        </div>
                                    </div>
                                    <c:if test="${alertPhone != null}">
                                        <div class="row justify-content-center">
                                            <div class="alert alert-danger alert-dismissible show fade col-md-10">
                                                ${alertPhone}
                                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                            </div>
                                        </div>
                                    </c:if>
                                    <div class="form-group row align-items-center">
                                        <div class="col-md-3">
                                            <label class="col-form-label">Role</label>
                                        </div>
                                        <div class="col-md-4">
                                            <fieldset class="form-group">
                                                <select class="form-select" id="basicSelect" name="croleId">
                                                    <c:forEach items="${roleList}" var="role">
                                                        <option ${croleId == role.id ? "selected" : ""} value="${role.id}">${role.name}</option>
                                                    </c:forEach>
                                                </select>
                                            </fieldset>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-light-secondary" data-bs-dismiss="modal">
                                        <span class="d-none d-sm-block">Close</span>
                                    </button>
                                    <button type="submit" class="btn btn-primary ml-1">
                                        <span class="d-none d-sm-block">Create</span>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
                <div class="modal fade notification" tabindex="-1" role="dialog" aria-hidden="true" id="notification" data-bs-backdrop="false">
                    <div class="modal-dialog modal-dialog-scrollable"
                         role="document">
                        <div class="modal-content">
                            <div class="modal-header ${success != null ? "bg-success" : "bg-danger"}">
                                <h5 class="modal-title white">
                                    Notification
                                </h5>
                                <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                                    <i data-feather="x"></i>
                                </button>
                            </div>
                            <div class="modal-body">
                                <c:if test="${success != null}">
                                    ${success}
                                </c:if>
                                <c:if test="${fail != null}">
                                    ${fail}
                                </c:if>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-light-secondary" data-bs-dismiss="modal">
                                    <span class="d-none d-sm-block">Close</span>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script src="js/bootstrap.bundle.min.js"></script>
        <script src="js/jquery-3.6.0.min.js"></script>
        <script src="js/swiper-bundle.min.js"></script>
        <script>
                                                       function readURL(input) {
                                                           if (input.files && input.files[0]) {
                                                               var reader = new FileReader();

                                                               reader.onload = function (e) {
                                                                   $('#avatar')
                                                                           .attr('src', e.target.result);
                                                               };

                                                               reader.readAsDataURL(input.files[0]);
                                                           }
                                                       }
        </script>
        <script>
            function readURL(input) {
                if (input.files && input.files[0]) {
                    var reader = new FileReader();

                    reader.onload = function (e) {
                        $('#cavatar')
                                .attr('src', e.target.result);
                    };

                    reader.readAsDataURL(input.files[0]);
                }
            }
        </script>
        <c:if test="${alertUsername != null || alertPassword != null || alertEmail != null || alertPhone != null || createSuccess != null}">
            <script>
                $(document).ready(function () {
                    $("#createAccount").modal('show');
                });
            </script>
        </c:if>
        <c:if test="${alertPhoneEdit != null}">
            <script>
                $(document).ready(function () {
                    $("#accountDetail" +${accountId}).modal('show');
                });
            </script>
        </c:if>
        <c:if test="${success != null || fail != null}">
            <script>
                $(document).ready(function () {
                    $("#notification").modal('show');
                });
            </script>
        </c:if>
    </body>
</html>
