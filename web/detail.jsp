

<%@page import="model.Account"%>
<%@page import="model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title> Shop</title>
       
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js" crossorigin="anonymous"></script>
     
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
        
        <link href="css/styles.css" rel="stylesheet" />
        <link rel="stylesheet" href="css/nicepage.css" media="screen">
        <link rel="stylesheet" href="css/details.css" media="screen">
    </head>
    <style>
        body{
            background-image: url("assets/img/header-bg.jpg");
        }
    </style>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
        <%
            Account account = (Account) session.getAttribute("account");
            Product p = (Product) request.getAttribute("product");
            String[] arr = p.getDescription().split("•");

        %>
        <section class="u-align-center u-clearfix u-section-1" id="carousel_ea1d" >
            <div class="u-clearfix u-sheet u-valign-middle u-sheet-1">
                <div class="u-align-center-lg u-align-center-md u-align-center-sm u-align-center-xs u-container-style u-expanded-width u-product u-white u-product-1">

                    <div class="u-container-layout u-container-layout-1" style="padding-bottom: 5%; background: transparent;">
                        <img src="<%= p.getImg()%>" alt="" class="u-image u-image-default u-product-control u-image-1" style="width: 30%; height: 50% display: flex;">
                        <div class="u-align-center u-container-style u-grey-5 u-group u-shape-rectangle u-group-1">
                            <div class="u-container-layout u-container-layout-2">
                                <div class="u-product-control u-product-price u-product-price-1">
                                    <div class="u-price-wrapper u-spacing-10"><div class="u-price" style="font-size: 3rem; font-weight: 700;"><%= p.getPrice()%> Đ</div>
                                    </div>
                                </div>
                                <h2 class="u-product-control u-text u-text-1">
                                    <a class="u-product-title-link" href="ProductController?service=filter&cid=<%= p.getCid()%>"><%= p.getTitle()%></a>
                                    <p class="item-intro text-muted"><%= p.getName()%></p>
                                    
                                </h2><!--/product_title--><!--product_content-->
                                <div class="u-product-control u-product-desc u-text u-text-2"><!--product_content_content-->
                                    <p style="text-align: left;"><% for (String a : arr) { %>
                                        •<%= a %> <br>
                                        <% } %></p><!--/product_content_content-->
                                </div>
                                <% if (p.getQuantity() != 0) { %>
                            <form action="CartController?pid=<%= p.getPid()%>" method="post">
                                <input style="width: 20%;" name="amount" type="number" min="0" max="<%= p.getQuantity() %>">
                                    <p class="item-intro text-muted">Only [<%= p.getQuantity()%>] left </p>
                                <button   class="u-btn u-button-style u-hover-black u-palette-3-base u-product-control u-text-black u-text-hover-white u-btn-1">Add to Cart</button>
                            </form>
                                <% } else { %>
                                
                                    <p class="item-intro text-muted"> Out of stock </p>
                                    <% } %>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>
