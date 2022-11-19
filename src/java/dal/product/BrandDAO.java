/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal.product;

import dal.DBContext;
import jakarta.servlet.jsp.jstl.sql.Result;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Brand;

public class BrandDAO extends DBContext {

    public List<Brand> getAllBrands() {
        List<Brand> list = new ArrayList<>();
        String sql = "SELECT [id]\n"
                + "      ,[name]\n"
                + "  FROM [dbo].[brand]\n";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Brand brand = new Brand(rs.getInt("id"), rs.getString("name"));
                list.add(brand);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public Brand getBrandById(int id) {
        String sql = "SELECT [id]\n"
                + "      ,[name]\n"
                + "  FROM [dbo].[brand]\n"
                + "  WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Brand brand = new Brand(rs.getInt("id"), rs.getString("name"));
                return brand;
            }
        } catch (SQLException e) {
        }
        return null;
    }
}
