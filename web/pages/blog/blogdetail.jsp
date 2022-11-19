<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en"> 
    <head>
        <title>Blog Details</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet"
              href="fonts\FontAwesome.Pro.6.0.0.alpha3\fontawesome6\pro\css\all.min.css">
        <link rel="stylesheet" href="css/swiper-bundle.min.css">
        <link id="theme-style" rel="stylesheet" href="assets/css/blog.css">
        <link rel="stylesheet" href="css/style.css">

    </head> 

    <body>
        <jsp:include page="../common/header.jsp"/>
        <div class="main-wrapper">
            <article class="px-3 py-5 p-md-5">
                <div class="container">
                    <div class="blog-post">
                        <h3>
                            ${blog.title}
                        </h3>
                        <div class="meta mb-1">
                            <span class="time">
                                <img src="images/avatar/${blog.account.avatar}" width="45px" height="45px" alt="Your account"
                                     class="rounded-circle" />
                                ${blog.account.fullname}
                            </span>
                            <span class="date">Published ${blog.getCreatedDates()}</span>
                        </div>
                        <hr>
                        <h5>
                            ${blog.description}
                        </h5>
                        <br>
                        <div>
                            ${blog.content} 
                        </div>
                    </div>
                    <section class="blog-list py-5">
                        <hr>

                        <h2 class="title">You might also like</h2>
                        <div class="container">
                            <div>
                                <div class="item mb-5">
                                    <div class="media">
                                        <img class="mr-3 img-fluid post-thumb d-none d-md-flex"
                                             src="https://www.cnet.com/a/img/resize/cc54b4ea7bf3867524004f4770dc39f56f843932/hub/2022/02/22/1c27500c-62d8-4746-a0a1-5ebb98cc230f/samsung-galaxy-s22-and-s22-plus-and-s22-ultra-compared-006.jpg?auto=webp&fit=crop&height=675&width=1200"
                                             alt="image">
                                        <div class="media-body">
                                            <h2 class="title mb-1"><a href="blogdetail?id=${b.id}">Move Over, Google:
                                                    Samsung
                                                    Wants to Reinvent the Phone Call, Too</a></h2>
                                            <div class="meta mb-1"><span class="date">Published
                                                    ${b.getCreatedDates()}</span><span
                                                    class="time">${b.account.fullname}</span>
                                            </div>
                                            <div class="intro">Samsung's Bixby virtual assistant will let you answer a phone
                                                call via text!</div>
                                        </div>
                                    </div>
                                </div>
                                <c:forEach items="${relatedBlogs}" var="b">
                                    <div class="item mb-5">
                                        <div class="media">
                                            <img class="mr-3 img-fluid post-thumb d-none d-md-flex" src="${b.thumbnail}" alt="image">
                                            <div class="media-body">
                                                <h2 class="title mb-1"><a href="blogdetail?id=${b.id}">${b.title}</a></h2>
                                                <div class="meta mb-1"><span class="date">Published  ${b.getCreatedDates()}</span><span class="time">${b.account.fullname}</span></div>
                                                <div class="intro">${b.description}</div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>   
                            </div>
                        </div>
                    </section>
                </div>
            </article>
        </div>
        <jsp:include page="../common/footer.jsp"/>

        <script src="js/bootstrap.bundle.min.js"></script>
        <script src="js/jquery-3.6.0.min.js"></script>
        <script src="js/swiper-bundle.min.js"></script>
        <script src="js/main.js"></script>
    </body>
</html> 

