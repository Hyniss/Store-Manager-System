<%-- 
    Document   : cart
    Created on : Jul 16, 2021, 1:48:09 PM
    Author     : DELL
--%>

<%@page import="model.Product"%>
<%@page import="dal.productDAO"%>
<%@page import="java.util.List"%>
<%@page import="model.Cart"%>
<%@page import="model.Order"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Cart</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
    </head>

    <jsp:include page="header.jsp"></jsp:include>
    <%
        Account account = (Account) session.getAttribute("account");
        List<Cart> cart = (List<Cart>) session.getAttribute("cart");
        productDAO pDAO = new productDAO();
        Product prox = new Product();
        int total = 0;
        String mess = (String) request.getAttribute("mess");
        if (account == null) {
    %>
    <h2>You must be login to access this</h2>
    <% } else { %>
    <body>
        <div class="container">
            <div class="row">
                <!-- Cart -->
                <div style="background-color: white; box-sizing: border-box; border-radius: 2px;" class="col-sm-8">
                    <div class="table-title">
                        <div class="row">
                            <div class="col-sm-6">
                                <h2> Cart </h2>
                                <% if (mess != null) {%>
                                <h6 style="color: red;" > <%= mess%> </h6>
                                <% } %>
                            </div>
                        </div>
                    </div>
                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th>ProductID</th>
                                <th>Product Name</th>
                                <th>Image</th>
                                <th>Quantity</th>
                                <th>Price</th>
                                <th>Total</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                for (Cart c : cart) {
                                    prox = pDAO.getProductByID(c.getPid());
                                    total += (c.getAmount() * prox.getPrice());
                            %>
                            <tr>
                                <td><%= c.getPid()%></td>
                                <td><%= prox.getName()%></td>
                                <td><img class="card-img-top" src="<%= prox.getImg()%>" alt="Product img"></td>
                                <td><%= c.getAmount()%>
                                    
                                </td>
                                <td><%= prox.getPrice()%>đ</td>
                                <td><%= c.getAmount() * prox.getPrice()%>đ</td>
                                <td>
                                    <button class="btn btn-danger"><a style="text-decoration: none;color: black;" href="CartController?service=deletePcart&pidcart=<%= c.getPid()%>">Delete</a></button>
                                </td>
                            </tr>
                            <% }%>
                        </tbody>
                    </table>
                    <div class="table-title">
                        <div class="row">
                            <div class="col-sm-6">
                                <h2> Total Bill: </h2>
                            </div>
                            <div class="col-sm-6" style="text-align: left;">
                                <h2> <%= total%> </h2>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Bill -->

                <div style="background-color: white; box-sizing: border-box; border-radius: 2px; margin-left: 5%" class="col-sm-3">
                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th>Username</th>
                                <th>Ship</th>
                                <th>Total</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td><%= account.getUsername()%></td>
                                <td>Free</td>
                                <td><%= total%></td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="table-title">
                        <div class="row">
                            <form action="CartController" method="post">
                                <div class="modal-header">						
                                    <h4 class="modal-title">CheckOut</h4>
                                </div>
                                <div class="modal-body">					
                                    <div class="form-group">
                                        <label>Username: <%= account.getUsername()%></label>
                                        <input type="hidden" name="username" value="<%= account.getUsername()%>"
                                    </div>
                                    <div class="form-group">
                                        <label>Full Name:</label>
                                        <input name="fullname" type="text" class="form-control" required>
                                    </div>
                                    <div class="form-group">
                                        <label>Address:</label>
                                        <input name="address" type="text" class="form-control" required>
                                    </div>
                                    <div class="form-group">
                                        <label>Total: <%= total%></label>
                                        <input type="hidden" name="total" value="<%= total %>"
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <input type="submit" class="btn btn-success" value="Check Out">
                                    <input type="hidden" name="service" value="checkout">
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <% }%>
</html>
