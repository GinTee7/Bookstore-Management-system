<%-- 
    Document   : header_loginedAdmin
    Created on : Mar 4, 2023, 12:42:43 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

    </head>
    <style>
        header ul {
            background-image: url('images/background1.jpg');
            background-repeat: no-repeat;
            background-size: cover;
            padding: 2px;
            color: #fff;

        }
        header ul {
            list-style: none;
            padding: 0;
            margin: 0;
            display: flex;
            justify-content: space-between;
            background-color: #333;
            color: #fff;
            padding-top: 15px
        }

        header ul li {
            margin-right: 20px;
        }

        header ul li a {
            color: #fff;
            text-decoration: none;
            padding: 10px;
        }

        header ul li a:hover {
            background-color: #555;
        }

        header ul li:last-child {
            display: flex;
            align-items: center;
        }

        #name {
            color: yellow;
            font-weight: bold;
            margin-right: 10px;
        }

        #name::after {
            content: "|";
            margin-left: 10px;
            margin-right: 10px;
        }

        header ul li:last-child a {
            color: orangered;
        }


    </style>
    <body>
        <header>
            <ul>
                <li><a href="mainController?action=manageAccounts">Manage Accounts</a></li>    
                <li><a href="mainController?action=manageBooks">Manage Books</a></li>

                <li>Welcome <span id="name"></span> | <a href="mainController?action=logout&role=a">Logout</a></li>
            </ul>
        </header>

    </body>
</html>
