
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

                            <li class="sidebar-item active ">
                                <a href="productmanagement" class='sidebar-link'>
                                    <i class="fa-regular fa-basket-shopping-simple"></i>
                                    <span>Product Management</span>
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
                            <div class="col-12 col-md-6 order-md-1 order-last" style="margin-bottom: 10px;">
                                <a href="productmanagement">Product Management</a>
                                <span>/</span>
                                <a>Add Product</a>
                            </div>
                        </div>
                    </div>
                    <section class="section">
                        <div class="card">
                            <div class="card-body">
                                <h4>Product Information</h4>
                                <div class="row content-body-image">
                                    <div class="col-md-3 content-left">
                                        <span class="shopee-form-item_reqiured">*</span>
                                        <label>Product images</label>
                                    </div>
                                    <c:if test="${sessionScope.imageList != null}">
                                        <c:forEach var="i" begin="0" end="${sessionScope.imageList.size()-1}">
                                            <div class="col-md-1 content-right upload-image">
                                                <a href="#" onclick="deletePro(${i})">
                                                    <span aria-hidden="true" style="margin-left: 93%">&times;</span>
                                                </a>
                                                <img src="images/products/${sessionScope.imageList.get(i).getImage()}" alt="alt" style="width:100%;height: 50px;object-fit: scale-down"/>
                                            </div>
                                        </c:forEach>
                                    </c:if>
                                    <c:if test="${sessionScope.imageList == null}">
                                        <div class="col-md-1 content-right upload-image">
                                            <form action="editimage" method="post" enctype="multipart/form-data" id="fileUploadForm">
                                                <input type="file" name="imgP" id="proImg" onchange="submitForm()">
                                                <label for="proImg">
                                                    <div>
                                                        <i class="fa-regular fa-image" style="width:30px"></i>
                                                    </div>
                                                    <div>
                                                        Add image
                                                    </div>
                                                </label>
                                            </form>
                                        </div> 
                                    </c:if>
                                    <c:if test="${sessionScope.imageList.size() <= 6}">
                                        <div class="col-md-1 content-right upload-image">
                                            <form action="editimage" method="post" enctype="multipart/form-data" id="fileUploadForm">
                                                <input type="file" name="imgP" id="proImg" onchange="submitForm()">
                                                <label for="proImg">
                                                    <div>
                                                        <i class="fa-regular fa-image" style="width:30px"></i>
                                                    </div>
                                                    <div>
                                                        Add image
                                                    </div>
                                                </label>
                                            </form>
                                        </div> 
                                    </c:if>
                                </div>
                                <form action="addproduct" method="post" id="form1">
                                    <div class="row content-body">
                                        <div class="col-md-3 content-left">
                                            <span class="shopee-form-item_reqiured">*</span>
                                            <label>Product name</label>
                                        </div>
                                        <div class="col-md-9 content-right">
                                            <input type="text" name="name" value="" placeholder="Enter name" required />
                                        </div>
                                    </div>
                                    <div class="row content-body">
                                        <div class="col-md-3 content-left">
                                            <span class="shopee-form-item_reqiured">*</span>
                                            <label>Category</label>
                                        </div>
                                        <div class="col-md-9 content-right">
                                            <select id="category" name="categoryId" class="form-select">
                                                <c:forEach items="${categoryList}" var="category">
                                                    <option value="${category.getId()}">${category.getName()}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="row content-body">
                                        <div class="col-md-3 content-left">
                                            <span class="shopee-form-item_reqiured">*</span>
                                            <label>Brand</label>
                                        </div>
                                        <div class="col-md-9 content-right">
                                            <select id="brand" name="brandId" class="form-select">
                                                <c:forEach items="${brandList}" var="brand">
                                                    <option value="${brand.getId()}">${brand.getName()}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="row content-body">
                                        <div class="col-md-3 content-left">
                                            <span class="shopee-form-item_reqiured">*</span>
                                            <label>Description</label>
                                        </div>
                                        <div class="col-md-9 content-right">
                                            <textarea rows="4" name="description" required></textarea>
                                        </div>
                                    </div>
                                    <div class="row content-body">
                                        <div class="col-md-3 content-left">
                                            <span class="shopee-form-item_reqiured">*</span>
                                            <label>Specification</label>
                                        </div>
                                        <div class="col-md-9 content-right">
                                            <textarea rows="4" name="specification" required></textarea>
                                        </div>
                                    </div>
                                    <div class="row content-body">
                                        <div class="col-md-3 content-left">
                                            <span class="shopee-form-item_reqiured">*</span>
                                            <label>Price</label>
                                        </div>
                                        <div class="col-md-9 content-right">
                                            <input type="number" name="price" value="" required />
                                        </div>
                                    </div>
                                    <div class="row content-body">
                                        <div class="col-md-3 content-left">
                                            <span class="shopee-form-item_reqiured">*</span>
                                            <label>Quantity</label>
                                        </div>
                                        <div class="col-md-9 content-right">
                                            <input type="number" name="quantity" required />
                                        </div>
                                    </div>
                                </form>

                            </div>
                            <div class="content-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                                    <a href="productmanagement" style="color:white">
                                        Cancel 
                                    </a></button>
                                <button type="submit" form="form1" class="btn btn-primary">Save</button>
                            </div>
                    </section>
                </div>

            </div>
        </div>
        <script>
            function submitForm() {
                var formData = new FormData($('#fileUploadForm')[0]);
                $.ajax({
                    url: "/ProjectSWP391/editimage",
                    enctype: 'multipart/form-data',
                    type: 'POST',
                    processData: false,
                    contentType: false,
                    cache: false,
                    data: formData,
                    success: function (net) {
                        location.reload();
                    }
                });
            }
            function deletePro(i) {
                $.ajax({
                    url: "/ProjectSWP391/editimage",
                    type: 'GET',
                    data: {
                        stt: i,
                    },
                    success: function (net) {
                        location.reload();
                    }
                });
            }
        </script>                                                                  
        <script src="js/bootstrap.bundle.min.js"></script>
        <script src="js/jquery-3.6.0.min.js"></script>
        <script src="js/swiper-bundle.min.js"></script>
    </body>

</html>
