/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.order;

import dal.order.OrderDAO;
import dal.order.OrderDetailDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Account;
import model.Order;
import model.OrderDetail;

/**
 *
 * @author Duong
 */
public class CancelSingleOrderServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CancelSingleOrderServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>" + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        String html = "";
        if (account == null) {
            response.sendRedirect("login");
        } else {
            int orderDetailId = Integer.parseInt(request.getParameter("orderDetailId"));
            int orderId = Integer.parseInt(request.getParameter("orderId"));
            new OrderDetailDAO().deleteSingleOrderDetailsById(orderDetailId);
            if (new OrderDetailDAO().getOrderDetailsByOrder(orderId).size() <= 0) {
                new OrderDAO().deleteAllOrdersById(orderId);
            }
            List<Order> orders = new OrderDAO().getOrdersByAccount(account.getId());
            for (Order order : orders) {
                html += "<table>\n"
                        + "                                <div class=\"d-flex justify-content-between align-items-center\">\n"
                        + "                                    <div>\n"
                        + "                                        <span>Oder date: " + order.getOrderTime() + "</span>\n"
                        + "                                        <span>  -  Paid: " + order.getTotalVND() + "</span>\n"
                        + "                                        <span>  -  Status: " + order.getOrderState().getName() + "</span>\n"
                        + "                                    </div>\n";
                if (!order.getOrderState().getName().equals(("Received"))) {
                    html += "<button style=\"width: 162px;\" type=\"button\" class=\"btn-danger d-flex align-items-center justify-content-center\" data-bs-toggle=\"modal\" data-bs-target=\"#cancelAll\" onclick=\"CancelAllOrders(" + order.getId() + ")\">\n"
                            + "                <i class=\"fa-solid fa-xmark\"></i><span>&nbsp;Cancel all orders</span>\n"
                            + "            </button>";
                }
                html += "</div>\n"
                        + "                                <thead>\n"
                        + "                                    <tr>\n"
                        + "                                        <th>ID</th>\n"
                        + "                                        <th>Product</th>\n"
                        + "                                        <th></th>\n"
                        + "                                        <th>Price</th>\n"
                        + "                                        <th>Quantity</th>\n"
                        + "                                        <th>Total</th>\n"
                        + "                                        <th>Discount</th>\n"
                        + "                                        <th>Sale Price</th>\n"
                        + "                                        <th></th>\n"
                        + "                                    </tr>\n"
                        + "                                </thead>\n"
                        + "                                <tbody>";
                for (OrderDetail orderDetail : order.getOrderDetail()) {
                    html += "<tr>\n"
                            + "                                            <td>" + orderDetail.getProduct().getId() + "</td>\n"
                            + "                                            <td class=\"product-thumbnail\">\n"
                            + "                                                <img src=\"images/products/" + orderDetail.getProduct().getImages().get(0).getImage() + "\" />\n"
                            + "                                            </td>\n"
                            + "                                            <td class=\"product-name\">" + orderDetail.getProduct().getName() + "</td>\n"
                            + "                                            <td>" + orderDetail.getProduct().getOldPriceVND() + "</td>\n"
                            + "                                            <td>" + orderDetail.getQuantity() + "</td>\n"
                            + "                                            <td>" + orderDetail.getOldSubTotalVND() + "</td>\n"
                            + "                                            <td>" + orderDetail.getDiscount() + "</td>\n"
                            + "                                            <td>" + orderDetail.getNewSubTotalVND() + "</td>\n"
                            + "                                            <td>\n";
                    if (!order.getOrderState().getName().equals(("Received"))) {
                        html += "<button style=\"width: 131px;\" type=\"button\" class=\"btn-warning d-flex align-items-center justify-content-center\" data-bs-toggle=\"modal\" data-bs-target=\"#cancelSingle\" onclick=\"CancelSingleOrder(" + order.getId() + "," + orderDetail.getId() + ", '" + orderDetail.getProduct().getName() + "')\">\n"
                                + "                <i class=\"fa-solid fa-xmark\"></i><span>&nbsp;Cancel</span>\n"
                                + "            </button>";
                    } else {
                        html += "<button style=\"width: 131px;\" type=\"button\" class=\"btn-info d-flex align-items-center justify-content-center\">\n"
                                + "                <i class=\"fa-sharp fa-solid fa-cart-shopping\"></i><a href=\"productdetail?pid=" + orderDetail.getProduct().getId() + "\" style=\"color: black;\">&nbsp;Buy again</a>\n"
                                + "            </button>";
                    }
                    html += "</td>\n"
                            + "                                        </tr>";
                }
                html += "</tbody>\n"
                        + "                            </table>";
            }
        }
        response.getWriter().print(html);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
