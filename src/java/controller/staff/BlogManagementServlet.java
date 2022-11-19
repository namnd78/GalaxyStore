/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.staff;

import dal.blog.BlogDAO;
import dal.blog.BlogStatusDAO;
import dal.blog.TopicDAO;
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
import model.Blog;
import model.BlogStatus;
import model.Topic;

/**
 *
 * @author NamND
 */
public class BlogManagementServlet extends HttpServlet {

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
            out.println("<title>Servlet BlogManagementServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BlogManagementServlet at " + request.getContextPath() + "</h1>");
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
        } else if (account.getRole().getId() != 4) {
            response.sendRedirect("home");
        } else {
            TopicDAO tdao = new TopicDAO();
            BlogStatusDAO bsdao = new BlogStatusDAO();
            List<Topic> topicList = tdao.getAllTopics();
            List<BlogStatus> statusList = bsdao.getAllStatus();
            BlogDAO bdao = new BlogDAO();
            String key = request.getParameter("key");
            if (key != null && !key.isEmpty()) {
                key = key.trim();
            }
            String topicIdRaw = request.getParameter("topicId");
            int topicId = 0;
            if (topicIdRaw != null) {
                topicId = Integer.parseInt(topicIdRaw);
            }
            String statusIdRaw = request.getParameter("statusId");
            int statusId = 0;
            if (statusIdRaw != null) {
                statusId = Integer.parseInt(statusIdRaw);
            }
            String[] sortList = {"ID Ascending", "ID Descending", "Latest modified Ascending","Latest modified Descending"};
            String sort = request.getParameter("sort");
            if (sort == null) {
                sort = "ID Ascending";
            }
            int blogsPerPage = 5;
            String entry = request.getParameter("entry");
            if (entry != null && !entry.isEmpty() && !entry.equals("5")) {
                blogsPerPage = Integer.parseInt(entry);
            }
            List<Blog> blogList = bdao.searchBlogs(key, topicId, statusId, sort);

            //paging
            int numberBlogs = blogList.size();
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
            request.setAttribute("entry", blogsPerPage);
            request.setAttribute("sortList", sortList);
            request.setAttribute("statusList", statusList);
            request.setAttribute("sort", sort);
            request.setAttribute("key", key);
            request.setAttribute("blogsPage", blogsPage);
            request.setAttribute("topicList", topicList);
            request.setAttribute("topicId", topicId);
            request.setAttribute("statusId", statusId);
            request.getRequestDispatcher("pages/staff/blogmanagement.jsp").forward(request, response);
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
