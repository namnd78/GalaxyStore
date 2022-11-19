

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
        <link rel="stylesheet" href="css/shopregister.css">
        <link rel="stylesheet" href="css/dashboard.css">
        <script src="https://cdn.jsdelivr.net/npm/chart.js@3.9.1/dist/chart.min.js"></script>
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

                            <li class="sidebar-item active ">
                                <a href="dashboard" class='sidebar-link'>
                                    <i class="fa-solid fa-chart-line-up"></i>
                                    <span>Dashboard</span>
                                </a>
                            </li>

                            <li class="sidebar-item">
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
                                    <li>
                                        <h6 class="dropdown-header">Hello, Huy!</h6>
                                    </li>
                                    <li><a class="dropdown-item" href="#"><i class="fa-light fa-user"></i> Shop
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
                    <div class="page-content-wrapper" style="width:100%">
                        <div class="row content">
                            <div class="col-md-9 main-column">
                                <div class="dashboard-body">
                                    <div class="title">
                                        <h4>To-do list</h4>
                                        <p>Things you will have to do</p>
                                    </div>
                                    <div class="row to-do-box">
                                        <div class="col-md-4 to-do-box-item">
                                            <p class="item-title">${requestScope.progressOrder}</p>
                                            <p class="item-desc">Waiting for progressing</p>
                                        </div>
                                        <div class="col-md-4 to-do-box-item">
                                            <p class="item-title">${requestScope.shippingOrder}</p>
                                            <p class="item-desc">Waiting for shipping</p>
                                        </div>
                                        <div class="col-md-4 to-do-box-item">
                                            <p class="item-title">${requestScope.receivedOrder}</p>
                                            <P class="item-desc">Received</P>
                                        </div>
                                        <div class="col-md-4 to-do-box-item">
                                            <p class="item-title">0</p>
                                            <p class="item-desc">Locked product</p>
                                        </div>
                                        <div class="col-md-4 to-do-box-item">
                                            <p class="item-title">${requestScope.outOfSctockProduct}</p>
                                            <p class="item-desc">Out of stock product</p>
                                        </div>
                                        <div class="col-md-4 to-do-box-item">
                                            <p class="item-title">0</p>
                                            <p class="item-desc">Order is cancelled</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="dashboard-body">
                                    <div class="title">
                                        <h4 style="display:inline-block">Sales analysis</h4><span style="padding-left: 20px">(Today ${requestScope.today})</span>
                                        <p>Shop data overview for confirmed orders</p>
                                    </div>
                                    <div style="color: black">Sale: ${requestScope.totalSale}</div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <canvas id="linechart"></canvas>
                                        </div>
                                        <div class="col-md-6">
                                            hh
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3 aside-column">
                                <div class="dashboard-body">
                                    <p>Notification</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <script>
            const bienx = ['${requestScope.arrDay.get(3)}', '${requestScope.arrDay.get(2)}', '${requestScope.arrDay.get(1)}', '${requestScope.arrDay.get(0)}'];
            var bieny = [${requestScope.arrSale.get(3)}, ${requestScope.arrSale.get(2)}, ${requestScope.arrSale.get(1)}, ${requestScope.arrSale.get(0)}];
            var CHART = document.getElementById('linechart').getContext('2d');
            var line_chart = new Chart(CHART, {
                type: 'line',
                data: {
                    labels: bienx,
                    datasets: [{
                            label: 'vnd',
                            data: bieny
                        }]
                }
            });
        </script>                                    
        <script src="js/bootstrap.bundle.min.js"></script>
        <script src="js/jquery-3.6.0.min.js"></script>
        <script src="js/swiper-bundle.min.js"></script>
    </body>

</html>

