/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.seller;

import dal.product.CategoryDAO;
import dal.product.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import model.Account;
import model.Category;
import model.Product;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "ProductManagementServlet", urlPatterns = {"/productmanagement"})
public class ProductManagementServlet extends HttpServlet {

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
            out.println("<title>Servlet ProductManagementServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProductManagementServlet at " + request.getContextPath() + "</h1>");
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
        session.removeAttribute("imageList");
        Account account = (Account) session.getAttribute("account");

        if (account == null) {
            response.sendRedirect("login");
        }else if (account.getStore().getId() == 0) {
            request.getRequestDispatcher("shopregister").forward(request, response);
        }else {
            ProductDAO pdao = new ProductDAO();
            CategoryDAO cdao = new CategoryDAO();
            List<Category> categoryList = cdao.getAllCategories();
            String categoryIdRaw = request.getParameter("categoryId");
            int categoryId = 0;
            if (categoryIdRaw != null) {
                categoryId = Integer.parseInt(categoryIdRaw);
            }

            String key = request.getParameter("key");
            if (key != null && !key.isEmpty()) {
                key = key.trim();
            }

            List<Product> listproduct = pdao.searchProductStore(account.getStore().getId(), key, categoryId);

            // Paging
            int productsPerPage = 9;
            int numberProducts = listproduct.size();
            int numberPages = numberProducts / productsPerPage + (numberProducts % productsPerPage == 0 ? 0 : 1);
            String xpage = request.getParameter("page");
            int page;
            if (xpage == null) {
                page = 1;
            } else {
                page = Integer.parseInt(xpage);
            }
            int start = (page - 1) * productsPerPage;
            int end;
            if (page * productsPerPage > numberProducts) {
                end = numberProducts;
            } else {
                end = page * productsPerPage;
            }
            List<Product> productsPage = pdao.getProductsByPage((ArrayList<Product>) listproduct, start, end);
            request.setAttribute("numberPages", numberPages);
            request.setAttribute("page", page);
            request.setAttribute("listPro", productsPage);
            request.setAttribute("key", key);
            request.setAttribute("categoryList", categoryList);
            request.setAttribute("categoryId", categoryId);
            request.getRequestDispatcher("pages/seller/productmanagement.jsp").forward(request, response);
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
        String dataRaw = request.getParameter("data");
        String idraw = request.getParameter("id");
        String typeraw = request.getParameter("type");
        try {
            int data = Integer.parseInt(dataRaw);
            int id = Integer.parseInt(idraw);
            int type = Integer.parseInt(typeraw);
            ProductDAO pdao = new ProductDAO();
            pdao.updateQuantity(data, id, type);
        }catch(NumberFormatException e){
            System.out.println(e);
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
