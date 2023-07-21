<%-- 
    Document   : viewcart
    Created on : Jun 18, 2023, 11:31:29 PM
    Author     : ADMIN
--%>

<%@page import="java.util.Date"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashMap"%>
<%@page import="sample.dto.Book"%>
<%@page import="sample.dao.BookDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!--        <link rel="stylesheet" href="mycss.css" type="text/css" />-->
        <link rel="stylesheet" href="css/bootstrap.min.css"/>

    </head>
    <body>

        <header>
            <%@include file="header.jsp" %>

        </header>
        <style>
            .shopping-table {
                width: 100%;
                border-collapse: collapse;
                border: 1px solid #ccc;
                margin-bottom: 20px;
            }

            .shopping-table td {
                border: 1px solid #ccc;
                padding: 10px;
            }

            .title-row td {
                font-weight: bold;
                background-color: #f9f9f9;
            }

            .book-image {
                width: 200px;
                height: 200px;
            }

            .shopping-section {
                margin-bottom: 20px;
            }

            section:last-child {
                text-align: center;
            }

        </style>
        <section>
            <%
                String name = (String) session.getAttribute("name");
                if (name != null) {
            %>  
            <h4>Welcome <%= session.getAttribute("name")%> come back</h4>
            <h4><a href="mainController?action=logout">Logout</a></h4>
            <h4><a href="personalPage.jsp">View Cart page</a></h4>
            <%
                }
            %>
            <font style='color: red;'> <%= (request.getAttribute("WARNING") == null) ? "" : (String) request.getAttribute("WARNING")%> </font>
            <section class="shopping-section">
                <table class="shopping-table">
                    <tr class="title-row">
                        <td>Product ID</td>
                        <td>Image</td>
                        <td>Price</td>
                        <td>Quantity</td>
                        <td>Action</td>
                    </tr>
                    <%
                        HashMap<String, Integer> cart = (HashMap) session.getAttribute("cart");
                        if (cart != null) {
                            float total = 0;
                            Set<String> bids = cart.keySet();
                            for (String bid : bids) {
                                Book b = BookDAO.getBook(bid);
                                int quantity = cart.get(bid);
                    %>
                    <form action="mainController" method="post"> 
                        <tr>
                            <td>
                                <input type="hidden" value="<%= bid%>" name="bid">
                                <a href="getBookServlet?bid=<%= bid%>"><%= bid%></a>
                            </td>
                            <td><img src="<%= b.getImgpath()%>" class="book-image"></td>
                            <td><%= b.getPrice()%></td>
                            <td><input type="text" value="<%= quantity%>" name="quantity"></td> 
                            <td>
                                <input type="submit" value="Update" name="action">
                                <input type="submit" value="Delete" name="action">
                            </td>
                        </tr>
                    </form>
                    <%
                            total = total + b.getPrice() * quantity;
                        }
                    %>
                    <tr>
                        <td colspan="5">Total money: <%= total%></td>
                    </tr>
                    <%
                    } else {
                    %>
                    <tr>
                        <td colspan="5">Your cart is empty</td>
                    </tr>
                    <% }%>
                    <tr>
                        <td colspan="5">Order Date: <%= (new Date()).toString()%></td>
                    </tr>
                    <tr>
                        <td colspan="5">Ship Date: N/A</td>
                    </tr>
                </table>
            </section> 

            <section>
                <form action="mainController" method="post">
                    <input type="submit" value="SaveOrder" name="action">
                </form>
            </section>


    </body>
</html>

