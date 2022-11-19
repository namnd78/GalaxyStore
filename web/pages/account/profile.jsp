

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Profile</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet"
              href="fonts\FontAwesome.Pro.6.0.0.alpha3\fontawesome6\pro\css\all.min.css">
        <link rel="stylesheet" href="css/swiper-bundle.min.css">
        <link rel="stylesheet" href="css/style.css">
    </head>

    <body>
        <div class="main-wrapper">
            <jsp:include page="../common/header.jsp"/>

            <div class="profile-area">
                <c:set value="${sessionScope.account}" var="account"/>
                <div class="container row mt-5 mb-5">
                    <div class="col-md-4 mb-3">
                        <div class="card">
                            <div class="card-body">
                                <form action="editavatar" method="post" enctype="multipart/form-data">
                                    <div class="d-flex flex-column align-items-center text-center">
                                        <img src="images/avatar/${account.avatar}" alt="Admin"
                                             class="rounded-circle" width="150">
                                        <input type="file" name="photo" id="avatar" onchange="this.form.submit()">
                                        <label for="avatar">
                                            <i class="fa-regular fa-brush"></i>
                                        </label>
                                        <h4>${account.fullname}</h4>
                                        <a href="logout" class="btn logout mt-2">Logout<i class="fa-solid fa-right-from-bracket"></i></a>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-8">
                        <div class="card mb-3">
                            <div class="card-body">
                                <form action="profile" method="post">
                                    <div class="row">
                                        <div class="col-sm-3 d-flex align-items-center text-center">
                                            <h6>Full Name</h6>
                                        </div>
                                        <div class="col-sm-7">
                                            <input type="text" value="${account.fullname}" name="fullname">
                                        </div>
                                    </div>
                                    <hr>

                                    <div class="row">
                                        <div class="col-sm-3 d-flex align-items-center text-center">
                                            <h6>Username</h6>
                                        </div>
                                        <div class="col-sm-7">
                                            <input type="text" name="username" value="${account.username}" disabled="" />
                                        </div>
                                    </div>
                                    <hr>

                                    <div class="row">
                                        <div class="col-sm-3 d-flex align-items-center text-center">
                                            <h6>Password</h6>
                                        </div>
                                        <div class="col-sm-7">
                                            <input type="password" name="password" value="${account.password}" disabled="" />
                                            <a href="change">Change Password</a>
                                        </div>
                                    </div>
                                    <hr>

                                    <div class="row">
                                        <div class="col-sm-3 d-flex align-items-center text-center">
                                            <h6>Email address</h6>
                                        </div>
                                        <div class="col-sm-7">
                                            <input name="email" type="email" value="${account.email}" disabled=""/>
                                        </div>
                                    </div>
                                    <hr>

                                    <div class="row">
                                        <div class="col-sm-3 d-flex align-items-center text-center">
                                            <h6>Phone number</h6>
                                        </div>
                                        <div class="col-sm-7">
                                            <input name="phone" type="text" value="${account.phone}" pattern="[0-9]{10}" required />
                                        </div>
                                    </div> 
                                    <hr>

                                    <div class="row">
                                        <div class="col-sm-3 d-flex align-items-center text-center">
                                            <h6>Date of birth</h6>
                                        </div>
                                        <div class="col-sm-4">
                                            <input name="dob" type="date" value="${account.dob}" required=""/>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-12 mt-2 mb-2">
                                            <button type="submit" class="btn btn-2">Save</button>
                                        </div>
                                    </div>
                                    <c:if test="${alert != null}">
                                        <div class="alert alert-danger alert-dismissible fade show"
                                             role="alert">
                                            <strong>${alert}</strong>
                                            <button type="button" class="btn-close" data-bs-dismiss="alert"
                                                    aria-label="Close"></button>
                                        </div>
                                    </c:if>
                                </form>
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
    </body>

</html>
