<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login</title>
        <link rel="stylesheet"
              href="fonts/FontAwesome.Pro.6.0.0.alpha3/fontawesome6/pro/css/all.min.css">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/swiper-bundle.min.css">
        <link rel="stylesheet" href="css/loginregister.css">
        <script src="https://www.google.com/recaptcha/api.js" async defer></script>
        <style>
            .g-recaptcha div {
                margin-bottom: 10px;
                width: auto !important;
            }
        </style>
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
                                    <h1>Forgot Password</h1>
                                </div>
                                <h6 class="text-center">Please enter your login email, we'll send a new random password to your inbox</h6>
                                <div class="tab-content">
                                    <div id="login" class="tab-pane fade ${path == 'login' ? "show active" : ""}">
                                        <div class="login-form-container">
                                            <div class="login-register-form">
                                                <form action="EmailSendingServlet" method="post">
                                                    <div>
                                                        <label for="email">Email</label>
                                                        <input id="email" type="email" name="recipient" value="${value}" required />
                                                    </div>
                                                    <div class="g-recaptcha text-center"  data-sitekey="6LfbedMiAAAAAHbDG2DCtsXTjxXwrN7mbPGp_g-8"></div>
                                                    <c:if test="${alert != null}">
                                                        ${alert}
                                                    </c:if>
                                                    <div class="d-flex justify-content-center align-content-center">
                                                        <button class="btn btn-2" id="btn-submit" style="padding: 0;" type="submit">Send me new password</button>
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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/1.1.2/axios.min.js"
                integrity="sha512-bHeT+z+n8rh9CKrSrbyfbINxu7gsBmSHlDCb3gUF1BjmjDzKhoKspyB71k0CIRBSjE5IVQiMMVBgCWjF60qsvA=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script>
            function VerifyCaptcha() {
                axios.post('EmailSendingServlet', {
                }).then((response) => {
                    document.getElementById("alert").innerHTML = response.data
                }).catch((error) => {
                    console.log(error);
                });
            }
        </script>
    </body>
</html>