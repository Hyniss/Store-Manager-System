

<%@page import="java.util.ArrayList"%>
<%@page import="model.Product"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Shop</title>
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
        <jsp:include page="header.jsp"></jsp:include>
            <!-- Masthead-->
            <header class="masthead">
                <div class="container">
                    <div class="masthead-subheading">Welcome To Shop!</div>
                    <div class="masthead-subheading">Vui lòng khách đến vừa lòng khách đi.</div>
                    <a class="btn btn-primary btn-xl text-uppercase" href="#product">Tell Me More</a>
                </div>
            </header>

            <!-- Portfolio Grid-->
            <section class="page-section bg-light" id="product">
                <div class="container">
                    <div class="text-center">
                        <h2 class="section-heading text-uppercase">Những sản phẩm mới nhất</h2>
                        <h3 class="section-subheading text-muted">Best experience for customer.</h3>
                    </div>
                    <div class="row">
                    <% ArrayList<Product> list3P = (ArrayList<Product>) request.getAttribute("list3P");
                        for (Product p : list3P) {

                    %>
                    <div class="col-lg-4 col-sm-6 mb-4">
                        <!-- Portfolio item 1-->
                        <div class="portfolio-item" style="text-align: center;">
                            <a class="portfolio-link" data-bs-toggle="modal" href="#portfolioModal<%= p.getPid()%>">
                                <img width="300" height="370" class="img-fluid" src="<%= p.getImg()%>" alt="Product Image" />
                            </a>
                            <div class="text-center">
                                <div class="portfolio-caption-heading"><%= p.getTitle()%></div>
                                <div class="portfolio-caption-subheading text-muted"><%= p.getName()%></div>
                            </div>
                        </div>
                    </div>
                    <% } %>
                </div>

            </div>
        </section>

        <!-- Footer-->
        <footer class="footer py-4">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-2 text-lg-start">Copyright &copy; Huy </div>
                    <div class="col-lg-8 my-3 my-lg-0">
                        <a class="btn btn-dark btn-social mx-2" ><i class="fab fa-twitter"></i></a>
                        <a class="btn btn-dark btn-social mx-2" href="#"><i class="fab fa-facebook-f"></i></a>
                        <a class="btn btn-dark btn-social mx-2" ><i class="fab fa-linkedin-in"></i></a>
                    </div>
                    <div class="col-lg-2 text-lg-end">
                        <a target="_bank" href="https://fpt.edu.vn/don-vi/dai-hoc-fpt"> <img class="img-fluid" src="https://upload.wikimedia.org/wikipedia/vi/1/1d/Logo_%C4%90%E1%BA%A1i_h%E1%BB%8Dc_FPT.png" /></a>
                    </div>
                </div>
            </div>
        </footer>
        <!-- Portfolio Modals-->
        <!-- Portfolio item 1 modal popup-->
        <% for (Product p : list3P) {
        %>
        <div class="portfolio-modal modal fade" id="portfolioModal<%= p.getPid()%>" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="close-modal" data-bs-dismiss="modal"><img src="<%= p.getImg()%>" alt="product img" /></div>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-8">
                                <div class="modal-body">
                                    <!-- Project details-->
                                    <h2 class="text-uppercase"><%= p.getTitle()%></h2>
                                    <p class="item-intro text-muted"><%= p.getName()%></p>
                                    <img class="img-fluid d-block mx-auto" src="<%= p.getImg()%>" alt="..." />
                                    <ul class="list-inline">
                                        <li>
                                            <strong>Price:</strong>
                                            <%= p.getPrice()%>đ
                                        </li>
                                        <li>
                                            <strong>Category:</strong>
                                            <%= p.getCid()%>
                                        </li>
                                    </ul>
                                    <button class="btn btn-primary btn-xl text-uppercase" data-bs-dismiss="modal" type="button">
                                        <i class="fas fa-times me-1"></i>
                                        Close
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <% }%>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
    </body>
</html>
