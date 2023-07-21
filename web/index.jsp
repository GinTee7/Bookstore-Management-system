<%-- 
    Document   : index
    Created on : Jun 18, 2023, 11:27:35 PM
    Author     : ADMIN
--%>
<%@page import="sample.dto.Book"%>
<%@page import="sample.dao.BookDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BookStore</title>
        <link rel="stylesheet" href="index.css" type="text/css"/>
        <link rel="stylesheet" href="css/bootstrap.min.css"/>
    </head>

    <body>
        <header>
            <%@include file="header.jsp"%>
        </header>

        <style>
            .image-container {
                display: flex; 
                flex-wrap: wrap; 
                justify-content: flex-start; 
            }

            .image-container img {
                
                margin: 10px; /* Add some margin around the images */
            }

            .flower {
                display: flex;
                flex-direction: column;
                align-items: center;
                margin-bottom: 50px;
                margin-right: 20px;
                margin-top: 1rem;
                margin-left: 100px;
            }

            .details {
                margin-top: 10px;
                text-align: center;
            }

            .details a {
                display: inline-block;
                padding: 5px 10px;
                background-color: #333;
                color: #fff;
                text-decoration: none;
                border-radius: 3px;
            }

            .details a:hover {
                background-color: #555;
            }

        </style>
        <img src="images/background2.jpg" width="1000" height="500" alt="background2" style="display: flex; 
                flex-wrap: wrap; 
                justify-content: flex-start; 
                margin-left: 250px"/>

            <%
                String keyword = request.getParameter("txtsearch");
                String searchby = request.getParameter("searchby");
                ArrayList<Book> list;
                String[] tmp = {"out of stock", "available"};
                if (keyword == null && searchby == null) {
                    list = BookDAO.getBooks("", "");
                } else {
                    list = BookDAO.getBooks(keyword, searchby);
                }
                if (list != null && !list.isEmpty()) {
                    for (Book b : list) {%>




            <div class="flower col-lg-6" > 
                <img style="width: 200px; height: 250px; margin-left: 50px" src='<%=b.getImgpath()%> ' class='plantimg'/>
                <div class="details">
                    Product ID: <%=b.getId()%><br>
                    Product Name: <%=b.getName()%><br>
                    Price: <%= b.getPrice()%><br>
                    Status: <%= tmp[b.getStatus()]%><br>
                    Category: <%=b.getCatename()%><br>
                    <a href="mainController?action=addtocart&bid=<%= b.getId()%>">add to cart</a>
                </div>               
            </div>

            <%      }
                }
            %>
        </section>

    </body>
</html>
