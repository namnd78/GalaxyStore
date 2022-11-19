<%-- 
    Document   : changepw
    Created on : Sep 15, 2022, 12:12:53 AM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/stylechangepw.css" />
    </head>
    <body>
        <div class="center">
            <h1>Change Password</h1>
            <form action="change" method="post">
                <div class="txt_field">
                    <label>Password</label>
                    <span></span>
                    <input type="password" name="password" required/>
                </div>
                <div class="txt_field">
                    <label>New Password</label>
                    <span></span>
                    <input type="password" name="newpassword" required/>
                </div>
                <div class="txt_field">
                    <label>Confirm Password</label>
                    <span></span>
                    <input type="password" name="cfpassword" required/>
                </div>
                <input type="submit" value="Submit">
            </form>
            <c:if test="${alert != null}">
                <div class="alert alert-danger alert-dismissible fade show"
                     role="alert">
                    <strong>${alert}</strong>
                </div>
            </c:if>
        </div>

    </body>
</html>
