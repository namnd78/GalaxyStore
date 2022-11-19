/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.seller;

import dal.order.OrderDAO;
import dal.product.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.text.DateFormat;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Locale;
import model.Account;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "DashBoardServlet", urlPatterns = {"/dashboard"})
public class DashBoardServlet extends HttpServlet {

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
            out.println("<title>Servlet DashBoardServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DashBoardServlet at " + request.getContextPath() + "</h1>");
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
        OrderDAO odao = new OrderDAO();
        ProductDAO pdao = new ProductDAO();
        int progressOrder = odao.getNumberOfOrdersByStoreAndStatus(account.getStore().getId(), 1);
        int shippingOrder = odao.getNumberOfOrdersByStoreAndStatus(account.getStore().getId(), 2);
        int receivedOrder = odao.getNumberOfOrdersByStoreAndStatus(account.getStore().getId(), 3);
        int outOfSctockProduct = pdao.getNumberOfOutOfStockProductByStoreId(account.getStore().getId());

        Calendar cal = Calendar.getInstance();
        DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
        request.setAttribute("today", dateFormat.format(cal.getTime()));
        
        DateFormat dateFormat1 = new SimpleDateFormat("yyyy-MM-dd");
        int totalSale = odao.getTotalSaleInDay(dateFormat1.format(cal.getTime()),account.getStore().getId());
        List<Integer> arrSale = new ArrayList<>();
        arrSale.add(totalSale);
        for(int i =1;i<4;i++){
            cal.add(Calendar.DATE, -1);
            int sale  = odao.getTotalSaleInDay(dateFormat1.format(cal.getTime()),account.getStore().getId());
            arrSale.add(sale);
        }
        request.setAttribute("arrSale", arrSale);
        
        NumberFormat currencyFormat = NumberFormat.getCurrencyInstance(new Locale("vi", "VN"));
        request.setAttribute("totalSale", currencyFormat.format(totalSale));
        
        DateFormat dateFormat3 = new SimpleDateFormat("dd/MM");
        List<String> arrDay = new ArrayList<>();
        Calendar cal1 = Calendar.getInstance();
        arrDay.add(dateFormat3.format(cal1.getTime()));
        for(int i =1;i<4;i++){
            cal1.add(Calendar.DATE, -1);
            String date = dateFormat3.format(cal1.getTime());
            arrDay.add(date);
        }
        System.out.println("-------------------"+arrDay.get(0));
        request.setAttribute("arrDay", arrDay);
        
        request.setAttribute("progressOrder", progressOrder);
        request.setAttribute("shippingOrder", shippingOrder);
        request.setAttribute("receivedOrder", receivedOrder);
        request.setAttribute("outOfSctockProduct", outOfSctockProduct);
        request.getRequestDispatcher("pages/seller/dashboard.jsp").forward(request, response);
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
