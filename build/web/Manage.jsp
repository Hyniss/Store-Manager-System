<%-- 
    Document   : Manage
    Created on : Jul 15, 2021, 1:43:12 AM
    Author     : DELL
--%>

<%@page import="model.Order"%>
<%@page import="model.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Product"%>
<%@page import="model.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Manage Page</title>
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
        ArrayList<Account> listA = (ArrayList<Account>) request.getAttribute("listA");
        ArrayList<Category> listC = (ArrayList<Category>) request.getAttribute("listC");
        ArrayList<Order> listO = (ArrayList<Order>) request.getAttribute("listO");
        ArrayList<Product> listP = (ArrayList<Product>) request.getAttribute("listP");
            Product pro =  (Product)  request.getAttribute("Pro");
        if (account == null || account.isIsAdmin() == false) {
    %>
    <h2>You must be admin to access this</h2>
    <% } else { %>
    <body class="masthead">
        <div class="container">
            <div class="row">

                <%
                    Object mess = request.getAttribute("mess");
                    if (mess == null) {
                        mess = "";
                    }
                %>


                <!-- Form addP -->
                <div class="col-sm-12" id="AddP" name="tabcontent" style=" background-color: white; margin: 0 1%;border-radius: 2px;display: none;" >
                    <div id="content" class="row">
                        <h6 style="color: red" style="font-size: small" ><%= mess%></h6>
                        <form action="AddProductByAdmin" method="get">
                            <center>
                            <div>
                                <label style="color: black;">ProductID:</label> <br>
                                <input name="pid" type="text"  required>
                            </div>
                            <div>
                                <label style="color: black;">ProductName:</label><br>
                                <input name="pname" type="text" required>
                            </div>
                            <div>
                                <label style="color: black;">Link image:</label><br>
                                <input name="image" type="text" required>
                            </div>
                            <div>
                                <label style="color: black;">Price:</label><br>
                                <input name="price" type="text" required>
                            </div>
                            <div>
                                <label style="color: black;">Quantity:</label><br>
                                <input name="quantity" type="text" required>
                            </div>
                            <div>
                                <label style="color: black;">Title:</label><br>
                                <input name="title" type="text" required>
                            </div>
                            <div>
                                <label style="color: black;">Description:</label><br>
                                <input name="description" type="text" required>
                            </div>
                            
                            <div>
                                <select name="cid" aria-label="Default select example">
                                    <%
                                        for (Category c : listC) {

                                    %>
                                    <option value="<%= c.getCid()%>"> <%= c.getCname()%></option>
                                    <% } %>
                                </select>
                            </div>
                            <div>
                                <input type="submit" class="btn btn-success" value="Add Product">
                                <input type="hidden" name="service" value="addP">
                            </div>
                                </center>
                        </form>
                    </div>
                </div>
                                                <!-- Form addC -->
                <div class="col-sm-12" id="AddC" name="tabcontent" style=" background-color: white; margin: 0 1%;border-radius: 2px;display: none;" >
                    <div id="content" class="row">
                        <h6 style="color: red" style="font-size: small" ><%= mess%></h6>
                        <form action="AddCategory" method="get">
                            <center>
                            <div>
                                <label style="color: black;">CatoryID:</label> <br>
                                <input name="cid" type="text"  required>
                            </div>
                            <div>
                                <label style="color: black;">CatoryName:</label><br>
                                <input name="cname" type="text" required>
                            </div>
                  
                            <div>
                                <input type="submit" class="btn btn-success" value="Add Category">
                                <input type="hidden" name="service" value="addC">
                            </div>
                                </center>
                        </form>
                    </div>
                </div>
  
                <!-- Product -->
                <div class="col-sm-12" id="Product" name="tabcontent" style=" background-color: white;border-radius: 2px;display: block;" >
                    <div id="content" class="row">
                         <div class="table-title">
                            <div class="row">
                                <div class="col-sm-6">
                                    <h2 style="color: black;"> Features </h2>
                                    <h3 style="color: red;" style="font-size: small" >${mess}</h3>
                                </div>
                                <div class="col-sm-6" style="text-align: right;">
                                    <!--<a  class="btn btn-success" data-toggle="modal" href="#addEmployeeModal" ><span>Add New Product</span></a>-->
                                    <a onclick="openObject(event, 'AddP')"  class="btn btn-success"  data-toggle="modal"><span>Add New Product</span></a>
                                     <a onclick="openObject(event, 'AddC')"  class="btn btn-success"  data-toggle="modal"><span>Add New Category</span></a>
                                </div>

                            </div>
                        </div>
                                 
                        <table class="table table-striped table-hover">
                            

                            <thead>
                                       
                                <tr>
                                    <th>ID</th>
                                    <th>Product</th>
                                    <th>Image</th>
                                    <th>Price</th>
                                    <th>Quantity</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                
                                <%
                                    for (Product p : listP) {

                                %>
                                <tr>
                                    <td>
                                         <p >
                                        <%= p.getPid()%>
                                         </p>
                                         
                                    </td>
                                    <td>
                                         <p >
                                        <%= p.getName()%>
                                         </p>
                                         
                                    </td>
                                    <td>
                                        <p >
                                        <img width="300" height="370" class="img-fluid" src="<%= p.getImg()%>">
                                        </p>
                                         
                                    </td>
                                    
                                    <td>
                                        <p >
                                            <%= p.getPrice()%>đ
                                        </p>
                                        
                                    </td>
                                    <td>
                                        <p >
                                        <%= p.getQuantity()%> left
                                        </p>
                                        
                                    </td>
                                 
                                    <td>
                                        <button class="btn btn-danger">
                                            <a onclick ="return confirm('hi')" style="text-decoration: none;color: black;" href="DeleteProductByAdmin?pid=<%= p.getPid()%>">
                                                Delete
                                            </a>
                                        </button>
                                    </td>

                                    <td>
                                        
                                            
                                         <button class="btn btn-primary" >
                                           <a   style="text-decoration: none;color: black;" href="loadProduct?pid=<%= p.getPid()%>"   data-toggle="modal">
                                                Update
                                            </a>
                                        </button>
                                    </td>
                                   
                                   


                                </tr>
                                <% } %>
                            </tbody>
                        </table>
                    </div>
                </div>
 

                <!-- Account -->


            </div>
        </div>
        <script>

                    function openObject(evt, Object) {
            // Declare all variables
            var i, tabcontent, tablinks;

            // Get all elements with class="tabcontent" and hide them
            tabcontent = document.getElementsByName("tabcontent");
            for (i = 0; i < tabcontent.length; i++) {
                tabcontent[i].style.display = "none";
            }

            // Get all elements with class="tablinks" and remove the class "active"
//            tablinks = document.getElementsByClassName("tablinks");
//            for (i = 0; i < tablinks.length; i++) {
//                tablinks[i].className = tablinks[i].className.replace(" active", "");
//            }

            // Show the current tab, and add an "active" class to the link that opened the tab
            document.getElementById(Object).style.display = "block";
            evt.currentTarget.className += " active";
        }
        </script>
    </body>
    <% }%>

</html>
