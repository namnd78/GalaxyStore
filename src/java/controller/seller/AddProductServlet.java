/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.seller;

import dal.product.BrandDAO;
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
import model.Brand;
import model.Category;
import model.Image;

/**
 *
 * @author ADMIN
 */
@WebServlet(name="AddProductServlet", urlPatterns={"/addproduct"})
public class AddProductServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UpdateProductServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateProductServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
        } else {
            CategoryDAO cdao = new CategoryDAO();
            BrandDAO bdao = new BrandDAO();
            List<Category> categoryList = cdao.getAllCategories();
            List<Brand> brandList = bdao.getAllBrands();
            request.setAttribute("brandList", brandList);
            request.setAttribute("categoryList", categoryList);
            request.getRequestDispatcher("pages/seller/addproduct.jsp").forward(request, response);
        }
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String name = request.getParameter("name");
        String categoryIdraw = request.getParameter("categoryId");
        String brandIdraw = request.getParameter("brandId");
        String description = request.getParameter("description");
        description = description.replace("\n", "<br />");
        String specification = request.getParameter("specification");
        specification = specification.replace("\n", "<br />");
        String priceRaw = request.getParameter("price");
        String quantityRaw = request.getParameter("quantity");
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        List<Image> imageList =(List<Image>) session.getAttribute("imageList");
        
        ProductDAO pdao = new ProductDAO();
        try{
            int categoryId = Integer.parseInt(categoryIdraw);
            int brandId = Integer.parseInt(brandIdraw);
            int price = Integer.parseInt(priceRaw);
            int quantity = Integer.parseInt(quantityRaw);
            pdao.addProduct(name, categoryId, brandId, description, specification, price, quantity, account.getStore().getId(), imageList);
            session.removeAttribute("imageList");
            response.sendRedirect("productmanagement");
        }catch(NumberFormatException e){
            System.out.println(e);
        }
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
