/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal.order;

import dal.DBContext;
import dal.product.ProductDAO;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.OrderDetail;

/**
 *
 * @author NamND
 */
public class OrderDetailDAO extends DBContext {

    public List<OrderDetail> getOrderDetailsByOrder(int id) {
        String sql = "SELECT [id]\n"
                + "      ,[orderId]\n"
                + "      ,[productId]\n"
                + "      ,[quantity]\n"
                + "      ,[price]\n"
                + "      ,[discount]\n"
                + "  FROM [dbo].[orderDetail]\n"
                + "  WHERE orderId = ?";
        List<OrderDetail> list = new ArrayList<>();
        OrderDAO odao = new OrderDAO();
        ProductDAO pdao = new ProductDAO();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                OrderDetail orderDetail = new OrderDetail(rs.getInt("id"), odao.getOrdersById(rs.getInt("orderId")), pdao.getProductById(rs.getInt("productId")), rs.getInt("quantity"), rs.getDouble(5), rs.getInt(6));
                list.add(orderDetail);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public void deleteAllOrderDetailsByOrder(int id) {
        String sql = "DELETE FROM [dbo].[orderDetail]\n"
                + "      WHERE orderId = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void deleteSingleOrderDetailsById(int id) {
        String sql = "DELETE FROM [dbo].[orderDetail]\n"
                + "      WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

}
