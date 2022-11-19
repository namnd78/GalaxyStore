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
import java.util.List;
import model.Brand;
import model.Category;
import model.Image;
import model.Product;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "EditProductServlet", urlPatterns = {"/editproduct"})
public class EditProductServlet extends HttpServlet {

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
            out.println("<title>Servlet EditProductServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditProductServlet at " + request.getContextPath() + "</h1>");
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
        try {
            String idRaw = request.getParameter("idP");
            ProductDAO pdao = new ProductDAO();
            int id = Integer.parseInt(idRaw);
            Product product = pdao.getProductById(id);
            product.setDescription(product.getDescription().replace("<br />","\n"));
            product.setSpecification(product.getSpecification().replace("<br />","\n"));
            product.setSpecification(product.getSpecification().replace("<br>",""));
            
            List<Image> imageList = product.getImages();
            if(session.getAttribute("imageList")==null){
                session.setAttribute("imageList", imageList);
            }
            
            CategoryDAO cdao = new CategoryDAO();
            BrandDAO bdao = new BrandDAO();
            List<Category> categoryList = cdao.getAllCategories();
            List<Brand> brandList = bdao.getAllBrands();
            request.setAttribute("brandList", brandList);
            request.setAttribute("categoryList", categoryList);
            request.setAttribute("product", product);
            request.getRequestDispatcher("pages/seller/editProduct.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            System.out.println(e);
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
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        int categoryId = Integer.parseInt(request.getParameter("categoryId"));
        int brandId = Integer.parseInt(request.getParameter("brandId"));
        String description = request.getParameter("description");
        description = description.replace("\n", "<br />");
        String specification = request.getParameter("specification");
        specification = specification.replace("\n", "<br />");
        int price = Integer.parseInt(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        CategoryDAO cdao =new CategoryDAO();
        BrandDAO bdao = new BrandDAO();
        Category category = cdao.getCategoryById(categoryId);
        Brand brand = bdao.getBrandById(brandId);
        HttpSession session = request.getSession();
        Product product = new Product(id, name, category, brand, description, specification, price, quantity,(List<Image>) session.getAttribute("imageList"));
        ProductDAO pdao = new ProductDAO();
        pdao.updateProduct(product);
        session.removeAttribute("imageList");
        response.sendRedirect("productmanagement");
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
