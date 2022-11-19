/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal.product;

import dal.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Store;

/**
 *
 * @author NamND
 */
public class StoreDAO extends DBContext {
    
    public Store getStoreByName(String storeName){
        String sql = "SELECT [id],[name],[address],[description] "
                + "FROM [dbo].[store] where [name] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, storeName);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Store store = new Store(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4));
                return store;
            }
        } catch (SQLException e) {
        }
        return null;
    }
    
    public void updateStore(Store store){
        String sql = "UPDATE [dbo].[store] SET [name] = ?,[address] = ?,[description] = ? WHERE id =?";
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, store.getName());
            st.setString(2, store.getAddress());
            st.setString(3, store.getDescription());
            st.setInt(4, store.getId());
            st.executeUpdate();
        }catch(SQLException e){
            System.out.println(e);
        }
    }
    
    public Store getStoreById(int id) {
        String sql = "SELECT [id]\n"
                + "      ,[name]\n"
                + "      ,[address]\n"
                + "      ,[description]\n"
                + "  FROM [dbo].[store]\n"
                + "  WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Store store = new Store(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4));
                return store;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    
    public int getLastestIdStore(){
        String sql = "select top 1 id from store order by id desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                int id = rs.getInt(1);
                return id;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return 0;
    }
    
    public void createStore(String username, Store store){
        try{
            String sql = "INSERT INTO [dbo].[store] ([name],[address],[description]) "
                    + "VALUES(?,?,?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, store.getName());
            st.setString(2, store.getAddress());
            st.setString(3, store.getDescription());
            st.executeUpdate();
            
            String sql2= "UPDATE [dbo].[account] set [storeId] = ? where [username] =?";
            PreparedStatement st1 = connection.prepareStatement(sql2);
            st1.setInt(1, getLastestIdStore());
            st1.setString(2, username);
            st1.executeUpdate();
        }catch(SQLException e){
            System.out.println(e);
        }
    }
}
