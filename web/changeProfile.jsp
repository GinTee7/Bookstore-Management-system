<%-- 
    Document   : changeProfile
    Created on : Feb 24, 2023, 12:12:13 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="mycss.css" type="text/css"/>
    </head>
    <header>
        <%@include file="header.jsp" %>
    </header>
    <style>
        .formchange {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 83.9vh;
            background-image: url('images/background.jpg');
            background-size: cover;
            background-position: center;
        }
        .formchange table {
            background-color: rgba(255, 255, 255, 0.8); /* Màu nền */
            color: #333; /* Màu chữ */
        }
        .formchange table {
            width: 400px; /* Độ rộng của bảng */
            margin: 0 auto; /* Căn giữa */
        }
        .formchange input[type="text"] {
            font-weight: bold;
            font-size: 20px;
            padding: 5px;
            width: 80%;
        }
        .formchange input[type="submit"] {
            font-size: 15px;
            margin-left: 80px;
            margin-right: auto;
            padding: 5px 10px;
            display: block;
        }
        .formchange td:first-child {
            font-weight: bold;
        }
        .formchange tr:last-child td {
            text-align: center;
        }


    </style>
    <body>
        <% String email = (String) session.getAttribute("email");
        %>
        <form action="mainController" method="post" class="formchange">
            <table>
                <tr>
                    <td>Fullname</td><td><input style="font-weight: bolder; font-size: 20px" type="text" name="txtfullname"></td>
                </tr>    
                <tr><td>Phone</td><td><input style="font-weight: bolder; font-size: 20px" type="text" name="txtphone"> </td>
                </tr> 
                <tr><td colspan="2"><input style="font-size: 15px" type="submit" value="change" name="action"></td></tr>
            </table>
        </form>
    </body>

</html>
