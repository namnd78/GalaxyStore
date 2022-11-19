/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.seller;

import dal.auth.AccountDAO;
import dal.product.CategoryDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import model.Account;
import model.Image;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "EditImageServlet", urlPatterns = {"/editimage"})
@MultipartConfig
public class EditImageServlet extends HttpServlet {

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
            out.println("<title>Servlet EditImageServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditImageServlet at " + request.getContextPath() + "</h1>");
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
        String idraw = request.getParameter("stt");
        int id =Integer.parseInt(idraw);
        HttpSession session = request.getSession();
        List<Image> imageList = (List<Image>) session.getAttribute("imageList");
        imageList.remove(id);
        session.setAttribute("imageList", imageList);
        response.sendRedirect("addproduct");
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
        HttpSession session = request.getSession();
        if (session.getAttribute("imageList") != null) {
            List<Image> imageList = (List<Image>) session.getAttribute("imageList");
            Account account = (Account) session.getAttribute("account");
            if (account == null) {
                response.sendRedirect("login");
            } else {
                Part part = request.getPart("imgP");
                System.out.println("-------------------------------------------------------------------------------------1");
                System.out.println(part);
                String realPath = request.getServletContext().getRealPath("/images/products");
                String filename = Paths.get(part.getSubmittedFileName()).getFileName().toString();
                if (!Files.exists(Paths.get(realPath))) {
                    Files.createDirectories(Paths.get(realPath));
                }
                part.write(realPath + "/" + filename);
                Image image = new Image(filename, 1);
                imageList.add(image);
                session.setAttribute("imageList", imageList);
            }
        } else {
            List<Image> imageList = new ArrayList<>();
            Account account = (Account) session.getAttribute("account");
            if (account == null) {
                response.sendRedirect("login");
            } else {
                Part part = request.getPart("imgP");
                String realPath = request.getServletContext().getRealPath("/images/products");
                String filename = Paths.get(part.getSubmittedFileName()).getFileName().toString();
                if (!Files.exists(Paths.get(realPath))) {
                    Files.createDirectories(Paths.get(realPath));
                }
                part.write(realPath + "/" + filename);
                Image image = new Image(filename, imageList.size()+1);
                imageList.add(image);
                session.setAttribute("imageList", imageList);
            }
        }

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
