<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Shopping Cart</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet"
              href="fonts\FontAwesome.Pro.6.0.0.alpha3\fontawesome6\pro\css\all.min.css">
        <link rel="stylesheet" href="css/swiper-bundle.min.css">
        <link rel="stylesheet" href="css/style.css">
    </head>

    <body>
        <div class="main-wrapper">
            <jsp:include page="../common/header.jsp"/>

            <div class="page-header text-center d-flex align-items-center">
                <div class="container ">
                    <h1 class="page-title">Shopping Cart</h1>
                </div>
            </div>

            <div class="cart-main-area">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8">
                            <div class="table-content cart-table-content">
                                <table>
                                    <thead>
                                        <tr>
                                            <th>Product</th>
                                            <th></th>
                                            <th>Price</th>
                                            <th>Quantity</th>
                                            <th>Total</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:set var="cart" value="${sessionScope.cart}"/>
                                        <c:set var="q" value="0"/>
                                        <c:forEach items="${cart.items}" var="item">
                                            <tr>
                                                <td class="product-thumbnail">
                                                    <a href="productdetail?productId=${item.product.id}">
                                                        <img class="img-responsive"
                                                             src="images/products/${item.product.images.get(0).image}" /></a>
                                                </td>
                                                <td class="product-name"><a href="productdetail?productId=${item.product.id}">${item.product.name}</a></td>
                                                <td class="product-price"><span class="amount">${item.product.getNewPriceVND()}</span></td>
                                                <td class="product-quantity">
                                                    <div class="cart-plus-minus">
                                                        <div class="dec qtybutton"><a href="updatequantity?num=-1&productId=${item.product.id}">-</a></div>
                                                        <input class="cart-plus-minus-box" type="text"
                                                               value="${item.quantity}" readonly=""/>
                                                        <div class="inc qtybutton"><a href="updatequantity?num=1&productId=${item.product.id}">+</a></div>
                                                    </div>
                                                </td>
                                                <td class="product-total-price">
                                                    <span class="amount">${item.getPriceVND()}</span>
                                                </td>
                                                <td class="product-remove">
                                                    <a href="removeitem?productId=${item.product.id}"><i class="fa-light fa-xmark"></i></a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>

                            <div class="cart-bottom">
                                <a href="clearcart" class="cart-clear btn-2"><span>CLEAR CART</span><i
                                        class="fa-light fa-xmark"></i></a>
                            </div>
                        </div>
                        <aside class="col-lg-4">
                            <div class="summary summary-cart">
                                <h3 class="summary-title">Cart Total</h3>
                                <form action="checkout">
                                    <table class="table table-summary">
                                        <tbody>
                                            <tr class="summary-subtotal">
                                                <td>Subtotal:</td>
                                                <td>${cart.getTotalMoneyVND()}</td>
                                            </tr>

                                            <tr class="summary-shipping-title">
                                                <td>Shipping:</td>
                                                <td>&nbsp;</td>
                                            </tr>
                                            <c:forEach items="${transports}" var="transport">
                                                <tr class="summary-shipping">
                                                    <td>
                                                        <div>
                                                            <input ${transport.id == 1 ? "checked" : ""} type="radio" name="transportId" value="${transport.id}">
                                                            <label>${transport.name}</label>
                                                        </div>
                                                    </td>
                                                    <td>${transport.getPriceVND()}</td>
                                                </tr>
                                            </c:forEach>
                                            <tr class="summary-shipping-estimate">
                                                <td>Your address<br>
                                                    <input type="text" placeholder="Enter your address" name="address" required="">
                                                </td>
                                                <td>&nbsp;</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <button class="btn btn-2 btn-checkout" type="submit">
                                        PLACE ORDER
                                    </button>
                                </form>
                                <c:if test="${alert != null}">
                                    <div class="alert alert-danger alert-dismissible fade show" role="alert"
                                         style="margin-top: 10px;">
                                        ${alert}
                                        <button type="button" class="btn-close" data-bs-dismiss="alert"
                                                aria-label="Close"></button>
                                    </div>
                                </c:if>
                            </div>
                            <div class="btn btn-2 btn-continue">
                                <a href="products"><span>CONTINUE
                                        SHOPPING</span><i class="fa-light fa-angles-right"></i></a>
                            </div>
                        </aside>
                    </div>
                </div>
            </div>

            <jsp:include page="../common/footer.jsp"/>
        </div>

        <!-- script -->
        <script src="js/bootstrap.bundle.min.js"></script>
        <script src="js/jquery-3.6.0.min.js"></script>
        <script src="js/swiper-bundle.min.js"></script>
        <script src="js/main.js"></script>
    </body>

</html>
