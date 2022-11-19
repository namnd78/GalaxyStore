<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Staff Page</title>
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet"
              href="fonts\FontAwesome.Pro.6.0.0.alpha3\fontawesome6\pro\css\all.min.css">
        <link rel="stylesheet" href="css/swiper-bundle.min.css">
        <link rel="stylesheet" href="css/accountmanagement.css">
        <script src="lib/ckeditor/ckeditor.js"></script>
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
                            <li class="sidebar-item active ">
                                <a href="blogmanagement" class='sidebar-link'>
                                    <i class="fa-solid fa-newspaper"></i>
                                    <span>Blog Management</span>
                                </a>
                            </li>
                            <li class="sidebar-item">
                                <a href="contactmanagement" class='sidebar-link'>
                                    <i class="fa-solid fa-message-smile"></i>
                                    <span>Feedback Management</span>
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
                                            <p class="mb-0 text-sm text-gray-600">Staff</p>
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
                                <p class="text-subtitle">Staff blog management</p>
                            </div>
                            <div class="col-12 col-md-6 order-md-2 order-first">
                                <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="#">Dashboard</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Account</li>
                                    </ol>
                                    <div class="col create-account">
                                        <button class="btn btn-success float-end" data-bs-toggle="modal"
                                                data-bs-target="#createBlog">
                                            <i class="fa-regular fa-user-plus"></i>Create Blog</button>
                                    </div>
                                </nav>
                            </div>
                        </div>
                    </div>
                    <section class="section">
                        <form action="blogmanagement">
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
                                                        <a class="btn" data-bs-toggle="modal"
                                                           data-bs-target="#editBlog${b.id}" id="previewBtn${b.id}">
                                                            <i class="fa-solid fa-file-pen"></i>
                                                        </a>
                                                        <a class="btn" data-bs-toggle="modal" data-bs-target="#deleteBlog${b.id}"
                                                           id="deleteBtn${b.id}">
                                                            <i class="fa-solid fa-trash-can-xmark"></i>
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
            <form action="createblog" method="post">
                <div class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" id="createBlog">
                    <div class="modal-dialog modal-dialog-centered modal-dialog-centered modal-dialog-scrollable modal-xl"
                         role="document">
                        <div class="modal-content">
                            <div class="modal-header bg-primary ">
                                <h5 class="modal-title white">
                                    Create Blog
                                </h5>
                                <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                                    <i data-feather="x"></i>
                                </button>
                            </div>
                            <div class="modal-body">
                                <div class="form-group row align-items-center">
                                    <div class="col-md-3">
                                        <label class="col-form-label">Topic</label>
                                    </div>
                                    <div class="col-md-4">
                                        <fieldset>
                                            <select class="form-select" id="topic" name="ctopicId">
                                                <c:forEach items="${topicList}" var="topic">
                                                    <option ${topicId == topic.id ? "selected" : ""} value="${topic.id}">${topic.name}</option>
                                                </c:forEach>
                                            </select>
                                        </fieldset>
                                    </div>
                                </div>
                                <div class="form-group row align-items-center">
                                    <div class="col-md-3">
                                        <label class="col-form-label">Title</label>
                                    </div>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" name="ctitle" required="">
                                    </div>
                                </div>
                                <div class="form-group row align-items-center">
                                    <div class="col-md-3">
                                        <label class="col-form-label">Thumbnail URL</label>
                                    </div>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" name="cthumbnail" required="">
                                    </div>
                                </div>
                                <div class="form-group row align-items-center">
                                    <div class="col-md-3">
                                        <label class="col-form-label">Description</label>
                                    </div>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" name="cdescription" required="">
                                    </div>
                                </div>
                                <div class="form-group row align-items-center">
                                    <div class="col-md-3">
                                        <label class="col-form-label">Content</label>
                                    </div>
                                    <div class="col-md-9">
                                        <textarea class="blog-content" name="ccontent" id="create" rows="10" cols="80" required="">
                                        </textarea>
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
                                <div class="blog-content">
                                    ${b.content}
                                </div>
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
            <c:forEach items="${blogsPage}" var="b">
                <form action="editblog" method="post">
                    <div class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" id="editBlog${b.id}">
                        <div class="modal-dialog modal-dialog-centered modal-dialog-centered modal-dialog-scrollable modal-xl"
                             role="document">
                            <div class="modal-content">
                                <div class="modal-header bg-primary ">
                                    <h5 class="modal-title white">
                                        Edit Blog
                                    </h5>
                                    <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                                        <i data-feather="x"></i>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <input type="hidden" name="blogId" value="${b.id}"/>
                                    <div class="form-group row align-items-center">
                                        <div class="col-md-3">
                                            <label class="col-form-label">Topic</label>
                                        </div>
                                        <div class="col-md-4">
                                            <fieldset>
                                                <select class="form-select" id="topic" name="etopicId">
                                                    <c:forEach items="${topicList}" var="topic">
                                                        <option ${b.id == topic.id ? "selected" : ""} value="${topic.id}">${topic.name}</option>
                                                    </c:forEach>
                                                </select>
                                            </fieldset>
                                        </div>
                                    </div>
                                    <div class="form-group row align-items-center">
                                        <div class="col-md-3">
                                            <label class="col-form-label">Title</label>
                                        </div>
                                        <div class="col-md-8">
                                            <input type="text" class="form-control" name="etitle" value="${b.title}">
                                        </div>
                                    </div>
                                    <div class="form-group row align-items-center">
                                        <div class="col-md-3">
                                            <label class="col-form-label">Thumbnail URL</label>
                                        </div>
                                        <div class="col-md-8">
                                            <input type="text" class="form-control" name="ethumbnail" value="${b.thumbnail}">
                                        </div>
                                    </div>
                                    <div class="form-group row align-items-center">
                                        <div class="col-md-3">
                                            <label class="col-form-label">Description</label>
                                        </div>
                                        <div class="col-md-8">
                                            <input type="text" class="form-control" name="edescription" value="${b.description}">
                                        </div>
                                    </div>
                                    <div class="form-group row align-items-center">
                                        <div class="col-md-3">
                                            <label class="col-form-label">Content</label>
                                        </div>
                                        <div class="col-md-9">
                                            <textarea class="blog-content" name="econtent" id="edit${b.id}" rows="10" cols="80">
                                                ${b.content}
                                            </textarea>
                                        </div>
                                    </div>

                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-light-secondary" data-bs-dismiss="modal">
                                        <span class="d-none d-sm-block">Close</span>
                                    </button>
                                    <button type="submit" class="btn btn-primary ml-1">
                                        <span class="d-none d-sm-block">Save change</span>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form> 
                <script>
                    CKEDITOR.replace('edit${b.id}');
                </script>
            </c:forEach>
            <c:forEach items="${blogsPage}" var="b">
                <form action="deleteblog">
                    <div class="modal fade alertStatus" tabindex="-1" role="dialog" aria-hidden="true" id="deleteBlog${b.id}"
                         data-bs-backdrop="false">
                        <div class="modal-dialog modal-dialog-scrollable" role="document">
                            <div class="modal-content">
                                <div class="modal-header bg-warning">
                                    <h5 class="modal-title">
                                        Delete Blog
                                    </h5>
                                    <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                                        <i data-feather="x"></i>
                                    </button>
                                </div>
                                <input type="hidden" name="blogId" value="${b.id}"/>
                                <div class="modal-body">
                                    You want to delete blog with ID '${b.id}'?
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-light-secondary" data-bs-dismiss="modal">
                                        <span class="d-none d-sm-block">Close</span>
                                    </button>
                                    <button type="submit" class="btn btn-primary ml-1" data-bs-dismiss="modal">
                                        <span class="d-none d-sm-block">Delete</span>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </c:forEach>
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
        <script>
            CKEDITOR.replace('create');
        </script>
        <script src="js/bootstrap.bundle.min.js"></script>
        <script src="js/jquery-3.6.0.min.js"></script>
        <script src="js/swiper-bundle.min.js"></script>
        <c:if test="${success != null || fail != null}">
            <script>
            $(document).ready(function () {
                $("#notification").modal('show');
            });
            </script>
        </c:if>
    </body>

</html>
