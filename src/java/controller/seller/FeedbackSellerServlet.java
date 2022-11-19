/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.seller;

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
import model.Account;
import model.Feedback;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "FeedbackSellerServlet", urlPatterns = {"/feedback"})
public class FeedbackSellerServlet extends HttpServlet {

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
            out.println("<title>Servlet FeedbackSeller</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet FeedbackSeller at " + request.getContextPath() + "</h1>");
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
        String key = request.getParameter("key");
        ProductDAO pdao = new ProductDAO();
        List<Feedback> feedbackList = pdao.getFeedbackByStore(account.getStore().getId(), key);

        // Paging
        int feedbacksPerPage = 9;
        int numberProducts = feedbackList.size();
        int numberPages = numberProducts / feedbacksPerPage + (numberProducts % feedbacksPerPage == 0 ? 0 : 1);
        String xpage = request.getParameter("page");
        int page;
        if (xpage == null) {
            page = 1;
        } else {
            page = Integer.parseInt(xpage);
        }
        int start = (page - 1) * feedbacksPerPage;
        int end;
        if (page * feedbacksPerPage > numberProducts) {
            end = numberProducts;
        } else {
            end = page * feedbacksPerPage;
        }
        List<Feedback> feedbacksPage = pdao.getFeedbacksByPage(feedbackList, start, end);
        request.setAttribute("numberPages", numberPages);
        request.setAttribute("page", page);
        request.setAttribute("feedbackList", feedbacksPage);
        request.getRequestDispatcher("pages/seller/feedback.jsp").forward(request, response);
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
