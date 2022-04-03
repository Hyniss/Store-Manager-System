/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.accountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Account;
import model.Cart;
import model.Product;

/**
 *
 * @author DELL
 */
public class AccountController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
//            request.getRequestDispatcher("login.jsp").forward(request, response);
//            response.sendRedirect("login.jsp");
            accountDAO aDAO = new accountDAO();
            String service = request.getParameter("service");

            if (service == null) {
                service = "";
            }
            if (service.equalsIgnoreCase("login")) {
                HttpSession session = request.getSession();
                String checkLogin = "checked";
                request.setAttribute("checkLogin", checkLogin);
                String mess = "";
                String user = request.getParameter("username");
                String pass = request.getParameter("password");

                Account account = aDAO.getAccountLogin(user, pass);
                if (account != null) {
                    session.setAttribute("account", account);
                    List<Cart> cart = new ArrayList<>();
                    session.setAttribute("cart", cart);
                    
                    response.sendRedirect("Home");
                } else {
                    request.setAttribute("mess", "Username or password invalid!");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                }
            }

            if (service.equalsIgnoreCase("changepass")) {
                String mess = "";

                HttpSession session = request.getSession();
                Account account = (Account) session.getAttribute("account");

                String user = account.getUsername();
                String xUser = request.getParameter("username");
                String oldpass = request.getParameter("oldpass");
                String newpass = request.getParameter("newpass");

                if (!user.equals(xUser)) {
                    mess = "You are only have permission to change pass of your own account";
                } else if (!account.getPassword().equals(oldpass)) {
                    mess = "Old Password is not correct";
                } else if (oldpass.equals(newpass)) {
                    mess = "New pass still same old pass!";
                } else {
                    aDAO.changePassword(user, newpass);
                    mess = "Change password successfully !!";
                }
                request.setAttribute("mess", mess);
                request.getRequestDispatcher("ChangePass.jsp").include(request, response);
            }

            if (service.equalsIgnoreCase("register")) {

                String checkRegis = "checked";
                request.setAttribute("checkRegis", checkRegis);
                String mess = "";
                String username = request.getParameter("signupusername");
                String password = request.getParameter("signuppass");
                String repassword = request.getParameter("resignuppass");

                if (!password.equals(repassword)) {
                    request.setAttribute("mess", "Password must be same as repeat password");
                    request.getRequestDispatcher("login.jsp").include(request, response);
                    return;
                }

                Account account = aDAO.getDuplicateAcc(username);
                if (account == null) {
                    aDAO.singup(username, password);
                    request.setAttribute("mess", "Signup Successfully!");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                    return;
                } else {
                    request.setAttribute("mess", "Duplicate user!");
                }
                request.getRequestDispatcher("login.jsp").include(request, response);
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

    }

}
