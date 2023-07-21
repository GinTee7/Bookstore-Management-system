<%-- 
    Document   : ManageBooks
    Created on : Jul 17, 2023, 9:35:18 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Book</title>
    </head>
    <style>
        /* styles.css */
        table.order {
            width: 100%;
            border-collapse: collapse;
        }

        table.order th,
        table.order td {
            padding: 10px;
            border: 1px solid #ccc;
        }

        table.order th {
            background-color: #f2f2f2;
            font-weight: bold;
        }

        table.order td {
            text-align: center;
        }

        section {
            margin-top: 20px;
        }

    </style>
    <body>
        <c:import url="header_loginedAdmin.jsp" />

        <section>
            <table class="order" style="width: 100%">
                <tr>
                    <th> ID</th>
                    <th> Name</th>
                    <th> Price</th>   
                    <th> Image</th>
                    <th> Description</th>
                    <th> Cate ID</th>
                    <th> Cate Name</th>
                </tr>

                <form action="mainController" method="post">
                    <c:forEach var="book" items="${bookList}">
                        <tr>
                            <td ><c:out value="${book.getId()}" /></td>
                            <td ><c:out value="${book.getName()}" /></td>
                            <td ><c:out value="${book.getPrice()}" /></td>
                            <td ><img src="${book.getImgpath()}" class="book-image" style="width: 300px; height: 300px"></td>
                            <td ><c:out value="${book.getDescription()}" /></td>
                            <td><c:out value="${book.getCateid()}" /></td>
                            <td><c:out value="${book.getCatename()}" /></td>
                        </tr>
                    </c:forEach>
                </form>

            </table>
        </section>
    </body>
</html>
