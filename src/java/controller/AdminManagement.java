///*
// * To change this license header, choose License Headers in Project Properties.
// * To change this template file, choose Tools | Templates
// * and open the template in the editor.
// */
//package controller;
//
//import dal.accountDAO;
//import dal.cateDAO;
//import dal.orderDAO;
//import dal.productDAO;
//import java.io.IOException;
//import java.io.PrintWriter;
//import java.util.List;
//import javax.servlet.ServletException;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import model.Category;
//import model.Product;
//import model.Account;
//import model.Order;
//
///**
// *
// * @author DELL
// */
//public class AdminManagement extends HttpServlet {
//
//    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        response.setContentType("text/html;charset=UTF-8");
//        request.setCharacterEncoding("UTF-8");
//        String service = null;
//        service = request.getParameter("service");
//        productDAO pDAO = new productDAO();
//        cateDAO cDAO = new cateDAO();
//        accountDAO aDAO = new accountDAO();
//        orderDAO oDAO = new orderDAO();
//
//        if (service == null) {
//            List<Product> listAll = pDAO.getAllProduct();
//            request.setAttribute("listP", listAll);
//            List<Category> listC = cDAO.getAllCategory();
//            request.setAttribute("listC", listC);
//            List<Account> listA = aDAO.getAllAccount();
//            request.setAttribute("listA", listA);
//            List<Order> listO = oDAO.getAllOrder();
//            request.setAttribute("listO", listO);
//            request.getRequestDispatcher("Manage.jsp").forward(request, response);
//        }
//
//        if (service.equalsIgnoreCase("deleteP")) {
//            String pid = request.getParameter("pid");
//            pDAO.deleteProduct(pid);
//            request.setAttribute("mess", "Delete product successfully!");
//            response.sendRedirect("AdminManagement");
//        }
//
//        if (service.equalsIgnoreCase("addP")) {
//            int pid = Integer.parseInt(request.getParameter("pid"));
//            String name = request.getParameter("pname");
//            String image = request.getParameter("image");
//            String price = request.getParameter("price");
//            int quantity = Integer.parseInt(request.getParameter("quantity"));
//            String title = request.getParameter("title");
//            String description = request.getParameter("description");
//            int cid = Integer.parseInt(request.getParameter("cid"));
//            pDAO.addProduct(pid, name, image, price, quantity, title, description, cid);
//            request.setAttribute("mess", "Add product successfully!");
//            response.sendRedirect("AdminManagement");
//        }
//
//        if (service.equalsIgnoreCase("editP")) {
//            int pid = Integer.parseInt(request.getParameter("pid"));
//            String name = request.getParameter("pname");
//            String image = request.getParameter("picture");
//            int price = Integer.parseInt(request.getParameter("price"));
//            int quantity = Integer.parseInt(request.getParameter("quantity"));
//            String title = request.getParameter("title");
//            String description = request.getParameter("description");
//            int cid = Integer.parseInt(request.getParameter("cid"));
//            String mess = "";
//            //check duplicate product id
//            boolean checkPid = true;
//            if (pDAO.checkDupProId(pid)) {
//                mess = "Product ID has been existed !!";
//                checkPid = false;
//            }
////            //check duplicate product name
////            boolean checkCate = true;
////            if (pDAO.checkCateNotExist(cid)) {
////                mess = "Category is not existed !!";
////                checkCate = false;
////            }
//            //database
//            if (checkPid) {
//                int n = pDAO.editProduct(new Product(pid, name, image, price, quantity, title, description, cid));
//                if (n != 0) {
//
//                    mess = "Edit Successfully !!";
//                    request.setAttribute("mess", mess);
//                    response.sendRedirect("AdminManagement");
//                } else {
//                    mess = "Edit fail !!";
//                    request.setAttribute("mess", mess);
//                    response.sendRedirect("AdminManagement");
//                }
//            }
//        }
//
//        if (service.equalsIgnoreCase("deleteA")) {
//            String username = request.getParameter("username");
//            aDAO.deleteAccount(username);
//            request.setAttribute("mess", "Delete account succesfully!");
//            response.sendRedirect("AdminManagement");
//        }
//
//    }
//
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        processRequest(request, response);
//    }
//
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        processRequest(request, response);
//    }
//
//    @Override
//    public String getServletInfo() {
//        return "Short description";
//    }// </editor-fold>
//
//}
