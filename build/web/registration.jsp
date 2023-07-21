<%-- 
    Document   : registration
    Created on : Jun 18, 2023, 11:30:03 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Index</title>
        <link rel="stylesheet" href="mycss.css" type="text/css"/>
    </head>
    <body>
        <header>
            <%@include file="header.jsp" %>
        </header>
        <style>

            section {
                background: url(images/background.jpg) no-repeat;
                background-position: center;
                background-size:cover ;
                height: 80vh;
                width: 100%;


                border-radius: 5px;
            }

            h1 {
                text-align: center;
                padding-top: 10px;
                color: #4CAF50
            }

            table {
                width: 100%;
                border-collapse: collapse;
            }

            table td {
                padding: 10px;
                color: #4CAF50;
                padding-left: 50px

            }

            input[type="text"],
            input[type="password"] {
                width: 50%;
                padding: 8px;
                border: 1px solid #ccc;
                border-radius: 4px;
            }

            input[type="submit"] {
                width: auto;
                padding: 8px 20px;
                background-color: #4CAF50;
                color: white;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }

            input[type="submit"]:hover {
                background-color: #45a049;
            }
        </style>

    </style>
    <section>
        <form action="mainController" method="post" class="formregisterer">
            <h1>Register</h1>
            <table style="border: 1">
                <tr><td>Email</td>
                    <td><input type="text" name="txtemail" required="^(\\w)+@[a-zA-Z]+([.](\\w+){1,2}" value="<%= (request.getAttribute("txtemail") == null) ? "" : request.getAttribute("txtemail")%>"></td></tr>
                <tr><td>Full name</td>
                    <td><input type="text" name="txtfullname" required="" value="<%= (request.getAttribute("txtfullname") == null) ? "" : request.getAttribute("txtfullname")%>"></td></tr>
                <tr><td>Password</td>
                    <td><input type="password" name="txtpassword" required=""></td></tr>
                <tr><td>Phone</td>
                    <td><input type="text" name="txtphone" value="<%= (request.getAttribute("txtphone") == null) ? "" : request.getAttribute("txtphone")%>">
                        <%= (request.getAttribute("ERROR") == null) ? "" : request.getAttribute("ERROR")%></td></tr>
                <tr><td colspan="2"><input type="submit" value="register" name="action"></td></tr>
            </table>
        </form> 
    </section>

</body>
</html>