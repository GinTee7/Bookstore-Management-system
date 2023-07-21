<%-- 
    Document   : personalPage
    Created on : Jun 18, 2023, 11:29:22 PM
    Author     : ADMIN
--%>

<%@page import="sample.dao.AccountDAO"%>
<%@page import="sample.dto.Account"%>
<%@page import="javafx.scene.control.Accordion"%>
<%@page import="sample.dto.Order"%>
<%@page import="sample.dto.OrderDetail"%>
<%@page import="java.util.ArrayList"%>
<%@page import="sample.dao.OrderDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Personal Page</title>

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

        <%
            String name = (String) session.getAttribute("name");
            String email = (String) session.getAttribute("email");
            Cookie[] c = request.getCookies();
            boolean login = false;
            if (name == null) {
                String token = "";
                for (Cookie cookie : c) {
                    if (cookie.getName().equals("selector")) {
                        token = cookie.getValue();
                        Account acc = AccountDAO.getAccount(token);
                        if (acc != null) {
                            name = acc.getFullname();
                            email = acc.getEmail();
                            login = true;

                        }
                    }
                }
            } else {
                login = true;
            }
            //show content if login = true
            if (login) {
        %>

        <header>
            <%@include file="header_loginedUser.jsp" %>
        </header>
        <section>
            <h3 style="margin-left: 50px">Welcome <%=name%> come back </h3>
            <h3> <a href="mainController?action=logout" style="margin-left: 50px">Logout</a></h3>
        </section>
        <section><!-- load all orders of the user at here-->
            <%

                ArrayList<Order> list = OrderDAO.getOrders(email);
                String[] status = {"", "processing", "completed", "canceled"};
                if (list != null && !list.isEmpty()) {
                    for (Order ord : list) {%>
            <table class="order" >
                <tr><td>Order ID</td><td>Order Date</td><td>Ship Date</td><td>Order's Status</td><td>action</td></tr>
                <tr><td><%= ord.getOrderID()%></td>
                    <td><%= ord.getOrderDate()%></td>
                    <td><%= ord.getShipDate()%></td>
                    <td><%= status[ord.getStatus()]%></td>
                    <td><a href="orderDetail.jsp?orderid=<%= ord.getOrderID()%>"</td>
                </tr>
            </table>
            <%    }
            } else

            %><p>You don't have any order!</p>
        </section>

        <% }%>
    </body>
</html>
