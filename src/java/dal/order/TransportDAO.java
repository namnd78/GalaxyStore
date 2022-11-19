/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal.order;

import dal.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Transport;

/**
 *
 * @author NamND
 */
public class TransportDAO extends DBContext {

    public List<Transport> getAllTransports() {
        List<Transport> list = new ArrayList<>();
        String sql = "SELECT [id]\n"
                + "      ,[name]\n"
                + "      ,[price]\n"
                + "  FROM [dbo].[transport]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Transport transport = new Transport(rs.getInt("id"), rs.getString("name"), rs.getDouble("price"));
                list.add(transport);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public Transport getTransportById(int id) {
        String sql = "SELECT [id]\n"
                + "      ,[name]\n"
                + "      ,[price]\n"
                + "  FROM [dbo].[transport]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Transport transport = new Transport(rs.getInt(1), rs.getString(2), rs.getDouble(3));
                return transport;
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public void insert(Transport transport) {
        String sql = "INSERT INTO [dbo].[transport]\n"
                + "           ([name])\n"
                + "     VALUES\n"
                + "           (?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, transport.getName());
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void update(Transport transport) {
        String sql = "UPDATE [dbo].[transport]\n"
                + "   SET [name] = ?\n"
                + " WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, transport.getName());
            st.setInt(2, transport.getId());
        } catch (SQLException e) {
        }
    }

    public void delete(int id) {
        String sql = "DELETE FROM [dbo].[transport]\n"
                + "      WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }
}
