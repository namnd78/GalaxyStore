<%-- Document : home Created on : Sep 15, 2022, 12:01:21 AM Author : NamND --%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Home</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="fonts\FontAwesome.Pro.6.0.0.alpha3\fontawesome6\pro\css\all.min.css">
        <link rel="stylesheet" href="css/swiper-bundle.min.css">
        <link rel="stylesheet" href="css/home.css">
    </head>
    <body>
        <div class="main-wrapper">

            <jsp:include page="pages/common/header.jsp" />

            <!-- Slider -->
            <div class="swiper home-swiper">
                <div class="swiper-wrapper">
                    <div class="swiper-slide" style="background-image: url(images/common/slide-1.png);">
                        <div class="container h-100">
                            <div class="row h-100 justify-content-end align-items-center">
                                <div class="slide-content col-md-4">
                                    <span class="category">Welcome To Galaxy</span>
                                    <h2 class="title-1">The World Of <br>
                                        Smart Devices & <br>
                                        Best Solution </h2>
                                    <a href="products" class="btn">Shop
                                        All Devices</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide" style="background-image: url(images/common/slide-2.png);">
                        <div class="container h-100">
                            <div class="row h-100 justify-content-end align-items-center">
                                <div class="slide-content col-md-4">
                                    <span class="category">Welcome To Galaxy</span>
                                    <h2 class="title-1">The World Of <br>
                                        Smart Devices & <br>
                                        Best Solution </h2>
                                    <a href="products" class="btn">Shop
                                        All Devices</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- pagination -->
                <div class="swiper-pagination"></div>

                <!-- navigation buttons -->
                <div class="swiper-button-prev"><i class="fa-light fa-angle-left"></i></div>
                <div class="swiper-button-next"><i class="fa-light fa-angle-right"></i></div>
            </div>
            <!-- Slider end -->
            <!-- Banner -->
            <div class="banner-area">
                <div class="container">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="single-banner nth-child-1">
                                <img src="images/common/banner1.webp" alt="">
                                <div class="banner-content nth-child-1">
                                    <h3 class="title">Smart Watch</h3>
                                    <span class="category">From 750.000 đ</span>
                                    <a href="products?categoryId=3" class="shop-link">Shop Now <i
                                            class="fa-solid fa-arrow-right"></i></a>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="single-banner nth-child-2">
                                <img src="images/common/banner2.webp" alt="">
                                <div class="banner-content nth-child-2">
                                    <h3 class="title">Smartphone</h3>
                                    <span class="category">From 2.300.000 đ</span>
                                    <a href="products?categoryId=1" class="shop-link">Shop Now <i
                                            class="fa-solid fa-arrow-right"></i></a>
                                </div>
                            </div>
                            <div class="single-banner nth-child-3">
                                <img src="images/common/banner3.webp" alt="">
                                <div class="banner-content nth-child-3">
                                    <h3 class="title">Tablet</h3>
                                    <span class="category">From 2.800.000 đ</span>
                                    <a href="products?categoryId=2" class="shop-link">Shop Now <i
                                            class="fa-solid fa-arrow-right"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div><!-- Banner end -->
            <!-- Product -->
            <div class="product-area">
                <div class="container">
                    <!-- Section Title & Tab Start -->
                    <div class="row">
                        <div class="col-12">
                            <!-- Tab Start -->
                            <div class="tab-slider d-flex justify-content-between align-items-center">
                                <ul class="nav product-tab-nav justify-content-start align-items-center">
                                    <li class="nav-item"><button class="nav-link active" data-bs-toggle="tab"
                                                                 data-bs-target="#newarrivals">New Arrivals</button>
                                    </li>
                                    <li class="nav-item"><button class="nav-link" data-bs-toggle="tab"
                                                                 data-bs-target="#bestseller">Best Seller</button>
                                    </li>
                                    <li class="nav-item"><button class="nav-link" data-bs-toggle="tab"
                                                                 data-bs-target="#hotsale">Hot Sale</button>
                                    </li>
                                </ul>
                            </div>
                            <!-- Tab End -->
                        </div>
                    </div>
                    <!-- Section Title & Tab End -->
                    <div class="row">
                        <div class="col">
                            <div class="tab-content">
                                <!-- 1st tab start -->
                                <div class="tab-pane fade show active" id="newarrivals">
                                    <div class="row">
                                        <c:forEach items="${requestScope.newProducts}" var="product">
                                            <div class="col-lg-4 col-xl-3 col-md-6 col-sm-6 col-xs-6">
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
                                                            <img
                                                                src="images/products/${product.images.get(0).image}" />
                                                        </a>
                                                    </div>
                                                    <div class="content">
                                                        <span class="category">${product.category.name}</span>
                                                        <h5 class="title"><a
                                                                href="productdetail?pid=${product.id}">${product.name}
                                                            </a>
                                                        </h5>
                                                        <span class="price">
                                                            <c:if test="${product.discount > 0}">
                                                                <span
                                                                    class="old">${product.getOldPriceVND()}</span>
                                                            </c:if>
                                                            <span class="new">${product.getNewPriceVND()}</span>
                                                        </span>
                                                    </div>
                                                    <div class="actions">
                                                        <a onClick="addToCart(${product.id})" class="btn action add-to-cart">
                                                            <i class="fa-regular fa-cart-plus"></i>
                                                            <span>Add to cart</span></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                                <!-- 1st tab end -->
                                <!-- 2nd tab start -->
                                <div class="tab-pane fade" id="bestseller">
                                    <div class="row">
                                        <c:forEach items="${requestScope.sellerProducts}" var="product">
                                            <div class="col-lg-4 col-xl-3 col-md-6 col-sm-6 col-xs-6">
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
                                                            <img
                                                                src="images/products/${product.images.get(0).image}" />
                                                        </a>
                                                    </div>
                                                    <div class="content">
                                                        <span class="category">${product.category.name}</span>
                                                        <h5 class="title"><a
                                                                href="productdetail?pid=${product.id}">${product.name}
                                                            </a>
                                                        </h5>
                                                        <span class="price">
                                                            <c:if test="${product.discount > 0}">
                                                                <span
                                                                    class="old">${product.getOldPriceVND()}</span>
                                                            </c:if>
                                                            <span class="new">${product.getNewPriceVND()}</span>
                                                        </span>
                                                    </div>
                                                    <div class="actions">
                                                        <a onClick="addToCart(${product.id})" class="btn action add-to-cart">
                                                            <i class="fa-regular fa-cart-plus"></i>
                                                            <span>Add to cart</span></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                                <!-- 2nd tab end -->
                                <!-- 3rd tab start -->
                                <div class="tab-pane fade" id="hotsale">
                                    <div class="row">
                                        <c:forEach items="${requestScope.saleProducts}" var="product">
                                            <div class="col-lg-4 col-xl-3 col-md-6 col-sm-6 col-xs-6">
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
                                                            <img
                                                                src="images/products/${product.images.get(0).image}" />
                                                        </a>
                                                    </div>
                                                    <div class="content">
                                                        <span class="category">${product.category.name}</span>
                                                        <h5 class="title"><a
                                                                href="productdetail?pid=${product.id}">${product.name}
                                                            </a>
                                                        </h5>
                                                        <span class="price">
                                                            <c:if test="${product.discount > 0}">
                                                                <span
                                                                    class="old">${product.getOldPriceVND()}</span>
                                                            </c:if>
                                                            <span class="new">${product.getNewPriceVND()}</span>
                                                        </span>
                                                    </div>
                                                    <div class="actions">
                                                        <a onClick="addToCart(${product.id})" class="btn action add-to-cart">
                                                            <i class="fa-regular fa-cart-plus"></i>
                                                            <span>Add to cart</span></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                                <!-- 3rd tab end -->
                            </div>
                        </div>
                    </div>
                </div>
            </div><!-- Product end -->
            <jsp:include page="pages/common/helpbutton.jsp" />
            <jsp:include page="pages/common/footer.jsp" />

        </div>
        <!-- script -->
        <script src="js/jquery-3.6.0.min.js"></script>
        <script src="js/bootstrap.bundle.min.js"></script>
        <script src="js/swiper-bundle.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/1.1.2/axios.min.js"
                integrity="sha512-bHeT+z+n8rh9CKrSrbyfbINxu7gsBmSHlDCb3gUF1BjmjDzKhoKspyB71k0CIRBSjE5IVQiMMVBgCWjF60qsvA=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script src="js/main.js"></script>
        <script type="text/javascript">
                                                            function addToCart(productId) {
                                                                axios.get('addtocart', {
                                                                    params: {
                                                                        productId: productId,
                                                                        quantity: 1
                                                                    }
                                                                }).then((response) => {
                                                                    console.log(response.data);
                                                                    document.getElementById("cart_number").innerHTML = response.data;
                                                                }).catch((error) => {
                                                                    console.log(error);
                                                                });
                                                            }
        </script>
    </body>

</html>