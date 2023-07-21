<%-- 
    Document   : header
    Created on : Feb 24, 2023, 7:22:07 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="header.css" type="text/css"/>

        <title>BookStore</title> 
    </head>
    <style>
        .header {
            background-image: url('images/background1.jpg');
            background-repeat: no-repeat;
            background-size: cover;
            padding: 2px;
            color: #fff;

        }
    </style>
    <body class="header-login">
        <header class="header">
            <nav class="navbar">

                <a href=""><img src="images/logo.png" id="logo" style="width: 100px"></a>
                <a href="mainController?action=">Home</a>  
                <!--                <a href="registration.jsp">Register</a>-->
                <a href="login.jsp">Login</a>
                <a href="mainController?action=viewcart">View cart</a>

                <form action="mainController" method="post" class="search-bar">
                    <input type="text" name="txtsearch" placeholder="Search Book" value="<%= (request.getParameter("txtsearch") == null) ? "" : request.getParameter("txtsearch")%>">
                    <select name="searchby" class="selection">
                        <option value="byname">by name</option>
                        <option value="bycate">by category</option>
                    </select>
                    <input type="submit" value="search" name="action" style="margin-left: 5px; margin-right: 15px; background-color: #333; color:white; border: none"> 

                </form>


            </nav>
        </header>
    </body>
</html>
