/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.product;

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
import java.util.ArrayList;
import java.util.List;
import model.Brand;
import model.Category;
import model.Product;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "ProductsServlet", urlPatterns = {"/products"})
public class ProductsServlet extends HttpServlet {

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
            out.println("<title>Servlet ProductsServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProductsServlet at " + request.getContextPath() + "</h1>");
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
        ProductDAO pdao = new ProductDAO();
        CategoryDAO cdao = new CategoryDAO();
        BrandDAO bdao = new BrandDAO();
        List<Brand> listBrand = bdao.getAllBrands();
        List<Category> listCategory = cdao.getAllCategories();
        request.setAttribute("categories", listCategory);
        request.setAttribute("brands", listBrand);
        String[] listPrices = {"Under 1 million",
            "From 1 to 5 million",
            "From 5 to 10 million",
            "From 10 to 15 million",
            "Over 15 million"};
        String[] listSorts = {"Name, A to Z",
            "Name, Z to A",
            "Price, low to high",
            "Price, high to low",
            "Sort By new",
            "Sort By old"
        };
        request.setAttribute("prices", listPrices);
        request.setAttribute("sorts", listSorts);

        boolean[] checkPrices = new boolean[listPrices.length + 1];
        boolean[] checkBrands = new boolean[listBrand.size() + 1];
        String key = request.getParameter("key");
        request.setAttribute("key", key);

        String categoryIdRaw = request.getParameter("categoryId");
        String[] brandIdsRaw = request.getParameterValues("brandId");
        String[] prices = request.getParameterValues("price");
        //
        int categoryId = 0;
        int[] brandIds = null;
        if (categoryIdRaw != null) {
            categoryId = Integer.parseInt(categoryIdRaw);
        }
        request.setAttribute("categoryId", categoryId);
        if (brandIdsRaw != null) {
            brandIds = new int[brandIdsRaw.length];
            for (int i = 0; i < brandIds.length; i++) {
                brandIds[i] = Integer.parseInt(brandIdsRaw[i]);
            }
        }
        // xử lý sort
        String sort = request.getParameter("sort");
        if (sort == null) {
            sort = "Name, A to Z";
        }
        request.setAttribute("sort", sort);

        List<Product> products = new ArrayList<>();
        double from = 0, to = 0;
        if (prices == null) {
            products = pdao.searchProducts(key, categoryId, brandIds, from, to, sort);
        }
        if (prices != null) {
            for (int i = 0; i < prices.length; i++) {
                List<Product> temp;
                if (prices[i].equals("0")) {
                    from = 0;
                    to = Double.MAX_VALUE;
                    products = pdao.searchProducts(key, categoryId, brandIds, from, to, sort);
                    checkPrices[0] = true;
                    break;
                } else {
                    if (prices[i].equals("1")) {
                        from = 0;
                        to = 1000000;
                        temp = pdao.searchProducts(key, categoryId, brandIds, from, to, sort);
                        products.addAll(temp);
                        checkPrices[1] = true;
                    }
                    if (prices[i].equals("2")) {
                        from = 1000000;
                        to = 5000000;
                        temp = pdao.searchProducts(key, categoryId, brandIds, from, to, sort);
                        products.addAll(temp);
                        checkPrices[2] = true;
                    }
                    if (prices[i].equals("3")) {
                        from = 5000000;
                        to = 10000000;
                        temp = pdao.searchProducts(key, categoryId, brandIds, from, to, sort);
                        products.addAll(temp);
                        checkPrices[3] = true;
                    }
                    if (prices[i].equals("4")) {
                        from = 10000000;
                        to = 15000000;
                        temp = pdao.searchProducts(key, categoryId, brandIds, from, to, sort);
                        products.addAll(temp);
                        checkPrices[4] = true;
                    }
                    if (prices[i].equals("5")) {
                        from = 15000000;
                        to = Double.MAX_VALUE;
                        temp = pdao.searchProducts(key, categoryId, brandIds, from, to, sort);
                        products.addAll(temp);
                        checkPrices[5] = true;
                    }
                }
            }
        }
        if (prices == null) {
            checkPrices[0] = true;
        }
        if (brandIdsRaw == null) {
            checkBrands[0] = true;
        }
        if (brandIdsRaw != null && brandIds[0] == 0) {
            checkBrands[0] = true;
        }
        if (brandIdsRaw != null && brandIds[0] != 0) {
            checkBrands[0] = false;
            for (int i = 1; i < checkBrands.length; i++) {

                if (isCheck(listBrand.get(i - 1).getId(), brandIds)) {
                    checkBrands[i] = true;
                } else {
                    checkBrands[i] = false;
                }
            }
        }

        // paging 
        int numberProducts = products.size();
        int productsPerPage = 9;
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
        List<Product> productsPage = pdao.getProductsByPage((ArrayList<Product>) products, start, end);
        //
        request.setAttribute("numberPages", numberPages);
        request.setAttribute("page", page);
        request.setAttribute("productsPage", productsPage);
        request.setAttribute("size", products.size());
        request.setAttribute("checkBrands", checkBrands);
        request.setAttribute("checkPrices", checkPrices);
        request.setAttribute("path", "products");
        request.getRequestDispatcher("pages/product/products.jsp").forward(request, response);
    }

    private boolean isCheck(int d, int[] id) {
        if (id == null) {
            return false;
        } else {
            for (int i = 0; i < id.length; i++) {
                if (id[i] == d) {
                    return true;
                }
            }
            return false;
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
