/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal.order;

import dal.DBContext;
import dal.auth.AccountDAO;
import dal.product.StateDAO;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import model.Account;
import model.Cart;
import model.CartItem;
import model.Order;
import model.Transport;

/**
 *
 * @author NamND
 */
public class OrderDAO extends DBContext {

    AccountDAO adao = new AccountDAO();
    TransportDAO tdao = new TransportDAO();
    OrderDetailDAO oddao = new OrderDetailDAO();
    OrderStateDAO osdao = new OrderStateDAO();

    public int getTotalSaleInDay(String date, int storeId){
        String sql = "select sum(od.price) from [order] o "
                + "join orderDetail od on o.id = od.orderId "
                + "join product p on od.productId =p.id "
                + "where cast (datediff (day, 0, o.orderTime) as datetime) = ? and p.storeId =?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, date);
            st.setInt(2, storeId);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }
    public void addOrder(Account account, Cart cart, String address, Transport transport) {
        Date now = new Date();
        Timestamp orderTime = new Timestamp(now.getTime());
        try {
            String sql = "INSERT INTO [dbo].[order]\n"
                    + "           ([accountId]\n"
                    + "           ,[stateId]\n"
                    + "           ,[address]\n"
                    + "           ,[transportId]\n"
                    + "           ,[orderTime]\n"
                    + "           ,[total])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, account.getId());
            st.setInt(2, 1);
            st.setString(3, address);
            st.setInt(4, transport.getId());
            st.setTimestamp(5, orderTime);
            st.setDouble(6, cart.getTotalMoney());
            st.executeUpdate();
            String sql1 = "SELECT TOP 1 id\n"
                    + "  FROM dbo.[order]\n"
                    + " ORDER BY id DESC;";
            PreparedStatement st1 = connection.prepareStatement(sql1);
            ResultSet rs = st1.executeQuery();
            if (rs.next()) {
                int orderId = rs.getInt(1);
                for (CartItem item : cart.getItems()) {
                    String sql2 = "INSERT INTO [dbo].[orderDetail]\n"
                            + "           ([orderId]\n"
                            + "           ,[productId]\n"
                            + "           ,[quantity]\n"
                            + "           ,[price]\n"
                            + "           ,[discount])\n"
                            + "     VALUES\n"
                            + "           (?\n"
                            + "           ,?\n"
                            + "           ,?\n"
                            + "           ,?\n"
                            + "           ,?)";
                    PreparedStatement st2 = connection.prepareStatement(sql2);
                    st2.setInt(1, orderId);
                    st2.setInt(2, item.getProduct().getId());
                    st2.setInt(3, item.getQuantity());
                    st2.setDouble(4, item.getProduct().getNewPrice());
                    st2.setInt(5, item.getProduct().getDiscount());
                    st2.executeUpdate();
                }
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public List<Order> getOrdersByAccount(int id) {
        String sql = "SELECT [id]\n"
                + "      ,[accountId]\n"
                + "      ,[stateId]\n"
                + "      ,[address]\n"
                + "      ,[transportId]\n"
                + "      ,[orderTime]\n"
                + "      ,[total]\n"
                + "  FROM [dbo].[order]\n"
                + "  WHERE accountId = ?\n"
                + "  ORDER BY id DESC";
        List<Order> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
//                Order order = new Order(rs.getInt(1), adao.getAccountById(rs.getInt(2)), osdao.getOrderStateById(rs.getInt(3)), rs.getString(4), tdao.getTransportById(rs.getInt(5)), rs.getTimestamp(6), rs.getDouble(7), oddao.getOrderDetailsByOrder(rs.getInt(1)));
                Order order = new Order();
                order.setId(rs.getInt(1));
                order.setAccount(adao.getAccountById(rs.getInt(2)));
                order.setOrderState(osdao.getOrderStateById(rs.getInt(3)));
                order.setAddress(rs.getString(4));
                order.setTransport(tdao.getTransportById(rs.getInt(5)));
                order.setOrderTime(rs.getTimestamp(6));
                order.setTotal(rs.getDouble(7));
                order.setOrderDetail(oddao.getOrderDetailsByOrder(rs.getInt(1)));
                list.add(order);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public int getNumberOfOrdersByStoreAndStatus(int storeId, int stateId) {
        String sql = "select count(*) from [order] o join orderDetail od on o.id = od.orderId join product p on od.productId =p.id"
                + " where storeId =? and o.stateId =?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, storeId);
            st.setInt(2, stateId);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return -2;
    }

    public Order getOrdersById(int id) {
        String sql = "SELECT [id]\n"
                + "      ,[accountId]\n"
                + "      ,[stateId]\n"
                + "      ,[address]\n"
                + "      ,[transportId]\n"
                + "      ,[orderTime]\n"
                + "      ,[total]\n"
                + "  FROM [dbo].[order]\n"
                + "  WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Order order = new Order();
                return order;
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public List<Order> getAllOrders() {
        String sql = "SELECT [id]\n"
                + "      ,[accountId]\n"
                + "      ,[stateId]\n"
                + "      ,[address]\n"
                + "      ,[transportId]\n"
                + "      ,[orderTime]\n"
                + "      ,[total]\n"
                + "  FROM [dbo].[order]";
        List<Order> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Order order = new Order(rs.getInt(1), adao.getAccountById(rs.getInt(2)), osdao.getOrderStateById(rs.getInt(3)), rs.getString(4), tdao.getTransportById(rs.getInt(5)), rs.getTimestamp(6), rs.getDouble(7), oddao.getOrderDetailsByOrder(rs.getInt(1)));
                list.add(order);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public void deleteAllOrdersById(int id) {
        String sql = "DELETE FROM [dbo].[order]\n"
                + "      WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void changeOrderStateById(int stateId, int id) {
        String sql = "UPDATE [dbo].[order]\n"
                + "   SET [stateId] = ?\n"
                + " WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, stateId);
            st.setInt(2, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
}
