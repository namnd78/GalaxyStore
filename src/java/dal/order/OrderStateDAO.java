/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal.order;

import dal.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.OrderState;

/**
 *
 * @author NamND
 */
public class OrderStateDAO extends DBContext {

    public OrderState getOrderStateById(int id) {
        String sql = "SELECT [id]\n"
                + "      ,[name]\n"
                + "  FROM [dbo].[orderStatus]\n"
                + "  WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                OrderState orderState = new OrderState(rs.getInt("id"), rs.getString("name"));
                return orderState;
            }
        } catch (SQLException e) {
        }
        return null;
    }

}
