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
                            <li class="sidebar-item">
                                <a href="blogmanagement" class='sidebar-link'>
                                    <i class="fa-solid fa-newspaper"></i>
                                    <span>Blog Management</span>
                                </a>
                            </li>
                            <li class="sidebar-item active ">
                                <a href="contactmanagement" class='sidebar-link'>
                                    <i class="fa-solid fa-message-smile"></i>
                                    <span>Contact Management</span>
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
                                <h3>User Contact Message List</h3>
                                <p class="text-subtitle">Staff Contact Management</p>
                            </div>
                            <div class="col-12 col-md-6 order-md-2 order-first">
                                <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="#">Dashboard</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Contact</li>
                                    </ol>
                                </nav>
                            </div>
                        </div>
                    </div>
                    <section class="section">
                        <form action="contactmanagement">
                            <div class="card">
                                <div class="card-body">
                                    <div class="row">
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
                                                <th>Full Name</th>
                                                <th>Email</th>
                                                <th>Phone</th>
                                                <th>Message</th>
                                                <th>Date</th>
                                                <th>Status</th>
                                                <th>&nbsp&nbspActions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${contactsPage}" var="c">
                                                <tr>
                                                    <td>${c.id}</td>
                                                    <td>${c.fullname}</td>
                                                    <td>${c.email}</td>
                                                    <td>${c.phone}</td>
                                                    <td>${c.message}</td>
                                                    <td>${c.getDates()}</td>
                                                    <td>
                                                        <div class="dropdown">
                                                            <button class="btn ${(c.status.id == 1) ? 'btn-danger' : (c.status.id == 2) ? 'btn-warning' : 'btn-success'} dropdown-toggle me-1" type="button"
                                                                    id="dropdownMenuButton" data-bs-toggle="dropdown"
                                                                    aria-haspopup="true" aria-expanded="false">
                                                                ${c.status.name}
                                                            </button>
                                                            <div class="dropdown-menu" style="min-width: fit-content;" aria-labelledby="dropdownMenuButton">
                                                                <c:forEach items="${statusList}" var="status">
                                                                    <a class="dropdown-item ${(status.id == 1) ? 'text-danger' : (status.id == 2) ? 'text-warning' : 'text-success'}" href="changecontactstatus?contactId=${c.id}&statusId=${status.id}">${status.name}</a>
                                                                </c:forEach>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td style="white-space: nowrap;">
                                                        <a class="btn" data-bs-toggle="modal"
                                                           data-bs-target="#contactPreview${c.id}" id="previewBtn${c.id}">
                                                            <i class="fa-solid fa-eye"></i>
                                                        </a>
                                                        <a class="btn" data-bs-toggle="modal"
                                                           data-bs-target="#replyContact${c.id}" id="replyBtn${c.id}">
                                                            <i class="fa-solid fa-message-dots"></i>
                                                        </a>
                                                        <a class="btn" data-bs-toggle="modal" data-bs-target="#deleteContact${c.id}"
                                                           id="deleteBtn${c.id}">
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
            <c:forEach items="${contactsPage}" var="c">
                <form action="readcontact">
                    <div class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" id="contactPreview${c.id}">
                        <div class="modal-dialog modal-dialog-centered modal-dialog-centered modal-dialog-scrollable"
                             role="document">
                            <div class="modal-content">
                                <div class="modal-header bg-primary ">
                                    <h5 class="modal-title white">
                                        User Message
                                    </h5>
                                    <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                                        <i data-feather="x"></i>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <input type="hidden" name="contactId" value="${c.id}"/>
                                    ${c.message}
                                </div>
                                <div class="modal-footer">
                                    <button type="submit" class="btn btn-light-secondary" data-bs-dismiss="modal">
                                        <span class="d-none d-sm-block">Close</span>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </c:forEach>
            <c:forEach items="${contactsPage}" var="c">
                <form action="replycontact">
                    <div class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" id="replyContact${c.id}">
                        <div class="modal-dialog modal-dialog-centered modal-dialog-centered modal-dialog-scrollable"
                             role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title">
                                        Reply User Contact Message
                                    </h5>
                                    <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                                        <i data-feather="x"></i>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <input type="hidden" id="contactId${c.id}" name="contactId" value="${c.id}">
                                    <div class="form-group mb-3">
                                        <label for="content" class="form-label">User message</label>
                                        <textarea class="form-control" id="content" rows="3"  disabled="">${c.message}</textarea>
                                    </div>
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
                                    <a href="readcontact?contactId=${c.id}" class="btn btn-light-secondary" data-bs-dismiss="modal">
                                        <span class="d-none d-sm-block">Close</span>
                                    </a>
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
            <c:forEach items="${contactsPage}" var="c">
                <form action="deletecontact">
                    <div class="modal fade alertStatus" tabindex="-1" role="dialog" aria-hidden="true" id="deleteContact${c.id}"
                         data-bs-backdrop="false">
                        <div class="modal-dialog modal-dialog-scrollable" role="document">
                            <div class="modal-content">
                                <div class="modal-header bg-warning">
                                    <h5 class="modal-title">
                                        Delete Contact Message
                                    </h5>
                                    <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                                        <i data-feather="x"></i>
                                    </button>
                                </div>
                                <input type="hidden" name="contactId" value="${c.id}"/>
                                <div class="modal-body">
                                    You want to delete user message with ID '${c.id}'?
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
