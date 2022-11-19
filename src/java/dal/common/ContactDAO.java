/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal.common;

import dal.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import model.Account;
import model.AccountStatus;
import model.BlogStatus;
import model.Contact;
import model.ContactStatus;

/**
 *
 * @author NamND
 */
public class ContactDAO extends DBContext {

    public void create(String fullname, String email, String phone, String message, LocalDateTime today) {
        String sql = "INSERT INTO [dbo].[contact]\n"
                + "           ([fullname]\n"
                + "           ,[email]\n"
                + "           ,[phone]\n"
                + "           ,[message]\n"
                + "           ,[date]\n"
                + "           ,[statusId])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,1)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, fullname);
            st.setString(2, email);
            st.setString(3, phone);
            st.setString(4, message);
            st.setObject(5, today);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public List<ContactStatus> getAllStatus() {
        String sql = "SELECT [id]\n"
                + "      ,[name]\n"
                + "  FROM [dbo].[contactStatus]";
        List<ContactStatus> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                ContactStatus status = new ContactStatus(rs.getInt(1), rs.getString(2));
                list.add(status);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Contact> searchContact(int statusId, String sort) {
        List<Contact> list = new ArrayList<>();
        String sql = "SELECT [id]\n"
                + "      ,[fullname]\n"
                + "      ,[email]\n"
                + "      ,[phone]\n"
                + "      ,[message]\n"
                + "      ,[date]\n"
                + "      ,[statusId]\n"
                + "  FROM [dbo].[contact]\n"
                + "  WHERE 1 = 1\n";
        if (statusId != 0) {
            sql += " AND statusId = ?\n";
        }
        switch (sort) {
            case "Latest":
                sql += "ORDER BY date DESC\n";
                break;
            case "Oldest":
                sql += "ORDER BY date ASC\n";
                break;
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            if (statusId != 0) {
                st.setInt(1, statusId);
            }
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Contact contact = new Contact(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getTimestamp(6),
                        getStatusById(rs.getInt(7))
                );
                list.add(contact);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    private ContactStatus getStatusById(int id) {
        String sql = "SELECT [id]\n"
                + "      ,[name]\n"
                + "  FROM [dbo].[contactStatus]\n"
                + "  WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                ContactStatus status = new ContactStatus(rs.getInt(1), rs.getString(2));
                return status;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Contact> getContactsByPage(ArrayList<Contact> list, int start, int end) {
        ArrayList<Contact> newList = new ArrayList<>();
        for (int i = start; i < end; i++) {
            newList.add(list.get(i));
        }
        return newList;
    }

    public void updateStatus(int statusId, int id) {
        String sql = "UPDATE dbo.contact\n"
                + "SET statusId = ?\n"
                + "WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, statusId);
            st.setInt(2, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public Contact getContactById(int id) {
        String sql = "SELECT [id]\n"
                + "      ,[fullname]\n"
                + "      ,[email]\n"
                + "      ,[phone]\n"
                + "      ,[message]\n"
                + "      ,[date]\n"
                + "      ,[statusId]\n"
                + "  FROM [dbo].[contact]\n"
                + "  WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Contact contact = new Contact(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getTimestamp(6),
                        getStatusById(rs.getInt(7))
                );
                return contact;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void delete(int id) {
        String sql = "DELETE FROM [dbo].[contact]\n"
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
