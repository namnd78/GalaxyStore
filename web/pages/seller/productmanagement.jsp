<%--
    Document   : productmanagement
    Created on : Oct 11, 2022, 11:25:04 PM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Seller Centre</title>
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet"
              href="fonts\FontAwesome.Pro.6.0.0.alpha3\fontawesome6\pro\css\all.min.css">
        <link rel="stylesheet" href="css/swiper-bundle.min.css">
        <link rel="stylesheet" href="css/productmanagement.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
                                <a href="dashboard" class='sidebar-link'>
                                    <i class="fa-solid fa-chart-line-up"></i>
                                    <span>Dashboard</span>
                                </a>
                            </li>

                            <li class="sidebar-item active">
                                <a href="productmanagement" class='sidebar-link'>
                                    <i class="fa-regular fa-basket-shopping-simple"></i>
                                    <span>Product Management</span>
                                </a>
                            </li>

                            <li class="sidebar-item">
                                <a href="ordermanagement" class='sidebar-link'>
                                    <i class="fa-regular fa-cart-shopping"></i>
                                    <span>Order Management</span>
                                </a>
                            </li>

                            <li class="sidebar-item">
                                <a href="shopprofile" class='sidebar-link'>
                                    <i class="fa-regular fa-store"></i>
                                    <span>Shop Profile</span>
                                </a>
                            </li>
                            <li class="sidebar-item">
                                <a href="feedback" class='sidebar-link'>
                                    <i class="fa-regular fa-comment"></i>
                                    <span>Customer feedback</span>
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
                                            <h6 class="mb-0 text-gray-600">${account.getFullname()}</h6>
                                            <p class="mb-0 text-sm text-gray-600">Seller</p>
                                        </div>
                                        <div class="user-img d-flex align-items-center">
                                            <div class="avatar avatar-md">
                                                <img src="images/avatar/${account.getAvatar()}">
                                            </div>
                                        </div>
                                    </div>
                                </a>
                                <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                    <li>
                                        <h6 class="dropdown-header">Hello, Huy!</h6>
                                    </li>
                                    <li><a class="dropdown-item" href="shopprofile"><i class="fa-light fa-user"></i> Shop
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
                                <h3>Product List</h3>
                            </div>
                        </div>
                    </div>
                    <section class="section">
                        <form action="productmanagement">
                            <div class="card">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-md-3">
                                            <div class="form-group position-relative has-icon-left">
                                                <input type="search" class="form-control round" placeholder="Search..." name="key" value="${requestScope.key}">
                                                <input type="submit" hidden="">
                                                <div class="form-control-icon">
                                                    <i class="fa-regular fa-magnifying-glass"></i>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="input-group mb-3">
                                                <label class="input-group-text" for="category">Category</label>
                                                <select class="form-select" id="category" name="categoryId" onchange="this.form.submit()">
                                                    <option ${categoryId == 0 ? "selected" : ""} value="${0}">All category</option>
                                                    <c:forEach items="${categoryList}" var="category">
                                                        <option ${categoryId == category.getId() ? "selected" : ""} value="${category.getId()}">${category.getName()}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <button type="button" class="btn btn-primary">
                                                <a href="addproduct" style="color:white">
                                                    <i class="fa-solid fa-plus" style="color:white"></i>
                                                    Add Product
                                                </a>
                                            </button>
                                        </div>
                                        <table class="table table-striped table-hover">
                                            <thead>
                                                <tr>
                                                    <th style="width: 300px">Name</th>
                                                    <th>Category</th>
                                                    <th>Brand</th>
                                                    <th>Quantity</th>
                                                    <th>Discount</th>
                                                    <th>Price</th>
                                                    <th>Status</th>
                                                    <th>Actions</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${requestScope.listPro}" var="p">
                                                    <tr onmouseover="mouseOver(${p.getId()})" onmouseout="mouseOut(${p.getId()})">
                                                        <td>
                                                            <div class="row">
                                                                <div class="col-md-3">
                                                                    <img style="width:50px" src="images/products/${p.images.get(0).image}">
                                                                </div>
                                                                <div class="col-md-9">
                                                                    ${p.getName()}
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td>${p.getCategory().name}</td>
                                                        <td>${p.getBrand().name}</td>
                                                        <td>
                                                            <div style="position: relative">
                                                                <a class="btn" data-bs-toggle="modal"
                                                                   data-bs-target="#modal-quantity${p.getId()}" id="detailBtn">
                                                                    ${p.getQuantity()}
                                                                    <div id="quantity${p.getId()}" class="icon-edit">
                                                                        <i class="fa-solid fa-pen-to-square"></i>
                                                                    </div>
                                                                </a>
                                                            </div>

                                                            <div class="modal fade" id="modal-quantity${p.getId()}" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                                                <div class="modal-dialog modal-dialog-centered" role="document">
                                                                    <div class="modal-content">
                                                                        <div class="modal-header">
                                                                            <h5 class="modal-title" id="exampleModalLongTitle">Update Quantity</h5>
                                                                            <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                                                                                <span aria-hidden="true">&times;</span>
                                                                            </button>
                                                                        </div>
                                                                        <div class="modal-body">
                                                                            Quantity <input type="number" style="margin-left: 5px" value="${p.getQuantity()}" id="data-quantity-${p.getId()}"/>
                                                                        </div>
                                                                        <div class="modal-footer">
                                                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                                            <button type="button" id="btn-quantity${p.getId()}" class="btn btn-primary" onclick="updateQuick(${p.getId()}, 1)" data-bs-dismiss="modal">Save changes</button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div style="position: relative">
                                                                <a class="btn" data-bs-toggle="modal"
                                                                   data-bs-target="#modal-discount${p.getId()}" id="detailBtn">
                                                                    ${p.getDiscount()}
                                                                    <div id="discount${p.getId()}" class="icon-edit">
                                                                        <i class="fa-solid fa-pen-to-square"></i>
                                                                    </div>
                                                                </a>
                                                            </div>
                                                            <div class="modal fade" id="modal-discount${p.getId()}" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                                                <div class="modal-dialog modal-dialog-centered" role="document">
                                                                    <div class="modal-content">
                                                                        <div class="modal-header">
                                                                            <h5 class="modal-title" id="exampleModalLongTitle">Update Discount</h5>
                                                                            <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                                                                                <span aria-hidden="true">&times;</span>
                                                                            </button>
                                                                        </div>
                                                                        <div class="modal-body">
                                                                            Discount <input type="number" style="margin-left: 5px" max="100" value="${p.getDiscount()}" id="data-discount-${p.getId()}"/>
                                                                        </div>
                                                                        <div class="modal-footer">
                                                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                                            <button type="button" class="btn btn-primary" onclick="updateQuick(${p.getId()}, 2)" data-bs-dismiss="modal">Save changes</button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div style="position: relative">
                                                                <a class="btn" data-bs-toggle="modal"
                                                                   data-bs-target="#modal-price${p.getId()}" id="detailBtn">
                                                                    ${p.getOldPriceVND()}
                                                                    <div id="price${p.getId()}" class="icon-edit">
                                                                        <i class="fa-solid fa-pen-to-square"></i>
                                                                    </div>
                                                                </a>
                                                            </div>

                                                            <div class="modal fade" id="modal-price${p.getId()}" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                                                <div class="modal-dialog modal-dialog-centered" role="document">
                                                                    <div class="modal-content">
                                                                        <div class="modal-header">
                                                                            <h5 class="modal-title" id="exampleModalLongTitle">Update Price</h5>
                                                                            <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                                                                                <span aria-hidden="true">&times;</span>
                                                                            </button>
                                                                        </div>
                                                                        <div class="modal-body">
                                                                            Price <input type="number" style="margin-left: 5px" value="${p.getPrice1()}" id="data-price-${p.getId()}"/>
                                                                        </div>
                                                                        <div class="modal-footer">
                                                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                                            <button type="button" class="btn btn-primary" onclick="updateQuick(${p.getId()}, 3)" data-bs-dismiss="modal">Save changes</button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td>${p.getState().name}</td>
                                                        <td class="row-action">
                                                            <a href="editproduct?idP=${p.getId()}" style="margin-right: 10px;">
                                                                <i class="fa-solid fa-pen-to-square" style="color: blue"></i>
                                                            </a>
                                                            <a class="btn" data-bs-toggle="modal"
                                                               data-bs-target="#modal-delete${p.getId()}" id="detailBtn">
                                                                <i class="fa-solid fa-x" style="color: red"></i>
                                                            </a>
                                                            <div class="modal fade" id="modal-delete${p.getId()}" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                                                <div class="modal-dialog modal-dialog-centered" role="document">
                                                                    <div class="modal-content">
                                                                        <div class="modal-header">
                                                                            <h5 class="modal-title" id="exampleModalLongTitle">Do you want to delete this product?</h5>
                                                                            <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                                                                                <span aria-hidden="true">&times;</span>
                                                                            </button>
                                                                        </div>
                                                                        <div class="modal-body">
                                                                            <div class="row">
                                                                                <div class="col-md-3">
                                                                                    <img style="width:50px" src="images/products/${p.images.get(0).image}">
                                                                                </div>
                                                                                <div class="col-md-9" style="text-align: left">
                                                                                    ${p.getName()}
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="modal-footer">
                                                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                                            <button type="button" class="btn btn-danger"><a href="deleteproduct?idD=${p.getId()}" style="color:white">
                                                                                    Delete
                                                                                </a>
                                                                            </button>
                                                                        </div>
                                                                    </div><!-- href="deleteproduct?idD=${p.getId()}" -->
                                                                </div>
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
                </div>

            </div>
        </div>
        <script>
            function mouseOver(a) {
                document.getElementById("quantity" + a).setAttribute("style", "display: inline-block");
                document.getElementById("discount" + a).setAttribute("style", "display: inline-block");
                document.getElementById("price" + a).setAttribute("style", "display: inline-block");
                //onmouseover="mouseOver()" onmouseout="mouseOut()"
            }
            function mouseOut(a) {
                document.getElementById("quantity" + a).setAttribute("style", "display: none");
                document.getElementById("discount" + a).setAttribute("style", "display: none");
                document.getElementById("price" + a).setAttribute("style", "display: none");
            }

            function updateQuick(id, type) {
                var data;
                switch (type) {
                    case 1:
                        data = $('#data-quantity-' + id).val();
                        break;
                    case 2:
                        data = $('#data-discount-' + id).val();
                        break;
                    case 3:
                        data = $('#data-price-' + id).val();
                        break;
                }
                $.ajax({
                    url: "/ProjectSWP391/productmanagement",
                    type: 'POST',
                    data: {
                        data: data,
                        id: id,
                        type: type
                    },
                    success: function (net) {
                        location.reload();
                    }
                });
            }
            /*
             * $('#btn-quantity13').on('click',function(){
             var quantity = $('#data-quantity-13').val();
             $.ajax({
             url: "/ProjectSWP391/test",
             type: 'GET',
             data: {
             quantity: quantity
             },
             success: function(data){
             location.reload();
             }
             });
             });
             */

        </script>
        <script src="js/bootstrap.bundle.min.js"></script>
        <script src="js/jquery-3.6.0.min.js"></script>
        <script src="js/swiper-bundle.min.js"></script>
    </body>

</html>
