
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Help</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet"
              href="fonts\FontAwesome.Pro.6.0.0.alpha3\fontawesome6\pro\css\all.min.css">
        <link rel="stylesheet" href="css/swiper-bundle.min.css">
        <link rel="stylesheet" href="css/loginregister.css">
        <link rel="stylesheet" href="css/header.css">
        <link rel="stylesheet" href="css/help.css">
        <link rel="stylesheet" href="css/footer.css">
    </head>
    <body>
        <div class="main-wrapper">
            <jsp:include page="../common/header.jsp"/>

            <div class="help-nav container">
                <div class="row">
                    ${html}
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
