
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet"
              href="fonts\FontAwesome.Pro.6.0.0.alpha3\fontawesome6\pro\css\all.min.css">
        <link rel="stylesheet" href="css/swiper-bundle.min.css">
        <link rel="stylesheet" href="css/loginregister.css">
    </head>

    <body>
        <div class="main-wrapper">
            <jsp:include page="../common/header.jsp"/>

            <div class="login-register-area">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-md-6">
                            <div class="login-register-wrapper">
                                <div class="login-register-tab-list nav justify-content-center">
                                    <a class="${path == 'login' ? "active" : ""}" data-bs-toggle="tab" href="#login">
                                        <h4>Sign In</h4>
                                    </a>
                                    <a class="${path == 'register' ? "active" : ""}" data-bs-toggle="tab" href="#register">
                                        <h4>Register</h4>
                                    </a>
                                </div>
                                <div class="tab-content">
                                    <div id="login" class="tab-pane fade ${path == 'login' ? "show active" : ""}">
                                        <div class="login-form-container">
                                            <div class="login-register-form">
                                                <c:choose>
                                                    <c:when test="${Message != null}">
                                                        <div class="alert alert-danger alert-dismissible fade show"
                                                             role="alert">
                                                            <strong>${Message}</strong>
                                                            <button type="button" class="btn-close" data-bs-dismiss="alert"
                                                                    aria-label="Close"></button>
                                                        </div>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <c:if test="${alert != null}">
                                                            <div class="alert alert-danger alert-dismissible fade show"
                                                                 role="alert">
                                                                <strong>${alert}</strong>
                                                                <button type="button" class="btn-close" data-bs-dismiss="alert"
                                                                        aria-label="Close"></button>
                                                            </div>
                                                        </c:if>
                                                    </c:otherwise>
                                                </c:choose>
                                                <form action="login" method="post">
                                                    <div>
                                                        <label>Username</label>
                                                        <input type="text" name="username" value="${cookie.username.value}"
                                                               required />
                                                    </div>
                                                    <div>
                                                        <label>Password</label>
                                                        <input type="password" name="password"
                                                               value="${cookie.password.value}" required />
                                                    </div>
                                                    <div class="button-box">
                                                        <div class="login-toggle-btn">
                                                            <input type="checkbox" name="remember" ${cookie.remember.value != null ? 'checked' : ''}
                                                                   />
                                                            <span>Remember me</span>
                                                            <a href="forgot">Forgot Password?</a>
                                                        </div>
                                                        <button class="btn btn-2" type="submit"><span>Log in</span><i
                                                                class="fa-regular fa-arrow-right-long"></i></button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                    <div id="register" class="tab-pane fade ${path == 'register' ? "show active" : ""}">
                                        <div class="login-form-container">
                                            <div class="login-register-form">
                                                <c:if test="${alert != null}">
                                                    <div class="alert alert-danger alert-dismissible fade show"
                                                         role="alert">
                                                        <strong>${alert}</strong>
                                                        <button type="button" class="btn-close" data-bs-dismiss="alert"
                                                                aria-label="Close"></button>
                                                    </div>
                                                </c:if>
                                                <c:if test="${notification != null}">
                                                    <div class="alert alert-success alert-dismissible fade show"
                                                         role="alert">
                                                        <strong>${notification}</strong>
                                                        <button type="button" class="btn-close" data-bs-dismiss="alert"
                                                                aria-label="Close"></button>
                                                    </div>
                                                </c:if>
                                                <form action="register" method="post">
                                                    <div>
                                                        <label>Username</label>
                                                        <input type="text" name="username" value="${username}" required />
                                                    </div>
                                                    <div>
                                                        <label>Password</label>
                                                        <input type="password" name="password" value="${password}" required />
                                                    </div>
                                                    <div>
                                                        <label>Confirm password</label>
                                                        <input type="password" name="repassword" value="${repassword}" required />
                                                    </div>
                                                    <div>
                                                        <label>Fullname</label>
                                                        <input name="fullname" type="text" value="${fullname}" required/>
                                                    </div>
                                                    <div>
                                                        <label>Email address</label>
                                                        <input name="email" type="email" value="${email}" required />
                                                    </div>
                                                    <div>
                                                        <label>Phone number</label>
                                                        <input name="phone" type="text" value="${phone}" pattern="[0-9]{10}" required />
                                                    </div>
                                                    <div>
                                                        <label>Date of birth</label>
                                                        <input name="dob" type="date" value="${dob}" onchange="compare(this)" required=""/>
                                                        <span id="notify" class="text-danger" style="display: none;"></span>
                                                    </div>
                                                    <div class="button-box">
                                                        <button class="btn btn-2" type="submit"><span>Sign up</span><i
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
            </div>

            <jsp:include page="../common/footer.jsp"/>
        </div>

        <!-- script -->
        <script src="js/bootstrap.bundle.min.js"></script>
        <script src="js/jquery-3.6.0.min.js"></script>
        <script src="js/swiper-bundle.min.js"></script>
        <script src="js/main.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/moment@2.29.4/moment.min.js"></script>
        <script>
                                                            function compare(input) {
                                                                var today = moment(new Date()).format('YYYY-MM-DD');
                                                                if (input.value > today) {
                                                                    document.getElementById("notify").style.display = "inline-block";
                                                                    document.getElementById("notify").innerHTML = "Your DOB must be in the past";
                                                                } else if (input.value <= today) {
                                                                    document.getElementById("notify").style.display = "none";
                                                                    document.getElementById("notify").innerHTML = "";
                                                                }
                                                            }
        </script>
    </body>

</html>