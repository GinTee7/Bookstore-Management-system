<%-- 
    Document   : login
    Created on : Jun 18, 2023, 11:28:43 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Index</title>
        <link rel="stylesheet" href="index.css" type="text/css"/>
    </head>
    <body>
        <header>
            <%@include file="header.jsp" %>
        </header>   
        <section>
            <div class="background"></div>
            <div class="container">
                <div class="item">
                    
                    <div class="text-item">
                        <h2>Welcome! <br><span>
                                To Book Store <3
                            </span></h2>
                        <p>Helpful Books In the World</p>
                        
                    </div>
                    <div class="login-section">
                        <div class="form-box login">
                            <form action="mainController" method="post" >
                                <font style='color:red'><%= (request.getAttribute("WARNING") == null) ? "" : (String) request.getAttribute("WARNING")%></font>
                                <h2>Sign In</h2>
                                <div class="input-box">
                                    <span class="icon"><i class='bx bxs-envelope'></i></span>
                                    <input type="text" name="txtemail" required>
                                        <label >Email</label>
                                </div>
                                <div class="input-box">
                                    <span class="icon"><i class='bx bxs-lock-alt' ></i></span>
                                    <input type="password" name="txtpassword" required>
                                    <label>Password</label>
                                </div>
                                <button type="submit" value="login" name="action" class="btn">Login</button>
                                <input type="checkbox" value="savelogin" name="savelogin">Stayed signed in
                                <div class="create-account">
                                    <p> <a href="registration.jsp" class="register-link">Create A New Account?</a></p>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
        </section>
        
    </body>
</html>
