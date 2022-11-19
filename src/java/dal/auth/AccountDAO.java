/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal.auth;

import dal.DBContext;
import dal.product.StoreDAO;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Account;
import model.AccountStatus;
import model.Role;
import model.Store;

/**
 *
 * @author NamND
 */
public class AccountDAO extends DBContext {

    RoleDAO rdao = new RoleDAO();
    AccountStatusDAO asdao = new AccountStatusDAO();
    StoreDAO sdao = new StoreDAO();

    public List<Account> getAllAccounts() {
        String sql = "SELECT [id]\n"
                + "      ,[username]\n"
                + "      ,[password]\n"
                + "      ,[email]\n"
                + "      ,[fullname]\n"
                + "      ,[dob]\n"
                + "      ,[phone]\n"
                + "      ,[avatar]\n"
                + "      ,[roleId]\n"
                + "      ,[statusId]\n"
                + "      ,[storeId]\n"
                + "  FROM [dbo].[account]";
        List<Account> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Account account = new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getDate(6), rs.getString(7), rs.getString(8), rdao.getRoleById(rs.getInt(9)), asdao.getAccountStatusById(rs.getInt(10)), sdao.getStoreById(rs.getInt(11)));
                list.add(account);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Account checkAccount(String username, String password) {
        String sql = "SELECT [id]\n"
                + "      ,[username]\n"
                + "      ,[password]\n"
                + "      ,[email]\n"
                + "      ,[fullname]\n"
                + "      ,[dob]\n"
                + "      ,[phone]\n"
                + "      ,[avatar]\n"
                + "      ,[roleId]\n"
                + "      ,[statusId]\n"
                + "      ,[storeId]\n"
                + "  FROM [dbo].[account]\n"
                + "  WHERE [username] = ? and [password] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Account account = new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getDate(6), rs.getString(7), rs.getString(8), rdao.getRoleById(rs.getInt(9)), asdao.getAccountStatusById(rs.getInt(10)), sdao.getStoreById(rs.getInt(11)));
                return account;
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public Account getAccountByUsername(String username) {
        String sql = "SELECT [id]\n"
                + "      ,[username]\n"
                + "      ,[password]\n"
                + "      ,[email]\n"
                + "      ,[fullname]\n"
                + "      ,[dob]\n"
                + "      ,[phone]\n"
                + "      ,[avatar]\n"
                + "      ,[roleId]\n"
                + "      ,[statusId]\n"
                + "      ,[storeId]\n"
                + "  FROM [dbo].[account]\n"
                + "  WHERE username = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Account account = new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getDate(6), rs.getString(7), rs.getString(8), rdao.getRoleById(rs.getInt(9)), asdao.getAccountStatusById(rs.getInt(10)), sdao.getStoreById(rs.getInt(11)));
                return account;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Account getAccountByEmail(String email) {
        String sql = "SELECT [id]\n"
                + "      ,[username]\n"
                + "      ,[password]\n"
                + "      ,[email]\n"
                + "      ,[fullname]\n"
                + "      ,[dob]\n"
                + "      ,[phone]\n"
                + "      ,[avatar]\n"
                + "      ,[roleId]\n"
                + "      ,[statusId]\n"
                + "      ,[storeId]\n"
                + "  FROM [dbo].[account]\n"
                + "  WHERE email = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Account account = new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getDate(6), rs.getString(7), rs.getString(8), rdao.getRoleById(rs.getInt(9)), asdao.getAccountStatusById(rs.getInt(10)), sdao.getStoreById(rs.getInt(11)));
                return account;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Account getAccountByPhone(String phone) {
        String sql = "SELECT [id]\n"
                + "      ,[username]\n"
                + "      ,[password]\n"
                + "      ,[email]\n"
                + "      ,[fullname]\n"
                + "      ,[dob]\n"
                + "      ,[phone]\n"
                + "      ,[avatar]\n"
                + "      ,[roleId]\n"
                + "      ,[statusId]\n"
                + "      ,[storeId]\n"
                + "  FROM [dbo].[account]\n"
                + "  WHERE phone = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, phone);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Account account = new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getDate(6), rs.getString(7), rs.getString(8), rdao.getRoleById(rs.getInt(9)), asdao.getAccountStatusById(rs.getInt(10)), sdao.getStoreById(rs.getInt(11)));
                return account;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void addAccount(String username, String password, String email, String fullname, String dob, String phone) {
        String sql = "INSERT INTO dbo.account (username,\n"
                + "                         password,\n"
                + "                         email,\n"
                + "                         fullname,\n"
                + "                         dob,\n"
                + "                         phone)\n"
                + "VALUES (?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            st.setString(3, email);
            st.setString(4, fullname);
            st.setString(5, dob);
            st.setString(6, phone);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public Account getAccountById(int id) {
        String sql = "SELECT [id]\n"
                + "      ,[username]\n"
                + "      ,[password]\n"
                + "      ,[email]\n"
                + "      ,[fullname]\n"
                + "      ,[dob]\n"
                + "      ,[phone]\n"
                + "      ,[avatar]\n"
                + "      ,[roleId]\n"
                + "      ,[statusId]\n"
                + "      ,[storeId]\n"
                + "  FROM [dbo].[account]\n"
                + "  WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Account account = new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getDate(6), rs.getString(7), rs.getString(8), rdao.getRoleById(rs.getInt(9)), asdao.getAccountStatusById(rs.getInt(10)), sdao.getStoreById(rs.getInt(11)));
                return account;
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public void create(Account account) {
        String sql = "INSERT INTO [dbo].[account]\n"
                + "           ([username]\n"
                + "           ,[password]\n"
                + "           ,[email]\n"
                + "           ,[fullname]\n"
                + "           ,[dob]\n"
                + "           ,[phone]\n"
                + "           ,[avatar]\n"
                + "           ,[roleId])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, account.getUsername());
            st.setString(2, account.getPassword());
            st.setString(3, account.getEmail());
            st.setString(4, account.getFullname());
            st.setDate(5, account.getDob());
            st.setString(6, account.getPhone());
            st.setString(7, account.getAvatar());
            st.setInt(8, account.getRole().getId());
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void insert(Account account) {
        String sql = "INSERT INTO [dbo].[account]\n"
                + "           ([username]\n"
                + "           ,[password]\n"
                + "           ,[email]\n"
                + "           ,[fullname]\n"
                + "           ,[dob]\n"
                + "           ,[phone]\n"
                + "           ,[avatar]\n"
                + "           ,[roleId]\n"
                + "           ,[statusId]\n"
                + "           ,[storeId])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, account.getUsername());
            st.setString(2, account.getPassword());
            st.setString(3, account.getEmail());
            st.setString(4, account.getFullname());
            st.setDate(5, account.getDob());
            st.setString(6, account.getPhone());
            st.setString(7, account.getAvatar());
            st.setInt(8, account.getRole().getId());
            st.setInt(9, account.getStatus().getId());
            st.setInt(10, account.getStore().getId());
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void update(Account account) {
        String sql = "UPDATE [dbo].[account]\n"
                + "   SET [username] = ?\n"
                + "      ,[password] = ?\n"
                + "      ,[email] = ?\n"
                + "      ,[fullname] = ?\n"
                + "      ,[dob] = ?\n"
                + "      ,[phone] = ?\n"
                + "      ,[avatar] = ?\n"
                + "      ,[roleId] = ?\n"
                + "      ,[statusId] = ?\n"
                + "      ,[storeId] = ?\n"
                + " WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, account.getUsername());
            st.setString(2, account.getPassword());
            st.setString(3, account.getEmail());
            st.setString(4, account.getFullname());
            st.setDate(5, account.getDob());
            st.setString(6, account.getPhone());
            st.setString(7, account.getAvatar());
            st.setInt(8, account.getRole().getId());
            st.setInt(9, account.getStatus().getId());
            st.setInt(10, account.getStore().getId());
            st.setInt(11, account.getId());
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void delete(int id) {
        String sql = "DELETE FROM [dbo].[account]\n"
                + "      WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void updatePassword(String email, String content) {
        String sql = "update [dbo].[account] set [password] = ? where [email] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, content);
            st.setString(2, email);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public List<Account> getAccountsByPage(ArrayList<Account> list, int start, int end) {
        ArrayList<Account> newList = new ArrayList<>();
        for (int i = start; i < end; i++) {
            newList.add(list.get(i));
        }
        return newList;
    }

    public List<Account> searchAccount(String key, int roleId, int statusId, String sort) {
        List<Account> list = new ArrayList<>();
        String sql = "SELECT [id]\n"
                + "      ,[username]\n"
                + "      ,[password]\n"
                + "      ,[email]\n"
                + "      ,[fullname]\n"
                + "      ,[dob]\n"
                + "      ,[phone]\n"
                + "      ,[avatar]\n"
                + "      ,[roleId]\n"
                + "      ,[statusId]\n"
                + "      ,[storeId]\n"
                + "  FROM [dbo].[account]\n"
                + "  WHERE 1 = 1\n";
        if (key != null) {
            sql += " AND (fullname LIKE ?\n"
                    + "  OR username LIKE ?\n"
                    + "  OR email LIKE ?\n"
                    + "  OR phone LIKE ?)\n";
        }
        if (roleId != 0) {
            sql += " AND roleId = ?\n";
        }
        if (statusId != 0) {
            sql += " AND statusId = ?\n";
        }
        switch (sort) {
            case "ID Ascending":
                sql += " ORDER BY id ASC";
                break;
            case "ID Descending":
                sql += " ORDER BY id DESC";
                break;
            case "Name A - Z":
                sql += " ORDER BY fullname ASC";
                break;
            case "Name Z - A":
                sql += " ORDER BY fullname DESC";
                break;
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            if (key != null && roleId != 0 && statusId != 0) {
                st.setString(1, "%" + key + "%");
                st.setString(2, "%" + key + "%");
                st.setString(3, "%" + key + "%");
                st.setString(4, "%" + key + "%");
                st.setInt(5, roleId);
                st.setInt(6, statusId);
            } else if (key != null && roleId != 0 && statusId == 0) {
                st.setString(1, "%" + key + "%");
                st.setString(2, "%" + key + "%");
                st.setString(3, "%" + key + "%");
                st.setString(4, "%" + key + "%");
                st.setInt(5, roleId);
            } else if (key != null && roleId == 0 && statusId != 0) {
                st.setString(1, "%" + key + "%");
                st.setString(2, "%" + key + "%");
                st.setString(3, "%" + key + "%");
                st.setString(4, "%" + key + "%");
                st.setInt(5, statusId);
            } else if (key == null && roleId != 0 && statusId != 0) {
                st.setInt(1, roleId);
                st.setInt(2, statusId);
            } else if (key == null && roleId != 0 && statusId == 0) {
                st.setInt(1, roleId);
            } else if (key == null && roleId == 0 && statusId != 0) {
                st.setInt(1, statusId);
            } else if (key != null && roleId == 0 && statusId == 0) {
                st.setString(1, "%" + key + "%");
                st.setString(2, "%" + key + "%");
                st.setString(3, "%" + key + "%");
                st.setString(4, "%" + key + "%");
            }
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Account account = new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getDate(6), rs.getString(7), rs.getString(8), rdao.getRoleById(rs.getInt(9)), asdao.getAccountStatusById(rs.getInt(10)), sdao.getStoreById(rs.getInt(11)));
                list.add(account);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public boolean updateStatus(Account account) {
        String sql = "UPDATE dbo.account\n"
                + "SET statusId = ?\n"
                + "WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, account.getStatus().getId());
            st.setInt(2, account.getId());
            st.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }
}
