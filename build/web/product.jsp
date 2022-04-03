<%@page import="dal.productDAO"%>
<%@page import="model.Account"%>
<%@page import="model.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Product"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Shop</title>
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
    <body id="productback">
        <jsp:include page="header.jsp"></jsp:include>

            <div class="container">
                <div class="row">
                    <div class="col-sm-3">
                        <div class="card bg-light mb-3">
                            <div class="card-header bg-primary text-white text-uppercase"><i class="fa fa-list"></i> Categories</div>
                            <ul class="list-group category_block">
                            <% ArrayList<Category> listC = (ArrayList<Category>) request.getAttribute("listC");
                                for (Category c : listC) {
                            %>
                            <li class="list-group-item text-white " > <a href="ProductController?service=filter&cid=<%= c.getCid()%>" style="text-decoration: none;"> <%= c.getCname()%> </a></li>
                                <% } %>

                        </ul>
                    </div>
                </div>
                <div  class="col-sm-9">
                    <form class="form-inline" action = "ProductController">
                        <input type="text" id="pname" placeholder="Product Name... " name="name">
                        <button type="submit" class="btn btn-outline-info">Search</button>
                        <input type="hidden" name="service" value="search">
                    </form>
                    <div id="content" class="row">
                        <%

                            Account account = (Account) session.getAttribute("account");
                            ArrayList<Product> listP = (ArrayList<Product>) request.getAttribute("listP");

                            for (Product p : listP) {

                        %>
                        <div  class="col-lg-4 col-sm-6 mb-4">

                                <div id="eleproduct" class="card">
                                    <a class="portfolio-link" data-bs-toggle="modal" href="ProductController?service=detail&pid=<%= p.getPid()%>">
                                        <img class="card-img-top" src="<%= p.getImg()%>" alt="Card image cap">
                                    </a>

                                    <div class="card-body">
                                        <h4 class="card-title show_txt"><a  title="View Product" style="text-decoration: none;"><%= p.getName()%></a></h4>
                                        <p class="card-text show_txt"><%= p.getTitle()%></p>
                                        <div class="row">
                                            <div class="col">
                                                <p class="btn btn-lg btn-primary" disabled><%= p.getPrice()%>đ</p>
                                            </div>
                                            <div class="col">
                                                <%
                                                    if (account != null) {
                                                %>
                                                <a href="ProductController?service=detail&pid=<%= p.getPid()%>" class="btn btn-outline-success">Add to Cart</a>
                                                <% } else { %>
                                                <a class="btn btn-outline-success" onclick="alert('You have to login to buy this product');" >Add to Cart</a>
                                                <% } %>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                        </div>
                        <% }%>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <footer class="footer py-4" style="background-color: white;margin-top: 10px; margin-bottom: 0px;">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-2 text-lg-start">Copyright &copy; Huy </div>
                <div class="col-lg-8 my-3 my-lg-0">
                    <a class="btn btn-dark btn-social mx-2" href="#"><i class="fab fa-facebook-f"></i></a>
                </div>
                <div class="col-lg-2 text-lg-end">
                    <a target="_bank" href="https://fpt.edu.vn/don-vi/dai-hoc-fpt"> <img class="img-fluid" src="https://upload.wikimedia.org/wikipedia/vi/1/1d/Logo_%C4%90%E1%BA%A1i_h%E1%BB%8Dc_FPT.png" /></a>
                </div>
            </div>
        </div>
    </footer>
</html>

