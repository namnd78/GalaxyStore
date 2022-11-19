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
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/toastify-js/src/toastify.min.css">
        <link rel="stylesheet" href="css/accountmanagement.css">
        <link rel="stylesheet" href="css/help.css">
        <style>
            #main .main-wrapper .help-nav .nav .nav-item{
                position: relative;
                display: flex;
                overflow: hidden;
                align-items: center;
                justify-content: space-around;
            }
            .nav-tabs .nav-link.active:after{
                display: none;
            }
            .nav-tabs .nav-item.show .nav-link, .nav-tabs .nav-link.active{
                color:#495057;
            }
            .custom-text {
                outline: none;
            }
        </style>
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
                            <li class="sidebar-title ">Menu</li>
                            <div class="d-flex align-items-start">
                                <div class="nav flex-column nav-pills me-3" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                                    <li class="sidebar-item ${path=="dashboard"?"active":""}" id="v-pills-dashboard-tab" data-bs-toggle="pill" data-bs-target="#v-pills-dashboard" role="tab" aria-controls="v-pills-dashboard" aria-selected="true">
                                        <a href="#" class='sidebar-link'>
                                            <i class="fa-solid fa-chart-line-up"></i>
                                            <span>Dashboard</span>
                                        </a>
                                    </li>

                                    <li class="sidebar-item ${path=="account"?"active":""}" id="v-pills-account-tab" data-bs-toggle="pill" data-bs-target="#v-pills-account" role="tab" aria-controls="v-pills-account" aria-selected="false">
                                        <a href="#" class='sidebar-link'>
                                            <i class="fa-solid fa-id-card"></i>
                                            <span>Account Management</span>
                                        </a>
                                    </li>

                                    <li class="sidebar-item ${path=="help"?"active":""}" id="v-pills-help-tab" data-bs-toggle="pill" data-bs-target="#v-pills-help" role="tab" aria-controls="v-pills-help" aria-selected="false">
                                        <a href="#" class='sidebar-link'>
                                            <i class="fa-solid fa-id-card"></i>
                                            <span>Help Management</span>
                                        </a>
                                    </li>
                                    </ul>
                                </div>
                            </div>
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
                <div class="page-title">
                    <div class="row">
                        <div class="col-12 col-md-6 order-md-1 order-last">
                            <h3>Help List</h3>
                            <p class="text-subtitle">Admin help management</p>
                        </div>
                        <div class="col-12 col-md-6 order-md-2 order-first">
                            <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="#">Dashboard</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Account</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
                <div class="tab-content" id="v-pills-tabContent">
                    <div class="tab-pane fade ${path=="dashboard"?"show active":""}" id="v-pills-dashboard" role="tabpanel" aria-labelledby="v-pills-dashboard-tab" tabindex="0">dashboard</div>
                    <div class="tab-pane fade ${path=="help"?"show active":""}" id="v-pills-help" role="tabpanel" aria-labelledby="v-pills-help-tab" tabindex="0">
                        <div class="main-wrapper">
                            <div class="actions">
                                <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#add" onclick="">Add</button>
                                <button class="btn btn-primary" onclick="">Update</button>
                            </div>
                            <div class="help-nav container">
                                <div class="row" id="content">
                                    ${html}
                                </div>

                                <!-- Add modal -->
                                <div class="modal fade" id="add" tabindex="-1">
                                    <div class="modal-dialog modal-dialog-scrollable">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title">Add help item</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                            </div>
                                            <div class="modal-body" id="content_add">
                                                <form>
                                                    <label for="help-title" class="fw-bold">Help title</label><br>
                                                    <input id="help-title" class="custom-text w-100" type="text" required /><br>
                                                    <span id="waring-title" class="text-danger"></span><br>
                                                    <label for="help-content" class="fw-bold">Help content</label><br>
                                                    <textarea id="help-content" class="custom-text w-100 fw-normal" type="text" required ></textarea><br>
                                                    <span id="waring-content" class="text-danger"></span><br>
                                                    <label for="help-tab" class="fw-bold">Help tab</label><br>
                                                    <input id="help-tab" class="custom-text w-100" type="text" oninput="CheckHelpTab(event)" required/><br>
                                                    <span id="waring-tab" class="text-danger"></span><br>
                                                    <label for="help-target" class="fw-bold">Help target</label><br>
                                                    <input id="help-target" class="custom-text w-100" type="text" oninput="CheckHelpTarget(event)" required /><br>
                                                    <span id="waring-target" class="text-danger"></span>
                                                </form>
                                            </div>
                                            <div class="modal-footer">
                                                <a><button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button></a>
                                                <a onclick="DoAdd()"><button type="submit" class="btn btn-primary">Yes</button></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Delete Modal -->
                                <div class="modal fade" id="delete" tabindex="-1">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title">Delete help item</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                            </div>
                                            <div class="modal-body" id="content_delete">
                                                Delete&nbsp;
                                                <span id="content_delete" class="fw-bold">

                                                </span>
                                                item?
                                            </div>
                                            <div class="modal-footer">
                                                <a><button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button></a>
                                                <a onclick="DoDelete()"><button type="button" class="btn btn-primary">Yes</button></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
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
        <script type="text/javascript">
                                                    var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
                                                    var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
                                                        return new bootstrap.Tooltip(tooltipTriggerEl);
                                                    });
                                                    let helpId = 0;
                                                    let helpTitle = "";

                                                    function DoDelete() {
                                                        Delete(helpId);
                                                        $('#delete').modal('hide');
                                                        Toastify({
                                                            text: "Delete item successfully!",
                                                            className: "info",
                                                            duration: 3000,
                                                            close: true,
                                                            style: {
                                                                background: "linear-gradient(to right, #00b09b, #96c93d)",
                                                            }
                                                        }).showToast();
                                                    }

                                                    function DeleteHelpItem(id, title) {
                                                        helpId = id;
                                                        helpTitle = title;
                                                        document.getElementById('content_delete').innerHTML = title;
                                                    }

                                                    function Delete(id) {
                                                        axios.get('deletehelp', {
                                                            params: {
                                                                helpId: id
                                                            }
                                                        }).then((response) => {
                                                            document.getElementById('content').innerHTML = response.data;
                                                        }).catch((error) => {
                                                            console.log(error);
                                                        });
                                                    }

                                                    function CheckHelpTab(event) {
                                                        var tab = event.target.value;
                                                        var regex = /[a-zA-Z0-9]-tab/;
                                                        var message = "Follow the format 'tabname'+'-tab'<br>Sample: signin-tab";
                                                        regex.test(tab) ? document.getElementById('waring-tab').innerHTML = "" : document.getElementById('waring-tab').innerHTML = message;
                                                    }

                                                    function CheckHelpTarget(event) {
                                                        var tab = document.getElementById('help-tab').value;
                                                        const tabSplit = tab.split("-");
                                                        var target = event.target.value;
                                                        var regex = /^[a-zA-Z0-9!@#\$%\^\&*\)\(+=._-]+$/m;
                                                        var message = "";
                                                        if (target.substring(0, 1) !== "#") {
                                                            message = "First character must contain '#'";
                                                            document.getElementById('waring-target').innerHTML = message;
                                                            return;
                                                        } else {
                                                            if (tabSplit[0] !== target.substring(1, target.length)) {
                                                                message += "Target must equals with your tabname<br>Sample: signin-tab(tab) -> #signin(target)";
                                                                document.getElementById('waring-target').innerHTML = message;
                                                            } else {
                                                                message = "";
                                                                document.getElementById('waring-target').innerHTML = message;
                                                            }
                                                        }
                                                    }

                                                    function DoAdd() {
                                                        var title = document.getElementById('help-title').value;
                                                        var content = document.getElementById('help-content').value;
                                                        var tab = document.getElementById('help-tab').value;
                                                        var target = document.getElementById('help-target').value;
                                                        if (title.trim() !== "" && content.trim() !== "" && tab.trim() !== "" && target.trim() !== "") {
                                                            axios.get('addhelp', {
                                                                params: {
                                                                    title, content, tab, target
                                                                }
                                                            }).then((response) => {
                                                                document.getElementById('content').innerHTML = response.data;
                                                                $('#add').modal('hide');
                                                                document.getElementById('help-title').value = "";
                                                                document.getElementById('help-content').value = "";
                                                                document.getElementById('help-tab').value = "";
                                                                document.getElementById('help-target').value = "";
                                                                Toastify({
                                                                    text: "Add item successfully!",
                                                                    className: "info",
                                                                    duration: 3000,
                                                                    close: true,
                                                                    style: {
                                                                        background: "linear-gradient(to right, rgb(0, 176, 155), rgb(191 14 216))",
                                                                    }
                                                                }).showToast();
                                                            }).catch((error) => {
                                                                console.log(error);
                                                            });
                                                        } else {
                                                            alert("Please fill up all the input");
                                                        }
                                                    }
        </script>
    </body>

</html>
