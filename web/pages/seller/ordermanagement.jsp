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
        <link rel="stylesheet" href="css/ordermanagement.css">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/toastify-js/src/toastify.min.css">
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

                            <li class="sidebar-item">
                                <a href="productmanagement" class='sidebar-link'>
                                    <i class="fa-regular fa-basket-shopping-simple"></i>
                                    <span>Product Management</span>
                                </a>
                            </li>

                            <li class="sidebar-item active">
                                <a href="#" class='sidebar-link'>
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
                                        <h6 class="dropdown-header">Hello, Girl!</h6>
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
                                <h3>Order List</h3>
                            </div>
                        </div>
                    </div>
                    <section class="section">
                        <nav>
                            <div class="nav nav-tabs" id="nav-tab" role="tablist">
                                <button class="nav-link active" onclick="ProcessData('1')" id="nav-process-tab" data-bs-toggle="tab" data-bs-target="#nav-process" type="button" role="tab" aria-controls="nav-process" aria-selected="true"><i class="fa-solid fa-clock"></i>&nbsp;Processing</button>
                                <button class="nav-link"  onclick="DeliverData('2')" id="nav-deliver-tab" data-bs-toggle="tab" data-bs-target="#nav-deliver" type="button" role="tab" aria-controls="nav-deliver" aria-selected="false"><i class="fa-solid fa-truck-fast"></i>&nbsp;Delivering</button>
                                <button class="nav-link" onclick="ReceiveData('3')" id="nav-receive-tab" data-bs-toggle="tab" data-bs-target="#nav-receive" type="button" role="tab" aria-controls="nav-receive" aria-selected="false"><i class="fa-solid fa-circle-check"></i>&nbsp;Received</button>
                            </div>
                        </nav>
                        <div class="tab-content pt-0" id="nav-tabContent">
                            <div class="tab-pane fade show active nav-content" id="nav-process" role="tabpanel" aria-labelledby="nav-process-tab">
                                <div class="container m-0 p-0">
                                    <div class="table-content wishlist-table-content pb-0" id="content-process">
                                        ${html}
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane fade nav-content" id="nav-deliver" role="tabpanel" aria-labelledby="nav-deliver-tab">
                                <div class="container m-0 p-0">
                                    <div class="table-content wishlist-table-content pb-0" id="content-deliver">

                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane fade nav-content" id="nav-receive" role="tabpanel" aria-labelledby="nav-receive-tab">
                                <div class="table-content wishlist-table-content pb-0" id="content-receive">

                                </div>
                            </div>
                        </div>
                    </section>
                </div>
                <!--deliver model-->
                <div class="modal fade" id="deliverOrder" tabindex="-1" aria-labelledby="deliverOrder" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="deliverOrder">Deliver Order</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                Deliver this order?&nbsp;
                                <span id="cancelSingleTitle" class="fw-bold">

                                </span>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn-secondary" data-bs-dismiss="modal">No</button>
                                <button type="button" class="btn-primary" onclick="DoDeliver()">Deliver</button>
                            </div>
                        </div>
                    </div>
                </div>
                <!--deliver model-->
                <div class="modal fade" id="receiveOrder" tabindex="-1" aria-labelledby="receiveOrder" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="receiveOrder">Deliver Order</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                Receive this order?&nbsp;
                                <span id="cancelSingleTitle" class="fw-bold">

                                </span>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn-secondary" data-bs-dismiss="modal">No</button>
                                <button type="button" class="btn-primary" onclick="DoReceive()">Receive</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="js/bootstrap.bundle.min.js"></script>
        <script src="js/jquery-3.6.0.min.js"></script>
        <script src="js/swiper-bundle.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/1.1.2/axios.min.js"
                integrity="sha512-bHeT+z+n8rh9CKrSrbyfbINxu7gsBmSHlDCb3gUF1BjmjDzKhoKspyB71k0CIRBSjE5IVQiMMVBgCWjF60qsvA=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/toastify-js"></script>
        <script>
                                    let orderId;
                                    let orderTab;
                                    function ProcessData(tab) {
                                        axios.get('loadorder', {
                                            params: {
                                                orderTab: tab
                                            }
                                        }).then((response) => {
                                            document.getElementById('content-process').innerHTML = response.data;
                                        }).catch((error) => {
                                            console.log(error);
                                        });
                                    }

                                    function DeliverData(tab) {
                                        axios.get('loadorder', {
                                            params: {
                                                orderTab: tab
                                            }
                                        }).then((response) => {
                                            document.getElementById('content-deliver').innerHTML = response.data;
                                        }).catch((error) => {
                                            console.log(error);
                                        });
                                    }

                                    function ReceiveData(tab) {
                                        axios.get('loadorder', {
                                            params: {
                                                orderTab: tab
                                            }
                                        }).then((response) => {
                                            document.getElementById('content-receive').innerHTML = response.data;
                                        }).catch((error) => {
                                            console.log(error);
                                        });
                                    }

                                    function DeliverOrder(tab, id) {
                                        orderTab = tab;
                                        orderId = id;
                                    }
                                    function ChangeDeliverOrder(tab, state, id) {
                                        axios.get('changeorderstate', {
                                            params: {
                                                orderTab: tab, orderState: state, orderId: id
                                            }
                                        }).then((response) => {
                                            document.getElementById('content-process').innerHTML = response.data;
                                        }).catch((error) => {
                                            console.log(error);
                                        });
                                    }
                                    function DoDeliver() {
                                        ChangeDeliverOrder(orderTab, 2, orderId);
                                        $('#deliverOrder').modal('hide');
                                        Toastify({
                                            text: `Change status successfully!
                                                    Go to 'Delivering' tab to see the changes`,
                                            className: "info",
                                            duration: 3000,
                                            close: true,
                                            style: {
                                                background: "#0dcaf0",
                                            }
                                        }).showToast();
                                    }

                                    function ReceiveOrder(tab, id) {
                                        orderTab = tab;
                                        orderId = id;
                                    }
                                    function ChangeReceiveOrder(tab, state, id) {
                                        axios.get('changeorderstate', {
                                            params: {
                                                orderTab: tab, orderState: state, orderId: id
                                            }
                                        }).then((response) => {
                                            document.getElementById('content-deliver').innerHTML = response.data;
                                        }).catch((error) => {
                                            console.log(error);
                                        });
                                    }
                                    function DoReceive() {
                                        ChangeReceiveOrder(orderTab, 3, orderId);
                                        $('#receiveOrder').modal('hide');
                                        Toastify({
                                            text: `Change status successfully!
                                                    Go to 'Received' tab to see the changes`,
                                            className: "info",
                                            duration: 3000,
                                            close: true,
                                            style: {
                                                background: "#0dcaf0",
                                            }
                                        }).showToast();
                                    }
        </script>
    </body>

</html>
