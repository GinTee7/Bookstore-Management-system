<%-- 
    Document   : ManageAccounts
    Created on : Mar 5, 2023, 1:29:10 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Account</title>


    </head>
    <style>
        form {
            margin-bottom: 20px;
        }

        input[type="text"] {
            padding: 5px;
            width: 200px;
        }

        input[type="submit"] {
            padding: 5px 10px;
            background-color: #337ab7;
            color: #fff;
            border: none;
            cursor: pointer;
        }

        section {
            margin-top: 20px;
        }

        table.order {
            width: 100%;
            border-collapse: collapse;
        }

        table.order th,
        table.order td {
            padding: 8px;
            border: 1px solid #ddd;
            text-align: left;
        }

        table.order th {
            background-color: #f5f5f5;
        }

        table.order tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        table.order tr:hover {
            background-color: #e9e9e9;
        }

    </style>
    <body>
        <c:import url="header_loginedAdmin.jsp" />
        <form action="mainController" method="post">
            <input type="text" name="txtSeach" value="<%= (request.getParameter("txtSeach") == null) ? "" : request.getParameter("txtSeach")%>" >
            <input type="submit" value="searchAccount" name="action"> 
        </form>
        <section>
            <table class="order" style="width: 100%">
                <tr>
                    <th> ID</th>
                    <th> Email</th>
                    <th> Full Name</th>   
                    <th> status</th>
                    <th> phone</th>
                    <th> role</th>   
                    <th> action</th>

                </tr>


                <c:forEach var="acc" items="${accountList}">
                    <tr>
                        <td ><c:out value="${acc.getAccID()}" /></td>
                        <td ><c:out value="${acc.getEmail()}" /></td>
                        <td ><c:out value="${acc.getFullname()}" /></td>
                        <td >
                            <c:choose>
                                <c:when test="${acc.getStatus() eq 1}">active</c:when>
                                <c:otherwise>inActive</c:otherwise>
                            </c:choose>            
                        </td>
                        <td><c:out value="${acc.getPhone()}" /></td>
                        <td>
                            <c:choose>
                                <c:when test="${acc.getRole() eq 1}">admin</c:when>
                                <c:otherwise>user</c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <c:if test="${acc.getRole() eq 0}">
                                <c:url var="mylink" value="mainController">
                                    <c:param name="email" value="${acc.getEmail()}" />
                                    <c:param name="status" value="${acc.getStatus()}" />
                                    <c:param name="action" value="updateStatusAccount" />
                                </c:url>
                                <a href="${mylink}">Block/UnBlock</a>
                            </c:if>
                        </td>
                    </tr>
                </c:forEach>

            </table>
        </section>

    </body>
</html>
