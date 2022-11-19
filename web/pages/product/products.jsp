
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Shop Products</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet"
              href="fonts\FontAwesome.Pro.6.0.0.alpha3\fontawesome6\pro\css\all.min.css">
        <link rel="stylesheet" href="css/swiper-bundle.min.css">
        <link rel="stylesheet" href="css/style.css">
    </head>

    <body>
        <div class="main-wrapper">
            <form id="form" action="products">
                <header>
                    <!-- Header top-->
                    <div class="header-top">
                        <div class="container">
                            <div class="row justify-content-between align-items-center">
                                <div class="col">
                                    <div class="welcome-text">
                                        <p>&nbsp
                                            <c:if test="${sessionScope.account.role.id == 3}">
                                                <a href="accountmanagement"><i class="fa-regular fa-castle"></i> Admin Page</a>
                                            </c:if>
                                        </p>
                                    </div>
                                </div>
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
                                        <div class="search-form">
                                            <button onclick="this.form.submit()"><i class="fa-regular fa-magnifying-glass"></i></button>
                                            <input type="search" placeholder="Search product ..." name="key" value="${requestScope.key}" required />
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-3 col">
                                    <div class="header-actions">
                                        <a href="#" class="header-action-btn header-action-btn-cart ">
                                            <div class="header-action-icon">
                                                <i class="fa-regular fa-bags-shopping"></i>
                                            </div>
                                            <p>Orders</p>
                                        </a>
                                        <c:set var="account" value="${sessionScope.account}"/>
                                        <a href="cart" class="header-action-btn header-action-btn-cart ">
                                            <div class="header-action-icon">
                                                <i class="fa-regular fa-cart-shopping"></i>
                                                <c:if test="${sessionScope.size > 0}">
                                                    <span class="header-action-num">${sessionScope.size}</span>
                                                </c:if>
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
                                            <li class="${path == '' ? "active" : ""}"><a href="#">Contact</a></li>
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

                <div class="shop-category-area">
                    <div class="container">
                        <div class="row">
                            <!-- Sidebar Area Start -->
                            <div class="col-lg-3 col-md-12">
                                <div class="shop-sidebar-wrap">
                                    <!-- Sidebar single item -->
                                    <div class="sidebar-widget">
                                        <h4 class="sidebar-title">Categories</h4>
                                        <div class="sidebar-widget-category">
                                            <ul>
                                                <li class="${categoryId == 0 ? "selected" : ""}">
                                                    <input ${categoryId == 0 ? "checked" : ""} type="radio" name="categoryId" id="all" value="${0}" onclick="this.form.submit()">
                                                    <label for="all"><a>All</a></label>
                                                </li>
                                                <c:forEach items="${categories}" var="category">
                                                    <li class="${category.id == categoryId ? "selected" : ""}">
                                                        <input ${categoryId == category.id ? "checked" : ""} type="radio" name="categoryId" id="${category.name}" value="${category.id}" onclick="this.form.submit()">
                                                        <label for="${category.name}"><a>${category.name}</a></label>
                                                    </li>
                                                </c:forEach>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="sidebar-widget">
                                        <h4 class="sidebar-title">Brands</h4>
                                        <div class="sidebar-widget-brand">
                                            <c:set var="checkBrands" value="${requestScope.checkBrands}"/>
                                            <c:set var="brands" value="${requestScope.brands}"/>
                                            <ul class="row">
                                                <li class="col-lg-6"><input type="checkbox" id="b0" name="brandId" 
                                                                            ${checkBrands[0] ? "checked" : ""}
                                                                            value="${0}" onclick="setCheck(this)"><span>All</span>
                                                </li>
                                                <c:forEach begin="0" end="${brands.size()-1}" var="i">
                                                    <li class="col-lg-6"><input type="checkbox" name="brandId"
                                                                                value="${brands.get(i).getId()}"
                                                                                ${checkBrands[i+1] ? "checked" : ""}
                                                                                onclick="setCheck(this)"><span>${brands.get(i).getName()}</span>
                                                    </li>
                                                </c:forEach>
                                            </ul>
                                        </div>
                                    </div>
                                    <!-- Sidebar single item -->
                                    <div class="sidebar-widget mt-8">
                                        <h4 class="sidebar-title">Price</h4>
                                        <div class="sidebar-widget-price">
                                            <ul>
                                                <li><input type="checkbox" id="p0" name="price"
                                                           ${checkPrices[0] ? "checked" : ""}
                                                           value = "0" onclick="setCheck(this)"><span>All</span>
                                                </li>
                                                <c:forEach begin="0" end="${4}" var="i">
                                                    <li><input type="checkbox" id="p1" name="price"
                                                               ${checkPrices[i+1] ? "checked" : ""}
                                                               value = "${i+1}" onclick="setCheck(this)"><span>${prices[i]}</span>
                                                    </li>
                                                </c:forEach>
                                            </ul>
                                        </div>
                                    </div>
                                    <!-- Sidebar single item -->

                                    <!-- Sidebar single item -->
                                </div>
                            </div>
                            <div class="col-lg-9  col-md-12">
                                <!-- Shop Top Area Start -->
                                <div class="shop-top-bar d-flex">
                                    <p class="compare-product"> <span>${size}</span> Product Found </p>
                                    <!-- Right Side Start -->
                                    <div class="select-sort-wrap d-flex align-items-center">
                                        <div class="sort-product">
                                            <p>Sort By:</p>
                                        </div>
                                        <div class="header-bottom-set dropdown">
                                            <button class="dropdown-toggle header-action-btn" data-bs-toggle="dropdown">
                                                ${sort}
                                                <i class="fa-regular fa-angle-down"></i>
                                            </button>
                                            <ul class="dropdown-menu dropdown-menu-right">
                                                <c:forEach items="${sorts}" var="s">
                                                    <li>
                                                        <input ${sort == s ? "checked" : ""} type="radio" name="sort" id="${s}" value="${s}" onclick="this.form.submit()">
                                                        <label for="${s}"><a class="dropdown-item">${s}</a></label>
                                                    </li>
                                                </c:forEach>
                                            </ul>
                                        </div>
                                    </div>
                                    <!-- Right Side End -->
                                </div>
                                <!-- Shop Top Area End -->
                                <!-- Shop Bottom Area Start -->
                                <div class="shop-bottom-area">
                                    <!-- Tab Content Area Start -->
                                    <div class="row">
                                        <div class="col">
                                            <div class="product-page">
                                                <div class="row">
                                                    <c:forEach items="${requestScope.productsPage}" var="product">
                                                        <div class="col-lg-4">
                                                            <div class="product">
                                                                <span class="badges">
                                                                    <c:if test="${product.isNew()}">
                                                                        <span class="new">New</span>
                                                                    </c:if>
                                                                    <c:if test="${product.isSale()}">
                                                                        <span class="sale">-${product.discount}%</span>
                                                                    </c:if>
                                                                </span>
                                                                <div class="thumb">
                                                                    <a href="productdetail?pid=${product.id}" class="image">
                                                                        <img src="images/products/${product.images.get(0).image}" />
                                                                    </a>
                                                                </div>
                                                                <div class="content">
                                                                    <span class="category">${product.category.name}</span>
                                                                    <h5 class="title"><a href="productdetail?pid=${product.id}">${product.name}
                                                                        </a>
                                                                    </h5>
                                                                    <span class="price">
                                                                        <c:if test="${product.discount > 0}">
                                                                            <span class="old">${product.getOldPriceVND()}</span>
                                                                        </c:if>
                                                                        <span class="new">${product.getNewPriceVND()}</span>
                                                                    </span>
                                                                </div>
                                                                <div class="actions">
                                                                    <a href="addtocart?link=products&productId=${product.id}&quantity=1" class="btn action add-to-cart">
                                                                        <i class="fa-regular fa-cart-plus"></i>
                                                                        <span>Add to cart</span></a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </c:forEach>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Tab Content Area End -->
                                    <!--  Pagination Area Start -->
                                    <div class="pro-pagination-style text-center" data-aos="fade-up" data-aos-delay="200">
                                        <div class="pages">
                                            <ul>
                                                <c:if test="${page > 1}">
                                                    <li class="li">
                                                        <input type="radio" name="page" id="prev" value="${page - 1}" onclick="this.form.submit()">
                                                        <label for="prev"><a class="page-link"><i
                                                                    class="fa fa-angle-left"></i></a></label>
                                                    </li>  
                                                </c:if>
                                                <c:forEach begin="${1}" end="${requestScope.numberPages}" var="i">
                                                    <li class="li">
                                                        <input type="radio" name="page" id="${i}" value="${i}" onclick="this.form.submit()">
                                                        <label for="${i}"><a class="page-link ${i == page ? "active":""}">${i}</a></label>
                                                    </li>    
                                                </c:forEach>
                                                <c:if test="${page < numberPages}">
                                                    <li class="li">
                                                        <input type="radio" name="page" id="next" value="${page + 1}" onclick="this.form.submit()">
                                                        <label for="next"><a class="page-link"><i
                                                                    class="fa fa-angle-right"></i></a></label>
                                                    </li>   
                                                </c:if>
                                            </ul>
                                        </div>
                                    </div>
                                    <!--  Pagination Area End -->
                                </div>
                                <!-- Shop Bottom Area End -->
                            </div>

                        </div>
                    </div>
                </div>
            </form>
            <jsp:include page="../common/footer.jsp"/>
        </div>

        <!-- script -->
        <script src="js/bootstrap.bundle.min.js"></script>
        <script src="js/jquery-3.6.0.min.js"></script>
        <script src="js/swiper-bundle.min.js"></script>
        <script src="js/main.js"></script>
        <script>
                                                            function setCheck(obj) {
                                                                var brands = document.getElementsByName('brandId');
                                                                if (obj.id == 'b0' && brands[0].checked == true) {
                                                                    for (var i = 1; i < brands.length; i++) {
                                                                        brands[i].checked = false;
                                                                    }
                                                                } else {
                                                                    for (var i = 1; i < brands.length; i++) {
                                                                        if (brands[i].checked == true) {
                                                                            brands[0].checked = false;
                                                                            break;
                                                                        }
                                                                    }
                                                                }
                                                                var prices = document.getElementsByName('price');
                                                                if (obj.id == 'p0' && prices[0].checked == true) {
                                                                    for (var i = 1; i < prices.length; i++) {
                                                                        prices[i].checked = false;
                                                                    }
                                                                } else {
                                                                    for (var i = 1; i < prices.length; i++) {
                                                                        if (prices[i].checked == true) {
                                                                            prices[0].checked = false;
                                                                            break;
                                                                        }
                                                                    }
                                                                }
                                                                document.getElementById('form').submit();
                                                            }
        </script>
    </body>

</html>
