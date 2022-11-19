
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
        <link rel="stylesheet" href="css/shopregister.css">
    </head>

    <body>
        <div id="app">
            <div id="main" style="margin-left: 0">
                <header class='mb-3'>
                    <nav class="navbar navbar-expand navbar-light navbar-admin">
                        <div class="d-flex justify-content-between">
                            <div class="logo logo1">
                                <a href="#"><img src="images/common/logo-icon.png" alt="Logo" srcset=""  style="height: 70px"></a>
                            </div>

                        </div>
                        <div id="registerHead">
                            <p>Shop Register</p>
                        </div>
                        <div class="container-fluid">

                            <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                            </ul>
                            <c:set var="account" value="${sessionScope.account}"/>
                            <div class="dropdown">
                                <a href="#" data-bs-toggle="dropdown" aria-expanded="false">
                                    <div class="user-menu d-flex">
                                        <div class="user-img d-flex align-items-center">
                                            <div class="avatar avatar-md">
                                                <img src="images/avatar/${account.getAvatar()}">
                                            </div>
                                        </div>
                                        <div class="user-name text-end me-3" style="margin-top: 15px">
                                            <h6 class="mb-0 text-gray-600">${account.getFullname()}</h6>
                                        </div>
                                    </div>
                                </a>
                                <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                    <li><a class="dropdown-item" href="home"><i class="fa-light fa-house-user"></i> Home
                                            Page</a></li>
                                    <li><a class="dropdown-item" href="logout"><i
                                                class="fa-light fa-arrow-right-from-bracket"></i> Logout</a></li>
                                </ul>
                            </div>
                        </div>
                    </nav>
                </header>
                <div class="shop-register-area">
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="shop-register-wrapper">  
                                <div class="shop-form-container">
                                    <div class="shop-register-form">
                                        <h4 style="margin-bottom: 50px; text-align: center">Register to become seller</h4>
                                        <form action="shopregister" method="post">
                                            <div class="register-input">
                                                <span class="shopee-form-item__reqiured">*</span>
                                                <label style="margin-right: 10px">Shop name</label>
                                                <div style="margin-right: 400px">
                                                    <input type="text" name="shopname" value="" required />
                                                </div>
                                            </div>
                                            <div>
                                                <p style="color: red;margin-left: 445px">${alert}</p>
                                            </div>
                                            <div class="register-input">
                                                <span class="shopee-form-item__reqiured">*</span>
                                                <label style="margin-right: 10px">Place of receipt</label>
                                                <div style="margin-right: 400px">
                                                    <input type="text" name="placeReceipt" value="${placeReceipt}" required />
                                                </div>
                                            </div>
                                            <div class="register-input">
                                                <label style="margin-right: 10px">Shop Description</label>
                                                <div style="margin-right: 400px">
                                                    <textarea style="width:350px" rows="4" name="shopdecription">${shopdecription}</textarea>
                                                </div>
                                            </div>
                                            <div class="button-box" style="">
                                                <button class="btn btn-2" type="submit"><span>REGISTER</span><i
                                                        class="fa-regular fa-arrow-right-long"></i></button>
                                            </div>
                                        </form>
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
    </body>

</html>
