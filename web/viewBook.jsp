<%-- 
    Document   : viewBook
    Created on : Jun 18, 2023, 11:30:37 PM
    Author     : ADMIN
--%>

<%@page import="sample.dao.BookDAO"%>
<%@page import="sample.dto.Book"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="p" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="mycss.css" type="text/css " />
        <link rel="stylesheet" href="css/bootstrap.min.css"/>
    </head>
    <body>
        <jsp:useBean id="bookObj" class="sample.dto.Book" scope="request"></jsp:useBean>
            <table>
                <tr><td rowspan="8"><img src="<jsp:getProperty name="bookObj" property="imgpath"></jsp:getProperty> "style="width: 120px;height: 120px"></td></tr>
                <tr><td>id:<jsp:getProperty name="bookObj" property="id"></jsp:getProperty></td></tr>
                <tr><td>product name:<jsp:getProperty name="bookObj" property="name"></jsp:getProperty></td></tr>
                <tr><td>price:<jsp:getProperty name="bookObj" property="price"></jsp:getProperty></td></tr>
                <tr><td>description:<jsp:getProperty name="bookObj" property="description"></jsp:getProperty></td></tr>
                <tr><td>status:<jsp:getProperty name="bookObj" property="status"></jsp:getProperty></td></tr>
                <tr><td>cate id:<jsp:getProperty name="bookObj" property="cateid"></jsp:getProperty></td></tr>
                <tr><td>category:<jsp:getProperty name="bookObj" property="catename"></jsp:getProperty></td></tr>
        </table>
    </body> 
</html>
