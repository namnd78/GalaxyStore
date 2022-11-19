<%--
    Document   : historyorder
    Created on : Jul 11, 2022, 9:11:13 PM
    Author     : NamND
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Order history</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet"
              href="fonts\FontAwesome.Pro.6.0.0.alpha3\fontawesome6\pro\css\all.min.css">
        <link rel="stylesheet" href="css/swiper-bundle.min.css">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/toastify-js/src/toastify.min.css">
    </head>

    <body>
        <div class="main-wrapper">
            <jsp:include page="../common/header.jsp"/>

            <div class="page-header text-center d-flex align-items-center">
                <div class="container ">
                    <h1 class="page-title">Order History</h1>
                </div>
            </div>

            <div class="wishlist-main-area">
                <div class="container">
                    <div class="table-content wishlist-table-content" id="content">
                        ${html}
                    </div>
                </div>
            </div>

            <!--cancelAll model-->
            <div class="modal fade" id="cancelAll" tabindex="-1" aria-labelledby="cancelAll" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="cancelAll">Cancel All Orders</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            You sure you want to cancel entire orders?
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn-secondary" data-bs-dismiss="modal">No</button>
                            <button type="button" class="btn-primary" onclick="DoCancelAllOrders()">Yes</button>
                        </div>
                    </div>
                </div>
            </div>

            <!--cancelSingel model-->
            <div class="modal fade" id="cancelSingle" tabindex="-1" aria-labelledby="cancelSingle" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="cancelSingle">Cancel Order</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            You sure you want to cancel&nbsp;
                            <span id="cancelSingleTitle" class="fw-bold">

                            </span>
                            order?
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn-secondary" data-bs-dismiss="modal">No</button>
                            <button type="button" class="btn-primary" onclick="DoCancelSingleOrder()">Yes</button>
                        </div>
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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/1.1.2/axios.min.js"
                integrity="sha512-bHeT+z+n8rh9CKrSrbyfbINxu7gsBmSHlDCb3gUF1BjmjDzKhoKspyB71k0CIRBSjE5IVQiMMVBgCWjF60qsvA=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/toastify-js"></script>
        <script>
                                let orderId;
                                let orderDetailId;
                                let productTitle;
                                function CancelAllOrders(id) {
                                    orderId = id;
                                }
                                function CancelAll(id) {
                                    axios.get('cancelallorders', {
                                        params: {
                                            orderId: id
                                        }
                                    }).then((response) => {
                                        document.getElementById('content').innerHTML = response.data;
                                    }).catch((error) => {
                                        console.log(error);
                                    });
                                }
                                function DoCancelAllOrders() {
                                    CancelAll(orderId)
                                    $('#cancelAll').modal('hide');
                                    Toastify({
                                        text: "Cancel all orders successfully!",
                                        className: "info",
                                        duration: 3000,
                                        close: true,
                                        style: {
                                            background: "linear-gradient(to right, #00b09b, #96c93d)",
                                        }
                                    }).showToast();
                                }
                                function CancelSingleOrder(oid, odid, name) {
                                    orderId = oid;
                                    orderDetailId = odid;
                                    productTitle = name;
                                    document.getElementById("cancelSingleTitle").innerHTML = productTitle;
                                }
                                function CancelSingle(oid, odid) {
                                    axios.get('cancelsingleorder', {
                                        params: {
                                            orderId: oid, orderDetailId: odid
                                        }
                                    }).then((response) => {
                                        document.getElementById('content').innerHTML = response.data;
                                    }).catch((error) => {
                                        console.log(error);
                                    });
                                }
                                function DoCancelSingleOrder() {
                                    CancelSingle(orderId, orderDetailId)
                                    $('#cancelSingle').modal('hide');
                                    Toastify({
                                        text: "Cancel order successfully!",
                                        className: "info",
                                        duration: 3000,
                                        close: true,
                                        style: {
                                            background: "linear-gradient(to right, #00b09b, #96c93d)",
                                        }
                                    }).showToast();
                                }
        </script>
    </body>

</html>
