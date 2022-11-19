/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal.blog;

import dal.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.BlogStatus;

/**
 *
 * @author NamND
 */
public class BlogStatusDAO extends DBContext {

    public BlogStatus getBlogStatusById(int id) {
        String sql = "SELECT [id]\n"
                + "      ,[name]\n"
                + "  FROM [dbo].[blogStatus]\n"
                + "  WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                BlogStatus status = new BlogStatus(rs.getInt(1), rs.getString(2));
                return status;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }
    
    public List<BlogStatus> getAllStatus() {
        String sql = "SELECT [id]\n"
                + "      ,[name]\n"
                + "  FROM [dbo].[blogStatus]";
        List<BlogStatus> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                BlogStatus status = new BlogStatus(rs.getInt(1), rs.getString(2));
                list.add(status);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
}
