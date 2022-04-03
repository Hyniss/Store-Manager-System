<%-- 
    Document   : orderline
    Created on : Jul 18, 2021, 5:32:17 PM
    Author     : DELL
--%>

<%@page import="dal.orderDAO"%>
<%@page import="model.Order"%>
<%@page import="model.Product"%>
<%@page import="dal.productDAO"%>
<%@page import="dal.orderDetailDAO"%>
<%@page import="model.OrderDetail"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage OrderLine</title>
    </head>

    <jsp:include page="header.jsp"></jsp:include>
    <%
        Account account = (Account) session.getAttribute("account");
        ArrayList<OrderDetail> listOD = (ArrayList<OrderDetail>) request.getAttribute("listOD");
        Order order = (Order) request.getAttribute("order");
        orderDAO oDAO = new orderDAO();
        orderDetailDAO odDAO = new orderDetailDAO();
        productDAO pDAO = new productDAO();
        Product prox = new Product();
        int total = 0;

        String mess = (String) request.getAttribute("mess");
        if (account == null) {
    %>
    <h2>You must login to access this</h2>
    <% } else { %>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-sm-8" id="Product" name="tabcontent" style=" background-color: white; margin: 0 1%;border-radius: 2px;display: block;" >
                    <div id="content" class="row">
                        <div class="table-title">
                            <div class="row">
                                <div class="col-sm-6">
                                    <h2> OrderDetail </h2>
                                    <h3 style="color: red" style="font-size: small" >${mess}</h3>
                                </div>
                            </div>
                        </div>
                        <table class="table table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>OrderID</th>
                                    <th>Product</th>
                                    <th>Image</th>
                                    <th>Price</th>
                                    <th>Quantity</th>
                                    <th>Total</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    for (OrderDetail od : listOD) {

                                        prox = pDAO.getProductByID(od.getPid());
                                        total = (od.getQuantity() * od.getPrice());
                                %>
                                <tr>
                                    <td><%= od.getOid()%></td>
                                    <td><%= prox.getName()%></td>
                                    <td>
                                        <img width="300" height="370" class="img-fluid" src="<%= prox.getImg()%>">
                                    </td>
                                    <td><%= od.getPrice()%>đ</td>
                                    <td><%= od.getQuantity()%> </td>
                                    <td><%= total %>đ</td>
                                </tr>
                                <% }%>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div style="background-color: white; box-sizing: border-box; border-radius: 2px;" class="col-sm-3">
                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th>Username</th>
                                <th>Ship</th>
                                <th>Total Consume</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td><%= order.getUsername()%></td>
                                <td>Free</td>
                                <td><%= order.getTotal() %></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </body>
    <% }%>
</html>
