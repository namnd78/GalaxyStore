/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import controller.account.ProfileServlet;
import dal.auth.AccountDAO;
import dal.auth.RoleDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.AccountStatus;
import model.Store;

/**
 *
 * @author NamND
 */
@MultipartConfig
public class CreateAccountServlet extends HttpServlet {

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
            out.println("<title>Servlet CreateAccountServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CreateAccountServlet at " + request.getContextPath() + "</h1>");
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
        AccountDAO adao = new AccountDAO();
        RoleDAO rdao = new RoleDAO();
        Part part = request.getPart("cavatar");
        String fullname = request.getParameter("cfullname");
        String username = request.getParameter("cusername");
        String password = request.getParameter("cpassword");
        String repassword = request.getParameter("crepassword");
        String dobRaw = request.getParameter("cdob");
        String email = request.getParameter("cemail");
        String phone = request.getParameter("cphone");
        int roleId = Integer.parseInt(request.getParameter("croleId"));
        boolean test = true;
        if (adao.getAccountByUsername(username) != null) {
            session.setAttribute("alertUsername", "Username already exist.");
            test = false;
        }
        if (adao.getAccountByEmail(email) != null) {
            session.setAttribute("alertEmail", "Email already exist.");
            test = false;
        }
        if (adao.getAccountByPhone(phone) != null) {
            session.setAttribute("alertPhone", "Phone number already exist.");
            test = false;
        }
        if (!password.equals(repassword)) {
            session.setAttribute("alertPassword", "Must match with password.");
            test = false;
        }
        if (test) {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd hh:mm:ss");
            Date dob = null;
            try {
                java.util.Date date = sdf.parse(dobRaw + " 00:00:00");
                dob = new Date(date.getTime());
            } catch (ParseException ex) {
                Logger.getLogger(ProfileServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            //
            if (part.getSize() > 0) {
                String realPath = request.getServletContext().getRealPath("/images/avatar");
                String filename = Paths.get(part.getSubmittedFileName()).getFileName().toString();
                if (!Files.exists(Paths.get(realPath))) {
                    Files.createDirectories(Paths.get(realPath));
                }
                part.write(realPath + "/" + filename);
                Account account = new Account(1, username, password, email, fullname, dob, phone, filename, rdao.getRoleById(roleId), new AccountStatus(), new Store());
                adao.create(account);
            } else {
                Account account = new Account(1, username, password, email, fullname, dob, phone, "default.png", rdao.getRoleById(roleId), new AccountStatus(), new Store());
                adao.create(account);
            }
            session.setAttribute("success", "Create account successfully!");
        }
        session.setAttribute("cusername", username);
        session.setAttribute("cpassword", password);
        session.setAttribute("cfullname", fullname);
        session.setAttribute("crepassword", repassword);
        session.setAttribute("cdob", dobRaw);
        session.setAttribute("cemail", email);
        session.setAttribute("cphone", phone);
        session.setAttribute("croleId", roleId);
        response.sendRedirect("accountmanagement");
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
        doGet(request, response);
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
