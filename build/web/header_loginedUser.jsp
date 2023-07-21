<%-- 
    Document   : header_loginedUser
    Created on : Feb 24, 2023, 7:59:58 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="user.css" type="text/css"/>
    </head>
    <style>
        .nav-menu {
            background-image: url('images/background1.jpg');
            background-repeat: no-repeat;
            background-size: cover;
            padding: 2px;
            color: #fff;

        }
    </style>
    <body class="login_user">
        <ul class="nav-menu">
            <li><a href="index.jsp">Home</a></li>
            <li><a href="changeProfile.jsp">Change Profile</a></li>
            <li><a href="completed.jsp">Completed Orders</a></li>
            <li><a href="canceled.jsp">Canceled Orders</a></li>
            <li><a href="processing.jsp">Processing Orders</a></li>
            <li class="search-box">
                From <input type="date" name="from"> to <input type="date" name="to">
                <input type="submit" value="Search">
            </li>
        </ul>
    </body>

</html>
