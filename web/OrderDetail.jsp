<%-- 
    Document   : OrderDetail
    Created on : Jun 18, 2023, 11:25:02 PM
    Author     : ADMIN
--%>
<%@page import="sample.dto.Order"%>
<%@page import="sample.dto.OrderDetail"%>
<%@page import="java.util.ArrayList"%>
<%@page import="sample.dao.OrderDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order detail</title>
        <link rel="stylesheet" href="mycss.css" type="text/css"/>
    </head>
    <style>
        .welcome {
            margin-left: 50px;
        }

        .logout {
            margin-left: 50px;
        }

        .order {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        .order td {
            border: 1px solid #ccc;
            padding: 10px;
        }

        .order .plant-img {
            width: 150px;
            height: 150px;
        }

    </style>

    <%
        String name = (String) session.getAttribute("name");
        if (name == null) {
    %>
    <p><font color='red'>you must login to view personal page</font></p>
    <p></p>
    <% } else {
    %>
    <header>
        <%@include file="header_loginedUser.jsp" %>
    </header>
    <section>
        <h3 class="welcome">Welcome <%= name%> come back</h3>
        <h3><a href="mainController?action=logout" class="logout">Logout</a></h3>
    </section>

    <section>
        <%
            String orderid = request.getParameter("orderid");
            if (orderid != null) {
                int orderID = Integer.parseInt(orderid.trim());
                ArrayList<OrderDetail> list = OrderDAO.getOrderDetail(orderID);
                if (orderid != null && !list.isEmpty()) {
                    int money = 0;
                    for (OrderDetail detail : list) {
        %>
        <table class="order">
            <tr>
                <td>Order ID</td>
                <td>Book ID</td>
                <td>Book Name</td>
                <td>Image</td>
                <td>Quantity</td>
            </tr>
            <tr>
                <td><%= detail.getOrderID()%></td>
                <td><%= detail.getBookID()%></td>
                <td><%= detail.getBookName()%></td>
                <td><img src="<%= detail.getImgPath()%>" class="plant-img" /><br /><%= detail.getPrice()%></td>
                <td><%= detail.getQuantity()%></td>
                <% money = money + detail.getPrice() * detail.getQuantity(); %>
            </tr>
        </table>
        <%
            }
        %>
        <h3>Total money: <%= money%></h3>
        <%
        } else {
        %>
        <p>You don't have any order!</p>
        <%
                }
            }
        %>
    </section>


    <% }%>
</html>
