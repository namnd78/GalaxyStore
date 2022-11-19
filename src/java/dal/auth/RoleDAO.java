/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal.auth;

import com.oracle.wls.shaded.org.apache.regexp.recompile;
import dal.DBContext;
import jakarta.servlet.jsp.jstl.sql.Result;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Role;

/**
 *
 * @author NamND
 */
public class RoleDAO extends DBContext {

    public Role getRoleById(int id) {
        String sql = "SELECT [id]\n"
                + "      ,[name]\n"
                + "  FROM [dbo].[role]\n"
                + "  WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Role role = new Role(rs.getInt(1), rs.getString(2));
                return role;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Role> getAllRoles() {
        String sql = "SELECT [id]\n"
                + "      ,[name]\n"
                + "  FROM [dbo].[role]";
        List<Role> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Role role = new Role(rs.getInt(1), rs.getString(2));
                list.add(role);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
}
