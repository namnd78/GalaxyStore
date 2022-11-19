/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.account;

import dal.auth.AccountDAO;
import dal.product.CategoryDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Account;
import model.Category;

/**
 *
 * @author Duong
 */
public class LoginServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoginServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>" + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        CategoryDAO cdao = new CategoryDAO();
        List<Category> categories = cdao.getAllCategories();
        Account acount = (Account) session.getAttribute("account");
        if (acount != null) {
            response.sendRedirect("home");
        } else {
            request.setAttribute("categories", categories);
            request.setAttribute("path", "login");
            request.getRequestDispatcher("pages/account/login.jsp").forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CategoryDAO cdao = new CategoryDAO();
        List<Category> categories = cdao.getAllCategories();
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String remember = request.getParameter("remember");
        AccountDAO adao = new AccountDAO();
        Account account = adao.checkAccount(username, password);
        HttpSession session = request.getSession();
        if (account == null) {
            request.setAttribute("categories", categories);
            request.setAttribute("path", "login");
            request.setAttribute("alert", "Username or Password is wrong!");
            request.getRequestDispatcher("pages/account/login.jsp").forward(request, response);
        } else if (account.getStatus().getId() == 2) {
            request.setAttribute("categories", categories);
            request.setAttribute("path", "login");
            request.setAttribute("alert", "You cannot login with this account. Check your email for the reason!");
            request.getRequestDispatcher("pages/account/login.jsp").forward(request, response);
        } else {
            Cookie cusername = new Cookie("username", username);
            Cookie cpassword = new Cookie("password", password);
            Cookie cremember = new Cookie("remember", remember);
            if (remember != null) {
                cusername.setMaxAge(60 * 60 * 24);
                cpassword.setMaxAge(60 * 60 * 24);
                cremember.setMaxAge(60 * 60 * 24);
            } else {
                cusername.setMaxAge(0);
                cpassword.setMaxAge(0);
                cremember.setMaxAge(0);
            }
            response.addCookie(cusername);
            response.addCookie(cpassword);
            response.addCookie(cremember);
            session.setAttribute("account", account);
            switch (account.getRole().getId()) {
                case 1:
                    response.sendRedirect("home");
                    break;
                case 2:
                    response.sendRedirect("productmanagement");
                    break;
                case 3:
                    response.sendRedirect("accountmanagement");
                    break;
                case 4:
                    response.sendRedirect("blogmanagement");
                    break;
            }
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
