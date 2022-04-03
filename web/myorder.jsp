<%-- 
    Document   : myorder
    Created on : Jul 19, 2021, 1:21:16 AM
    Author     : DELL
--%>

<%@page import="model.Order"%>
<%@page import="java.util.List"%>
<%@page import="model.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Orders</title>
    </head>
    <jsp:include page="header.jsp"></jsp:include>
    <%
        Account account = (Account) session.getAttribute("account");
        List<Order> order = (List<Order>) request.getAttribute("order");
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
                                    <h2> Order of user: <%= account.getUsername() %> </h2>
                                    <h3 style="color: red" style="font-size: small" >${mess}</h3>
                                </div>
                            </div>
                        </div>
                        <table class="table table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>OrderID</th>
                                    <th>Name</th>
                                    <th>Address</th>
                                    <th>Total</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    for (Order o : order) {
                                %>
                                <tr>
                                    <td><a href ="OrderDetailControl?service=myod&oid=<%= o.getOrderid() %>"><%= o.getOrderid() %></a></td>
                                    <td><%= o.getCname()  %></td>
                                    <td><%= o.getAddress() %> </td>
                                    <td><%= o.getTotal() %>đ</td>
                                </tr>
                                <% }%>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <% }%>
</html>
