
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en"> 
    <head>
        <title>Blogs</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="Blog Template">
        <meta name="author" content="Xiaoying Riley at 3rd Wave Media">    
        <link rel="shortcut icon" href="favicon.ico"> 

        <script defer src="https://use.fontawesome.com/releases/v5.7.1/js/all.js" integrity="sha384-eVEQC9zshBn0rFj4+TU78eNA19HMNigMviK/PU/FFjLXqa/GKPgX58rvt5Z8PLs7" crossorigin="anonymous"></script>

        <link id="theme-style" rel="stylesheet" href="css/blog.css">
        <link rel="stylesheet" href="css/style.css">

    </head> 

    <body>
        <jsp:include page="../common/header.jsp"/>
        <div class="main-wrapper">
            <form action="blog">
                <section class="blog-list px-3 py-5 p-md-5">
                    <div class="container row">
                        <div class="col-md-9">
                            <c:if test="${numberBlogs == 0}">
                                <h2>No Blog Found ...</h2>
                            </c:if>
                            <c:forEach items="${blogsPage}" var="b">
                                <div class="item mb-5 pr-3">
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
                        <div class="col-md-3">
                            <div class="sidebar-widget">
                                <h4 class="sidebar-title search-blog">Search</h4>
                                <div class="form-group position-relative has-icon-left">
                                    <input type="search" class="form-control round" placeholder="Search..." name="keyblog" value="${keyblog}">
                                    <div class="form-control-icon">
                                        <i class="fa-regular fa-magnifying-glass"></i>
                                    </div>
                                </div>
                            </div>
                            <div class="sidebar-widget">
                                <h4 class="sidebar-title">Topics</h4>
                                <div class="sidebar-widget-category">
                                    <ul>
                                        <li class="${topicId == 0 ? "selected" : ""}">
                                            <input ${topicId == 0 ? "checked" : ""} type="radio" name="topicId" id="all" value="${0}" onclick="this.form.submit()">
                                            <label for="all"><a>All Topic</a></label>
                                        </li>
                                        <c:forEach items="${topics}" var="topic">
                                            <li class="${topic.id == topicId ? "selected" : ""}">
                                                <input ${topicId == topic.id ? "checked" : ""} type="radio" name="topicId" id="${topic.name}" value="${topic.id}" onclick="this.form.submit()">
                                                <label for="${topic.name}"><a>${topic.name}</a></label>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <div class="pro-pagination-style text-center" data-aos="fade-up" data-aos-delay="200">
                    <div class="pages">
                        <ul>
                            <c:if test="${page > 1}">
                                <li class="li">
                                    <input type="radio" name="page" id="prev" value="${page - 1}" onclick="this.form.submit()" hidden="">
                                    <label for="prev"><a class="page-link"><i
                                                class="fa fa-angle-left"></i></a></label>
                                </li>  
                            </c:if>
                            <c:forEach begin="${1}" end="${requestScope.numberPages}" var="i">
                                <li class="li">
                                    <input type="radio" name="page" id="${i}" value="${i}" onclick="this.form.submit()" hidden="">
                                    <label for="${i}"><a class="page-link ${i == page ? "active":""}">${i}</a></label>
                                </li>    
                            </c:forEach>
                            <c:if test="${page < numberPages}">
                                <li class="li">
                                    <input type="radio" name="page" id="next" value="${page + 1}" onclick="this.form.submit()" hidden="">
                                    <label for="next"><a class="page-link"><i
                                                class="fa fa-angle-right"></i></a></label>
                                </li>   
                            </c:if>
                        </ul>
                    </div>
                </div>
            </form>
        </div>
        <jsp:include page="../common/footer.jsp"/>

        <script src="assets/plugins/jquery-3.3.1.min.js"></script>
        <script src="assets/plugins/popper.min.js"></script> 
        <script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script> 
    </body>
</html> 