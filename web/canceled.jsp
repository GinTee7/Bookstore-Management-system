<%-- 
    Document   : completed
    Created on : Mar 16, 2023, 2:53:19 PM
    Author     : ADMIN
--%>

<%@page import="sample.dto.Order"%>
<%@page import="sample.dao.OrderDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cancel Orders Page</title>
        <link rel="stylesheet" href="mycss.css" type="text/css"/>
    </head>
    <style>
    table {
      border-collapse: collapse;
      width: 100%;
    }

    td {
      text-align: left;
      padding: 8px;
    }

    tr:nth-child(even) {
      background-color: #f2f2f2;
    }

    td {
      border-bottom: 1px solid #ddd;
    }

  </style>
    <body>
        <header>
            <%@include file="header_loginedUser.jsp" %>
        </header>
        <section><!-- load all orders of the user at here-->
            <%
                String email = (String) session.getAttribute("email");
                ArrayList<Order> list = OrderDAO.getOrders(email);
                String[] status = {"", "processing", "completed", "canceled"};
                if (list != null && !list.isEmpty()) {
                    for (Order ord : list) {
                        if (ord.getStatus() == 3) {
            %>
            <table class="order" >
                <tr><td>Order ID</td><td>Order Date</td><td>Ship Date</td><td>Order's Status</td><td>action</td></tr>
                <tr><td><%= ord.getOrderID()%></td>
                    <td><%= ord.getOrderDate()%></td>
                    <td><%= ord.getShipDate()%></td>
                    <td><%= status[ord.getStatus()]%></td>
                    <td><a href="orderDetail.jsp?orderid=<%= ord.getOrderID()%>"</td>
                    <td><a href="mainController?action=orderAgain&ordid=<%= ord.getOrderID()%>">order again</a></td>
                </tr>
            </table>
            <%    }
                }
            } else

            %><p>You don't have any order!</p>
        </section>
        
    </body>
</html>
