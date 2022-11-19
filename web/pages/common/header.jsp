<%--
    Document   : header
    Created on : Sep 15, 2022, 12:44:19 AM
    Author     : NamND
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Footer</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet"
              href="fonts/FontAwesome.Pro.6.0.0.alpha3/fontawesome6/pro/css/all.min.css">
        <link rel="stylesheet" href="css/header.css">
    </head>
    <body>
        <header>
            <!-- Header top-->
            <div class="header-top">
                <div class="container">
                    <div class="row justify-content-between align-items-center">
                        <div class="col">
                            <div class="welcome-text">
                                <p>
                                    <a href="productmanagement"> Seller Centre</a>
                                </p>
                                <p>&nbsp&nbsp&nbsp
                                    <c:if test="${sessionScope.account.role.id == 3}">
                                        <a href="accountmanagement"><i class="fa-regular fa-castle"></i> Admin Page</a>
                                    </c:if>
                                    <c:if test="${sessionScope.account.role.id == 4}">
                                        <a href="blogmanagement"><i class="fa-regular fa-castle"></i> Staff Page</a>
                                    </c:if>
                                </p>
                            </div>
                        </div>
                        <!--                        <div class="col" ">
                                                    <p>
                                                        <a href="productmanagement"> Seller Centre</a>
                                                    </p>
                                                </div>-->
                        <div class="col">
                            <c:choose>
                                <c:when test="${sessionScope.account == null}">
                                    <div class="top-nav">
                                        <a href="login">
                                            Sign in / Sign up<i class="fa-regular fa-arrow-right-to-bracket"></i></a>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <div class="top-nav">
                                        <a href="logout">
                                            Sign out<i class="fa-regular fa-arrow-right-to-bracket"></i></a>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Header top end-->
            <!-- Header bottom -->
            <div class="header-bottom">
                <div class="container">
                    <div class="row justify-content-between align-items-center">
                        <div class="col-lg-3 col">
                            <div class="header-logo">
                                <a href="home"><img class="logo" src="images\common\logo.png" height="60px" /></a>
                            </div>
                        </div>
                        <div class="col-lg-6 col">
                            <div class="search-element">
                                <form action="products">
                                    <button onclick="this.form.submit()"><i class="fa-regular fa-magnifying-glass"></i></button>
                                    <input type="search" placeholder="Search product ..." name="key" value="${requestScope.key}" required />
                                </form>
                            </div>
                        </div>
                        <div class="col-lg-3 col">
                            <div class="header-actions">
                                <a href="orderhistory" class="header-action-btn header-action-btn-cart ">
                                    <div class="header-action-icon">
                                        <i class="fa-regular fa-bags-shopping"></i>
                                    </div>
                                    <p>Orders</p>
                                </a>
                                <c:set var="account" value="${sessionScope.account}"/>
                                <a href="cart" class="header-action-btn header-action-btn-cart ">
                                    <div class="header-action-icon">
                                        <i class="fa-regular fa-cart-shopping"></i>
                                        <%--<c:if test="${sessionScope.size > 0}">--%>
                                        <span class="header-action-num" id="cart_number">${sessionScope.size}</span>
                                        <%--</c:if>--%>
                                    </div>
                                    <p>Cart</p>
                                </a>
                                <a href="profile" class="header-action-btn header-action-btn-cart">
                                    <c:choose>
                                        <c:when test="${account == null}">
                                            <div class="header-action-icon">
                                                <i class="fa-regular fa-user"></i>
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <div class="header-action-avatar">
                                                <img src="images/avatar/${account.avatar}" width="30px" height="30px" alt="Your account" class="rounded-circle"/>
                                            </div>
                                        </c:otherwise>
                                    </c:choose>
                                    <p>Account</p>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div><!-- Header bottom end-->
            <!-- header navigation -->
            <div class="header-nav-area sticky-nav">
                <div class="container">
                    <div class="header-nav">
                        <div class="main-menu">
                            <div class="header-nav-left category-dropdown">
                                <a href="#" class="dropdown-btn">
                                    <i class="fa-regular fa-xmark"></i>
                                    <i class="fa-regular fa-bars"></i>
                                    <span>Browse Categories</span>
                                    <i class="fa-thin fa-angle-down"></i>
                                </a>

                                <div class="dropdown-menu">
                                    <nav class="side-nav">
                                        <ul class="menu-vertical sf-arrows">
                                            <c:forEach items="${requestScope.categories}" var="category">
                                                <li><a href="products?categoryId=${category.id}" class="dropdown-item">${category.name}</a></li>
                                                </c:forEach>
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                            <!-- End header-nav-left-->
                            <div class="header-nav-center">
                                <ul class="menu-center">
                                    <li class="${path == 'home' ? "active" : ""}"><a href="home">Home</a></li>
                                    <li class="${path == 'products' ? "active" : ""}"><a href="products">Products</a></li>
                                    <li class="${path == 'blog' ? "active" : ""}"><a href="blog">Blogs</a></li>
                                    <li class="${path == '' ? "active" : ""}"><a href="#">About Us</a></li>
                                    <li class="${path == 'contact' ? "active" : ""}"><a href="sendcontact">Contact</a></li>
                                </ul><!-- End header-nav-center-->
                            </div>

                            <div class="header-nav-right">
                                <i class="fa-light fa-star-shooting"></i>
                                <p>Clearance<span class="highlight">&nbsp;Up to 30% Off</span></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- header navigation end -->
        </header>
    </body>
</html>
