/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.cateDAO;
import dal.orderDAO;
import dal.productDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Category;
import model.Product;

/**
 *
 * @author DELL
 */
public class ProductController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        try (PrintWriter out = response.getWriter()) {
            request.setCharacterEncoding("UTF-8");
            String service;
            service = request.getParameter("service");
            productDAO pDAO = new productDAO();
            cateDAO cDAO = new cateDAO();
            orderDAO oDAO = new orderDAO();

            if (service == null) {
                List<Product> listAll = pDAO.getAllProduct();
                request.setAttribute("listP", listAll);
                List<Category> listC = cDAO.getAllCategory();
                request.setAttribute("listC", listC);
                request.getRequestDispatcher("product.jsp").forward(request, response);
            }

            if (service.equalsIgnoreCase("filter")) {
                String cid = request.getParameter("cid");
                List<Product> listbyID = pDAO.getProductByCateID(cid);
                List<Category> listC = cDAO.getAllCategory();
                request.setAttribute("listC", listC);
                request.setAttribute("listP", listbyID);
                request.getRequestDispatcher("product.jsp").forward(request, response);
            }

            if (service.equalsIgnoreCase("search")) {
                String text = request.getParameter("name");
                List<Category> listC = cDAO.getAllCategory();
                request.setAttribute("listC", listC);
                List<Product> listbyName = pDAO.getProductByName(text);
                request.setAttribute("listP", listbyName);
                request.getRequestDispatcher("product.jsp").forward(request, response);
            }

            if (service.equalsIgnoreCase("detail")) {
                int pid = Integer.parseInt(request.getParameter("pid"));
                Product product = pDAO.getProductByID(pid);
                request.setAttribute("product", product);
                request.getRequestDispatcher("detail.jsp").forward(request, response);
            }

//            if (service.equalsIgnoreCase("addToCart")) {
//                String pid = request.getParameter("pid");
//                Product product = pDAO.getProductByID(pid);
//                int maxQuantity = pDAO.getMaxQuantity(pid);
//                request.setAttribute("product", product);
//                request.setAttribute("maxQuantity", maxQuantity);
//                oDAO.addOder(product.getPid(), 1, product.getPrice());
//                
//                request.getRequestDispatcher("cart.jsp").forward(request, response);
//            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
