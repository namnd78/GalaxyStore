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
import model.Image;

public class ImageDAO extends DBContext {

    List<Image> getImagesByProductId(int productId) {
        String sql = "SELECT [id]\n"
                + "      ,[image]\n"
                + "      ,[productId]\n"
                + "  FROM [dbo].[image]\n"
                + "  WHERE productId = ?";
        List<Image> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, productId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Image image = new Image(rs.getInt("id"), rs.getString("image"), rs.getInt("productId"));
                list.add(image);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public void insertImages(List<Image> imageList, int productId) {
        String sql = "INSERT INTO [dbo].[image]\n"
                + "           ([image]\n"
                + "           ,[productId])\n"
                + "     VALUES(?,?)";
        try {
            for (Image image : imageList) {
                PreparedStatement st = connection.prepareStatement(sql);
                st.setString(1, image.getImage());
                st.setInt(2, productId);
                st.executeUpdate();
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

}
