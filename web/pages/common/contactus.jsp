<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Contact Us</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet"
              href="fonts\FontAwesome.Pro.6.0.0.alpha3\fontawesome6\pro\css\all.min.css">
        <link rel="stylesheet" href="css/swiper-bundle.min.css">
        <link rel="stylesheet" href="css/style.css">
    </head>

    <body>
        <div class="main-wrapper">
            <jsp:include page="../common/header.jsp"/>

            <div class="contact container row">
                <div class="contact-item col-lg-6" style="min-height: 450px">
                    <div class="position-relative h-100">
                        <iframe class="position-relative w-100 h-100"
                                src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3723.890163548365!2d105.83528461464596!3d21.0370803928708!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135aba3847870db%3A0x3e6627a44ec34b3d!2sVietnam%20National%20Assembly!5e0!3m2!1sen!2s!4v1668139496444!5m2!1sen!2s"  
                                frameborder="0" style="min-height: 450px; border: 0" allowfullscreen="" aria-hidden="false"
                                tabindex="0"></iframe>
                    </div>
                </div>
                <div class="contact-item col-lg-6">
                    <div class="border-start border-5 border-primary ps-4 mb-5">
                        <h6 class="text-body text-uppercase mb-2">Contact Us</h6>
                        <h1 class="display-6 mb-0">
                            If You Have Any Feedback, Please Contact Us
                        </h1>
                    </div>
                    <form action="sendcontact" method="post">
                        <c:set var="a" value="${sessionScope.account}"/>
                        <div class="row g-3">
                            <div class="col-md-12">
                                <div class="form-floating">
                                    <input type="text" class="form-control border-0 bg-light" name="fullname"
                                           value="${a.fullname}" required=""/>
                                    <label for="name">Your Name</label>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-floating">
                                    <input type="email" class="form-control border-0 bg-light" name="email"
                                           value="${a.email}" required />
                                    <label for="email">Your Email</label>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-floating">
                                    <input type="text" class="form-control border-0 bg-light" name="phone"
                                           value="${a.phone}" pattern="[0-9]{10}" />
                                    <label for="email">Your Phone Number</label>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-floating">
                                    <textarea class="form-control border-0 bg-light" placeholder="Leave a message here"
                                              name="message" style="height: 150px" required=""> </textarea>
                                    <label for="message">Message</label>
                                </div>
                            </div>
                            <div class="col-12">
                                <button class="btn btn-2 btn-primary py-3 px-5" type="submit">
                                    Send Message
                                </button>
                            </div>
                            <c:if test="${success != null}">
                                <div class="alert alert-success alert-dismissible fade show"
                                     role="alert">
                                    <strong>${success}</strong>
                                    <button type="button" class="btn-close" data-bs-dismiss="alert"
                                            aria-label="Close"></button>
                                </div>
                            </c:if>
                        </div>
                    </form>
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
