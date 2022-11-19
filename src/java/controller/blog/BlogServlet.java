/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.blog;

import dal.blog.BlogDAO;
import dal.blog.TopicDAO;
import dal.product.CategoryDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import model.Category;
import model.Blog;
import model.Product;
import model.Topic;

/**
 *
 * @author thanh
 */
@WebServlet(name = "BlogController", urlPatterns = {"/blog"})
public class BlogServlet extends HttpServlet {

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
            out.println("<title>Servlet BlogController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BlogController at " + request.getContextPath() + "</h1>");
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
        BlogDAO bdao = new BlogDAO();
        TopicDAO tdao = new TopicDAO();
        CategoryDAO cdao = new CategoryDAO();
        List<Topic> topics = tdao.getAllTopics();
        List<Category> categories = cdao.getAllCategories();
        String topicIdRaw = request.getParameter("topicId");
        int topicId = 0;
        if (topicIdRaw != null) {
            topicId = Integer.parseInt(topicIdRaw);
        }
        String keyblog = request.getParameter("keyblog");
        List<Blog> blogList = bdao.searchApprovedBlogs(keyblog, topicId);

        //
        int numberBlogs = blogList.size();
        int blogsPerPage = 6;
        int numberPages = numberBlogs / blogsPerPage + (numberBlogs % blogsPerPage == 0 ? 0 : 1);
        String xpage = request.getParameter("page");
        int page;
        if (xpage == null) {
            page = 1;
        } else {
            page = Integer.parseInt(xpage);
        }
        int start = (page - 1) * blogsPerPage;
        int end;
        if (page * blogsPerPage > numberBlogs) {
            end = numberBlogs;
        } else {
            end = page * blogsPerPage;
        }
        List<Blog> blogsPage = bdao.getBlogsByPage((ArrayList<Blog>) blogList, start, end);
        request.setAttribute("numberPages", numberPages);
        request.setAttribute("page", page);
        request.setAttribute("blogsPage", blogsPage);
        request.setAttribute("numberBlogs", numberBlogs);
        request.setAttribute("path", "blog");
        request.setAttribute("categories", categories);
        request.setAttribute("topics", topics);
        request.setAttribute("topicId", topicId);
        request.setAttribute("keyblog", keyblog);
        request.getRequestDispatcher("pages/blog/blog.jsp").forward(request, response);
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
