/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.account;

import dal.auth.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Duong
 */
public class RegisterServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RegisterServlet</title>");
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
        processRequest(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        AccountDAO adao = new AccountDAO();
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String repassword = request.getParameter("repassword");
        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String dob = request.getParameter("dob");
        String alert;
        request.setAttribute("path", "register");
        request.setAttribute("username", username);
        request.setAttribute("password", password);
        request.setAttribute("repassword", repassword);
        request.setAttribute("fullname", fullname);
        request.setAttribute("email", email);
        request.setAttribute("phone", phone);
        request.setAttribute("dob", dob);
        if (adao.getAccountByUsername(username) != null) {
            request.setAttribute("alert", "Username already exists!");
            request.getRequestDispatcher("pages/account/login.jsp").forward(request, response);
        } else if (!password.equals(repassword)) {
            request.setAttribute("alert", "Confirm-password not match password!");
            request.getRequestDispatcher("pages/account/login.jsp").forward(request, response);
        } else if (adao.getAccountByEmail(email) != null) {
            request.setAttribute("alert", "Email already used!");
            request.getRequestDispatcher("pages/account/login.jsp").forward(request, response);
        } else if (adao.getAccountByUsername(username) == null && adao.getAccountByEmail(email) == null && password.equals(repassword)) {
            adao.addAccount(username, password, email, fullname, dob, phone);
            request.setAttribute("notification", "Sign up success!");
            request.getRequestDispatcher("pages/account/login.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
