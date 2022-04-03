/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.orderDAO;
import dal.orderDetailDAO;
import dal.productDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Cart;
import model.Order;
import model.Product;

/**
 *
 * @author DELL
 */
public class CartController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        productDAO pDAO = new productDAO();
        String service = (String) request.getParameter("service");

        if (service == null) {
            int pid = Integer.parseInt(request.getParameter("pid"));
            int amount = Integer.parseInt(request.getParameter("amount"));
            List<Cart> cart = (List<Cart>) session.getAttribute("cart");
//            if (cart == null) {
//                Cart xcart = new Cart(pid, amount);
//                cart.add(xcart);
//            }

            for (int i = 0; i < cart.size(); i++) {
                if (cart.get(i).getPid() == pid) {
                    request.setAttribute("mess", "Duplicate product!");
                    request.getRequestDispatcher("cart.jsp").forward(request, response);
                    return;
                }
            }
            Cart xcart = new Cart(pid, amount);
            cart.add(xcart);

            session.setAttribute("cart", cart);
            request.getRequestDispatcher("cart.jsp").forward(request, response);
        }

        if (service.equalsIgnoreCase("deletePcart")) {
            List<Cart> cart = (List<Cart>) request.getSession().getAttribute("cart");
            int pid = Integer.parseInt(request.getParameter("pidcart"));
            for (int i = 0; i < cart.size(); i++) {
                if (cart.get(i).getPid() == pid) {
                    cart.remove(i);
                    break;
                }
            }
            request.getSession().setAttribute("cart", cart);
            response.sendRedirect("cart.jsp");
        }

        if (service.equalsIgnoreCase("checkout")) {
            String user = request.getParameter("username");
            String name = request.getParameter("fullname");
            String address = request.getParameter("address");
            int total = Integer.parseInt(request.getParameter("total"));
            orderDAO oDAO = new orderDAO();
            orderDetailDAO odDAO = new orderDetailDAO();
            oDAO.addOder(user, name, address, total);
            Order order = oDAO.getLatestOrder();

            List<Cart> cart = (List<Cart>) session.getAttribute("cart");
            for (Cart c : cart) {
                Product prox = pDAO.getProductByID(c.getPid());
                int check = odDAO.addOderDetail(order.getOrderid(), c.getPid(), c.getAmount(), prox.getPrice());
                if (check != 0) {
                    int stock = prox.getQuantity() - c.getAmount();
                    pDAO.checkoutProduct(c.getPid(), stock);
                }
            }

            cart = new ArrayList<>();
            request.getSession().setAttribute("cart", cart);
            response.sendRedirect("Home");
        }

    }

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
