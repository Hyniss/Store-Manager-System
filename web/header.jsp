<%-- 
    Document   : header
    Created on : Jun 30, 2021, 5:36:34 PM
    Author     : DELL
--%>

<%@page import="model.Product"%>
<%@page import="model.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Category"%>
<%@page import="model.Category"%>
<%@page import="model.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>HaiNam Shop</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
    </head>
    <body id="page-top">
        <!-- Navigation-->
        <nav class="navbar navbar-expand-xxl navbar-dark fixed-top" id="mainNav">
            <a class="navbar-brand" href="Home"><img src="assets/img/home.png" alt="..." /></a>
            <div class="container">
                <a class="nav-link" href="ProductController">Product</a>
                <%
                    ArrayList<Cart> cart = (ArrayList<Cart>) request.getSession().getAttribute("cart");
                    if (((Account) session.getAttribute("account") == null)) {
                
                %>
                <a class="nav-link" href="login.jsp">Sign In</a>
                <% } else { %>
                <%if (((Account) session.getAttribute("account")).isIsAdmin() == true) { %>
                <a class="nav-link" href="ShowProductsForAdmin">Manage Products</a>
                <% } %>
                <a class="nav-link" href="MyOrderControl">My Orders</a>
                <a class="nav-link" href="ChangePass.jsp">Change Password</a>
                <a class="nav-link" href="Logout">  Log out</a>
                <% if ( cart != null ) {
                %>
                <a class="nav-link" href="cart.jsp">Cart(<%= cart.size() %>)</a>
                <% } else { %> 
                <a class="nav-link" href="#" onclick="alert('Cart is empty');">Cart(0)</a>
                <% } %>
                <a class="nav-link" >Hello, ${account.getUsername()}</a>
                <% } %>
            </div>
        </nav>
    </body>
</html>
