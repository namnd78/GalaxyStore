/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.seller;

import dal.order.OrderDAO;
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
public class LoadOrderByTabServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoadOrderByTabServlet</title>");
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
        if (account == null) {
            response.sendRedirect("login");
        } else {
            OrderDAO odao = new OrderDAO();
            String orderTab = request.getParameter("orderTab");
            List<Order> orders = odao.getOrdersByAccount(account.getId());
            String html = "";
            for (Order order : orders) {
                if ("1".equals(orderTab)) {
                    if (order.getOrderState().getId() == 1) {
                        html += "<table>\n"
                                + "                                <div class=\"d-flex justify-content-between align-items-center\">\n"
                                + "                                    <div>\n"
                                + "                                        <span>Oder date: " + order.getOrderTime() + "</span>\n"
                                + "                                        <span>  -  Paid: " + order.getTotalVND() + "</span>\n"
                                + "                                    </div>\n";
                        if (!order.getOrderState().getName().equals(("Received"))) {
                            html += "<button style=\"width: 162px;\" type=\"button\" class=\"btn-info d-flex align-items-center justify-content-center\" data-bs-toggle=\"modal\" data-bs-target=\"#deliverOrder\" onclick=\"DeliverOrder(2," + order.getId() + ")\">\n"
                                    + "                <i class=\"fa-solid fa-truck-fast text-black\"></i><span>&nbsp;Deliver order</span>\n"
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
                                    + "                                            <td>" + orderDetail.getNewSubTotalVND() + "</td>\n";
                            html += "</tr>";
                        }
                        html += "</tbody>\n"
                                + "                            </table>";
                    }
                } else if ("2".equals(orderTab)) {
                    if (order.getOrderState().getId() == 2) {
                        html += "<table>\n"
                                + "                                <div class=\"d-flex justify-content-between align-items-center\">\n"
                                + "                                    <div>\n"
                                + "                                        <span>Oder date: " + order.getOrderTime() + "</span>\n"
                                + "                                        <span>  -  Paid: " + order.getTotalVND() + "</span>\n"
                                + "                                    </div>\n";
                        if (!order.getOrderState().getName().equals(("Received"))) {
                            html += "<button style=\"width: 162px;\" type=\"button\" class=\"btn-warning d-flex align-items-center justify-content-center\" data-bs-toggle=\"modal\" data-bs-target=\"#receiveOrder\" onclick=\"ReceiveOrder(3," + order.getId() + ")\">\n"
                                    + "                <i class=\"fa-solid fa-circle-check text-black\"></i><span>&nbsp;Receive order</span>\n"
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
                                    + "                                            <td>" + orderDetail.getNewSubTotalVND() + "</td>\n";
                            html += "</tr>";
                        }
                        html += "</tbody>\n"
                                + "                            </table>";
                    }
                } else {
                    if (order.getOrderState().getId() == 3) {
                        html += "<table>\n"
                                + "                                <div class=\"d-flex justify-content-between align-items-center\">\n"
                                + "                                    <div>\n"
                                + "                                        <span>Oder date: " + order.getOrderTime() + "</span>\n"
                                + "                                        <span>  -  Paid: " + order.getTotalVND() + "</span>\n"
                                + "                                    </div>\n";
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
                                    + "                                            <td>" + orderDetail.getNewSubTotalVND() + "</td>\n";
                            html += "</tr>";
                        }
                        html += "</tbody>\n"
                                + "                            </table>";
                    }
                }
            }
            response.getWriter().print(html);
        }
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
