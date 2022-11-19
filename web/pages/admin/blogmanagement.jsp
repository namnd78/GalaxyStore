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

                            <li class="sidebar-item">
                                <a href="#" class='sidebar-link'>
                                    <i class="fa-solid fa-chart-line-up"></i>
                                    <span>Dashboard</span>
                                </a>
                            </li>
                            <li class="sidebar-item">
                                <a href="accountmanagement" class='sidebar-link'>
                                    <i class="fa-solid fa-id-card"></i>
                                    <span>Account Management</span>
                                </a>
                            </li>
                            <li class="sidebar-item active ">
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
                                <h3>Blog List</h3>
                                <p class="text-subtitle">Admin blog management</p>
                            </div>
                            <div class="col-12 col-md-6 order-md-2 order-first">
                                <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="#">Dashboard</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Blog</li>
                                    </ol>
                                </nav>
                            </div>
                        </div>
                    </div>
                    <section class="section">
                        <form action="adminblogmanagement">
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
                                                <label class="input-group-text" for="role">Topic</label>
                                                <select class="form-select" id="topic" name="topicId" onchange="this.form.submit()">
                                                    <option ${topicId == 0 ? "selected" : ""} value="${0}">All topics</option>
                                                    <c:forEach items="${topicList}" var="topic">
                                                        <option ${topicId == topic.id ? "selected" : ""} value="${topic.id}">${topic.name}</option>
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
                                                <label class="input-group-text" for="status">Sort By</label>
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
                                            <input type="number" min="1" name="entry" value="${entry}" class="form-control round">
                                        </div>
                                        <p>
                                            &nbsp&nbsp Entries per page
                                        </p>

                                    </div>

                                    <table class="table table-striped table-hover">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Thumbnail</th>
                                                <th>Title</th>
                                                <th>Topic</th>
                                                <th>Description</th>
                                                <th>Author</th>
                                                <th>Date modified</th>
                                                <th>Status</th>
                                                <th>&nbsp&nbspActions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${blogsPage}" var="b">
                                                <tr>
                                                    <td>${b.id}</td>
                                                    <td><img src="${b.thumbnail}" width="100px"></td>
                                                    <td>${b.title}</td>
                                                    <td>${b.topic.name}</td>
                                                    <td>${b.description}</td>
                                                    <td>${b.account.username}</td>
                                                    <td>${b.getCreatedDates()}</td>
                                                    <td>
                                                        <c:if test="${b.status.id == 1}">
                                                            <span class="badge bg-warning">${b.status.name}</span>
                                                        </c:if>
                                                        <c:if test="${b.status.id == 2}">
                                                            <span class="badge bg-success">${b.status.name}</span>
                                                        </c:if>
                                                        <c:if test="${b.status.id == 3}">
                                                            <span class="badge bg-danger">${b.status.name}</span>
                                                        </c:if>
                                                    </td>
                                                    <td style="white-space: nowrap;">
                                                        <a class="btn" data-bs-toggle="modal"
                                                           data-bs-target="#blogPreview${b.id}" id="previewBtn${b.id}">
                                                            <i class="fa-solid fa-eye"></i>
                                                        </a>
                                                        <a class="btn" href="changeblogstatus?blogId=${b.id}&statusId=2">
                                                            <i class="fa-solid fa-circle-check"></i>
                                                        </a>
                                                        <a class="btn" href="changeblogstatus?blogId=${b.id}&statusId=3">
                                                            <i class="fa-solid fa-ban"></i>
                                                        </a>
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
                </div>
            </div>
            <c:forEach items="${blogsPage}" var="b">
                <div class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" id="blogPreview${b.id}">
                    <div class="modal-dialog modal-dialog-centered modal-dialog-centered modal-dialog-scrollable modal-xl"
                         role="document">
                        <div class="modal-content">
                            <div class="modal-header bg-primary ">
                                <h5 class="modal-title white">
                                    Blog Preview
                                </h5>
                                <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                                    <i data-feather="x"></i>
                                </button>
                            </div>
                            <div class="modal-body">
                                <h3>
                                    ${b.title}
                                </h3>
                                <h5>
                                    ${b.description}
                                </h5>
                                <br>
                                ${b.content}
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-light-secondary" data-bs-dismiss="modal">
                                    <span class="d-none d-sm-block">Close</span>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
        <script src="lib/ckeditor/ckeditor.js"></script>
        <script>
                                                            CKEDITOR.replace('editor');
        </script>
        <script src="js/bootstrap.bundle.min.js"></script>
        <script src="js/jquery-3.6.0.min.js"></script>
        <script src="js/swiper-bundle.min.js"></script>
    </body>

</html>
