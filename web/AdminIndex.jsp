<%-- 
    Document   : AdminIndex
    Created on : Jun 18, 2023, 11:24:16 PM
    Author     : ADMIN
--%>

<%@page import="sample.dao.AccountDAO"%>
<%@page import="sample.dto.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="a" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
    </head>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 600px;
            margin: 100px auto;
            background-color: #ffffff;
            padding: 40px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }

        h1 {
            color: #333333;
            text-align: center;
            margin-bottom: 20px;
        }

        

    </style>
    <body>
        <a:import url="header_loginedAdmin.jsp" />

        <a:set var="email" value="${sessionScope.email}" />
        <a:set var="name" value="${sessionScope.name}" />
        <a:set var="c" value="${cookie}" />
        <a:set var="login" value="false" />
        <a:choose>
            <a:when test="${name==null}">
                <a:set var="token" value=""/>
                <a:forEach var="aCookie" items="${c}" >
                    <a:if test="${test.name eq 'selector'}" >
                        <a:set var="token" value="aCookie.value" />
                        <a:set var="acc" value="${AccountDAO.getAccount(token)}"/>
                        <a:if test="${not empty acc}">
                            <a:set var="name" value="${acc.Fullname}" />
                            <a:set var="email" value="${acc.Email}" />
                            <a:set var="login" value="true" />
                        </a:if>
                    </a:if>
                </a:forEach>
            </a:when>
            <a:otherwise>
                <a:set var="login" value="true" />
            </a:otherwise>
        </a:choose>
        <a:if test="${login==true}">
        </a:if>  
        <div class="container">
            <h1>Welcome Admin comeback</h1>
            
        </div>
    </body>
</html>
