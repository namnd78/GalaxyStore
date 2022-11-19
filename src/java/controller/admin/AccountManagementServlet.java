/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import dal.auth.AccountDAO;
import dal.auth.AccountStatusDAO;
import dal.auth.RoleDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import model.Account;
import model.AccountStatus;
import model.Role;

/**
 *
 * @author NamND
 */
public class AccountManagementServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AccountManagementServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AccountManagementServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        if (account == null) {
            response.sendRedirect("login");
        } else if (account.getRole().getId() != 3) {
            response.sendRedirect("home");
        } else {
            AccountDAO adao = new AccountDAO();
            RoleDAO rdao = new RoleDAO();
            AccountStatusDAO asdao = new AccountStatusDAO();
            List<Role> roleList = rdao.getAllRoles();
            List<AccountStatus> statusList = asdao.getAllStatus();

            String key = request.getParameter("key");
            if (key != null && !key.isEmpty()) {
                key = key.trim();
            }

            String roleIdRaw = request.getParameter("roleId");
            int roleId = 0;
            if (roleIdRaw != null) {
                roleId = Integer.parseInt(roleIdRaw);
            }

            String statusIdRaw = request.getParameter("statusId");
            int statusId = 0;
            if (statusIdRaw != null) {
                statusId = Integer.parseInt(statusIdRaw);
            }

            String[] sortList = {"ID Ascending", "ID Descending", "Name A - Z", "Name Z - A"};
            String sort = request.getParameter("sort");
            if (sort == null) {
                sort = "ID Ascending";
            }

            int accountsPerPage = 5;
            String entry = request.getParameter("entry");
            if (entry != null && !entry.isEmpty() && !entry.equals("5")) {
                accountsPerPage = Integer.parseInt(entry);
            }

            List<Account> accountList = adao.searchAccount(key, roleId, statusId, sort);
            // Paging
            int numberAccounts = accountList.size();
            int numberPages = numberAccounts / accountsPerPage + (numberAccounts % accountsPerPage == 0 ? 0 : 1);
            String xpage = request.getParameter("page");
            int page;
            if (xpage == null) {
                page = 1;
            } else {
                page = Integer.parseInt(xpage);
            }
            int start = (page - 1) * accountsPerPage;
            int end;
            if (page * accountsPerPage > numberAccounts) {
                end = numberAccounts;
            } else {
                end = page * accountsPerPage;
            }
            List<Account> accountsPage = adao.getAccountsByPage((ArrayList<Account>) accountList, start, end);
            request.setAttribute("numberPages", numberPages);
            request.setAttribute("page", page);
            request.setAttribute("accountsPage", accountsPage);
            request.setAttribute("roleList", roleList);
            request.setAttribute("statusList", statusList);
            request.setAttribute("sortList", sortList);
            request.setAttribute("roleId", roleId);
            request.setAttribute("statusId", statusId);
            request.setAttribute("sort", sort);
            request.setAttribute("key", key);
            request.setAttribute("entry", accountsPerPage);
            request.setAttribute("cusername", session.getAttribute("cusername"));
            request.setAttribute("cpassword", session.getAttribute("cpassword"));
            request.setAttribute("cfullname", session.getAttribute("cfullname"));
            request.setAttribute("crepassword", session.getAttribute("crepassword"));
            request.setAttribute("cdob", session.getAttribute("cdob"));
            request.setAttribute("cemail", session.getAttribute("cemail"));
            request.setAttribute("cphone", session.getAttribute("cphone"));
            request.setAttribute("croleId", session.getAttribute("croleId"));
            request.setAttribute("alertUsername", session.getAttribute("alertUsername"));
            request.setAttribute("alertPassword", session.getAttribute("alertPassword"));
            request.setAttribute("alertPhone", session.getAttribute("alertPhone"));
            request.setAttribute("alertEmail", session.getAttribute("alertEmail"));
            request.setAttribute("success", session.getAttribute("success"));
            request.getRequestDispatcher("pages/admin/accountmanagement.jsp").forward(request, response);
        }
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
