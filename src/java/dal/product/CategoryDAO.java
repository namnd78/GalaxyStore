/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal.product;

import dal.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Category;

public class CategoryDAO extends DBContext {

    public List<Category> getAllCategories() {
        List<Category> list = new ArrayList<>();
        String sql = "SELECT [id]\n"
                + "      ,[name]\n"
                + "  FROM [dbo].[category]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category category = new Category(rs.getInt("id"), rs.getString("name"));
                list.add(category);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public Category getCategoryById(int id) {
        String sql = "SELECT [id]\n"
                + "      ,[name]\n"
                + "  FROM [dbo].[category]\n"
                + "WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Category category = new Category(rs.getInt("id"), rs.getString("name"));
                return category;
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public void insert(Category category) {
        String sql = "INSERT INTO [dbo].[category]\n"
                + "           ([name])\n"
                + "     VALUES\n"
                + "           (?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, category.getName());
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void update(Category category) {
        String sql = "UPDATE [dbo].[category]\n"
                + "   SET [name] = ?\n"
                + " WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, category.getName());
            st.setInt(2, category.getId());
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void delete(int id) {
        String sql = "DELETE FROM [dbo].[category]\n"
                + "      WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }
}