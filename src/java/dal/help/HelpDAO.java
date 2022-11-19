/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal.help;

import dal.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Help;

/**
 *
 * @author Duong
 */
public class HelpDAO extends DBContext {

    public List<Help> getAllHelps() {
        String sql = "SELECT [id]\n"
                + "      ,[title]\n"
                + "      ,[content]\n"
                + "      ,[created_date]\n"
                + "      ,[tab]\n"
                + "      ,[target]\n"
                + "      ,[state]\n"
                + "  FROM [dbo].[help]";
        List<Help> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Help help = new Help(rs.getInt("id"), rs.getString("title"), rs.getString("content"), rs.getDate("created_date"), rs.getString("tab"), rs.getString("target"), rs.getString("state"));
                list.add(help);
            }
            return list;
        } catch (SQLException e) {
        }
        return null;
    }

    public void addHelp(String title, String content, String tab, String target) {
        String sql = "INSERT INTO [dbo].[help]\n"
                + "           ([title]\n"
                + "           ,[content]\n"
                + "           ,[tab]\n"
                + "           ,[target])\n"
                + "     VALUES\n"
                + "           (?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, title);
            st.setString(2, content);
            st.setString(3, tab);
            st.setString(4, target);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Add error: " + e.getMessage());
        }
    }

    public void updateHelpById(int id) {
//        String sql = "update [dbo].[account] set [password] = ? where [email] = ?";
//        try {
//            PreparedStatement st = connection.prepareStatement(sql);
//            st.setString(1, content);
//            st.setString(2, email);
//            st.executeUpdate();
//        } catch (SQLException e) {
//            System.out.println("Update error: " + e.getMessage());
//        }
    }

    public void deleteHelpById(int id) {
        String sql = "DELETE FROM [dbo].[help]\n"
                + "      WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Delete error: " + e.getMessage());
        }
    }
}
