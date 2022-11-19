/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal.product;

import dal.DBContext;
import dal.auth.AccountDAO;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import model.Category;
import model.Feedback;
import model.Image;
import model.Product;

/**
 *
 * @author ADMIN
 */
public class ProductDAO extends DBContext {

    CategoryDAO cdao = new CategoryDAO();
    BrandDAO bdao = new BrandDAO();
    StateDAO sdao = new StateDAO();
    ImageDAO idao = new ImageDAO();
    StoreDAO stdao = new StoreDAO();
    AccountDAO adao = new AccountDAO();

    public int getNumberOfOutOfStockProductByStoreId(int storeId) {
        String sql = "select count(*) from product where storeId = ? and quantity = 0";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, storeId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return -1;
    }

    public void updateProduct(Product product) {
        String sql = "UPDATE [dbo].[product]\n"
                + "   SET [name] = ?\n"
                + "      ,[categoryId] = ?\n"
                + "      ,[brandId] = ?\n"
                + "      ,[description] = ?\n"
                + "      ,[specification] = ?\n"
                + "      ,[price] = ?\n"
                + "      ,[quantity] = ?\n"
                + " WHERE id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, product.getName());
            st.setInt(2, product.getCategory().getId());
            st.setInt(3, product.getBrand().getId());
            st.setString(4, product.getDescription());
            st.setString(5, product.getSpecification());
            st.setDouble(6, product.getPrice());
            st.setInt(7, product.getQuantity());
            st.setInt(8, product.getId());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println("updateProduct error" + e);
        }

    }

    public void updateQuantity(int data, int id, int type) {
        String sql = "";
        switch (type) {
            case 1:
                sql = "UPDATE [dbo].[product] set quantity = ? where id =?";
                break;
            case 2:
                sql = "UPDATE [dbo].[product] set [discount] = ? where id =?";
                break;
            case 3:
                sql = "UPDATE [dbo].[product] set [price] = ? where id =?";
                break;
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, data);
            st.setInt(2, id);
            st.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }

    public List<Feedback> getFeedbackByStore(int storeId, String key) {
        String sql = "select * from feedback f join product p on f.productId=p.id where p.storeId = ?";
        List<Feedback> list = new ArrayList<>();
        if (key != null) {
            sql += " and p.name like ?\n";
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, storeId);
            if (key != null) {
                st.setString(2, "%" + key + "%");
            }
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Feedback feedback = new Feedback(
                        rs.getInt("id"),
                        getProductById(rs.getInt("productId")),
                        adao.getAccountById(rs.getInt("accountId")),
                        rs.getString("content"),
                        rs.getDate(5));
                list.add(feedback);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Feedback> getFeedback(int productId) {
        List<Feedback> list = new ArrayList<>();
        String sql = "SELECT [id]\n"
                + "      ,[productId]\n"
                + "      ,[accountId]\n"
                + "      ,[content]\n"
                + "      ,[datecreated]\n"
                + "  FROM [dbo].[feedback]\n"
                + "  where productId = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, productId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Feedback feedback = new Feedback(
                        rs.getInt("id"),
                        getProductById(rs.getInt("productId")),
                        adao.getAccountById(rs.getInt("accountId")),
                        rs.getString("content"),
                        rs.getDate(5));
                list.add(feedback);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public void deleteProduct(int productId) {
        try {
            String sql1 = "update [dbo].[product] set [stateId] = 2 where id = ?";
            PreparedStatement st = connection.prepareStatement(sql1);
            st.setInt(1, productId);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public List<Product> getTop8SaleProducts() {
        String sql = "SELECT TOP (8) [id]\n"
                + "      ,[name]\n"
                + "      ,[categoryId]\n"
                + "      ,[brandId]\n"
                + "      ,[releaseDate]\n"
                + "      ,[description]\n"
                + "      ,[specification]\n"
                + "      ,[price]\n"
                + "      ,[discount]\n"
                + "      ,[quantity]\n"
                + "      ,[stateId]\n"
                + "      ,[storeId]\n"
                + "  FROM [dbo].[product]\n"
                + "  ORDER BY discount DESC";
        List<Product> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product product = new Product(
                        rs.getInt("id"),
                        rs.getString("name"),
                        cdao.getCategoryById(rs.getInt("categoryId")),
                        bdao.getBrandById(rs.getInt("brandId")),
                        rs.getDate("releaseDate"),
                        rs.getString("description"),
                        rs.getString("specification"),
                        rs.getDouble("price"),
                        rs.getInt("discount"),
                        rs.getInt("quantity"),
                        sdao.getStateById(rs.getInt("stateId")),
                        stdao.getStoreById(rs.getInt("storeId")),
                        idao.getImagesByProductId(rs.getInt("id"))
                );
                list.add(product);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getTop8SellerProducts() {
        String sql = "WITH T\n"
                + "  AS (SELECT productId,\n"
                + "             SUM(quantity) AS total\n"
                + "        FROM [dbo].[orderDetail]\n"
                + "       GROUP BY productId)\n"
                + "SELECT DISTINCT TOP (8) [id],\n"
                + "                        [name],\n"
                + "                        [categoryId],\n"
                + "                        [brandId],\n"
                + "                        [releaseDate],\n"
                + "                        [description],\n"
                + "                        [specification],\n"
                + "                        [price],\n"
                + "                        [discount],\n"
                + "                        [quantity],\n"
                + "                        [stateId],\n"
                + "                        [storeId],\n"
                + "                        T.total\n"
                + "  FROM [dbo].[product]\n"
                + "  JOIN T\n"
                + "    ON T.productId = product.id\n"
                + " ORDER BY total DESC;";
        List<Product> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product product = new Product(
                        rs.getInt("id"),
                        rs.getString("name"),
                        cdao.getCategoryById(rs.getInt("categoryId")),
                        bdao.getBrandById(rs.getInt("brandId")),
                        rs.getDate("releaseDate"),
                        rs.getString("description"),
                        rs.getString("specification"),
                        rs.getDouble("price"),
                        rs.getInt("discount"),
                        rs.getInt("quantity"),
                        sdao.getStateById(rs.getInt("stateId")),
                        stdao.getStoreById(rs.getInt("storeId")),
                        idao.getImagesByProductId(rs.getInt("id"))
                );
                list.add(product);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getTop8NewProducts() {
        String sql = "SELECT TOP (8) [id]\n"
                + "      ,[name]\n"
                + "      ,[categoryId]\n"
                + "      ,[brandId]\n"
                + "      ,[releaseDate]\n"
                + "      ,[description]\n"
                + "      ,[specification]\n"
                + "      ,[price]\n"
                + "      ,[discount]\n"
                + "      ,[quantity]\n"
                + "      ,[stateId]\n"
                + "      ,[storeId]\n"
                + "  FROM [dbo].[product]\n"
                + "  ORDER BY releaseDate DESC";
        List<Product> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product product = new Product(
                        rs.getInt("id"),
                        rs.getString("name"),
                        cdao.getCategoryById(rs.getInt("categoryId")),
                        bdao.getBrandById(rs.getInt("brandId")),
                        rs.getDate("releaseDate"),
                        rs.getString("description"),
                        rs.getString("specification"),
                        rs.getDouble("price"),
                        rs.getInt("discount"),
                        rs.getInt("quantity"),
                        sdao.getStateById(rs.getInt("stateId")),
                        stdao.getStoreById(rs.getInt("storeId")),
                        idao.getImagesByProductId(rs.getInt("id"))
                );
                list.add(product);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Product getProductById(int productId) {
        String sql = "SELECT [id]\n"
                + "      ,[name]\n"
                + "      ,[categoryId]\n"
                + "      ,[brandId]\n"
                + "      ,[releaseDate]\n"
                + "      ,[description]\n"
                + "      ,[specification]\n"
                + "      ,[price]\n"
                + "      ,[discount]\n"
                + "      ,[quantity]\n"
                + "      ,[stateId]\n"
                + "      ,[storeId]\n"
                + "  FROM [dbo].[product]"
                + "  WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, productId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Product product = new Product(
                        rs.getInt("id"),
                        rs.getString("name"),
                        cdao.getCategoryById(rs.getInt("categoryId")),
                        bdao.getBrandById(rs.getInt("brandId")),
                        rs.getDate("releaseDate"),
                        rs.getString("description"),
                        rs.getString("specification"),
                        rs.getDouble("price"),
                        rs.getInt("discount"),
                        rs.getInt("quantity"),
                        sdao.getStateById(rs.getInt("stateId")),
                        stdao.getStoreById(rs.getInt("storeId")),
                        idao.getImagesByProductId(rs.getInt("id"))
                );
                return product;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Product> getRelatedProducts(Product product) {
        String sql = "SELECT TOP (12) [id]\n"
                + "      ,[name]\n"
                + "      ,[categoryId]\n"
                + "      ,[brandId]\n"
                + "      ,[releaseDate]\n"
                + "      ,[description]\n"
                + "      ,[specification]\n"
                + "      ,[price]\n"
                + "      ,[discount]\n"
                + "      ,[quantity]\n"
                + "      ,[stateId]\n"
                + "      ,[storeId]\n"
                + "  FROM [dbo].[product]\n"
                + "  WHERE [stateId] = 1 and id != ?\n"
                + "  AND categoryId = ?\n"
                + "  ORDER BY NEWID()";
        List<Product> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, product.getId());
            st.setInt(2, product.getCategory().getId());
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product newProduct = new Product(
                        rs.getInt("id"),
                        rs.getString("name"),
                        cdao.getCategoryById(rs.getInt("categoryId")),
                        bdao.getBrandById(rs.getInt("brandId")),
                        rs.getDate("releaseDate"),
                        rs.getString("description"),
                        rs.getString("specification"),
                        rs.getDouble("price"),
                        rs.getInt("discount"),
                        rs.getInt("quantity"),
                        sdao.getStateById(rs.getInt("stateId")),
                        stdao.getStoreById(rs.getInt("storeId")),
                        idao.getImagesByProductId(rs.getInt("id"))
                );
                list.add(newProduct);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<Product> searchProductStore(int storeId, String key, int categoryId) {
        String sql = "SELECT [id]\n"
                + "      ,[name]\n"
                + "      ,[categoryId]\n"
                + "      ,[brandId]\n"
                + "      ,[releaseDate]\n"
                + "      ,[description]\n"
                + "      ,[specification]\n"
                + "      ,[price]\n"
                + "      ,[discount]\n"
                + "      ,[quantity]\n"
                + "      ,[stateId]\n"
                + "      ,[storeId]\n"
                + "  FROM [dbo].[product]\n"
                + "  WHERE [storeId] = ?";
        if (key != null) {
            sql += " AND name LIKE ?\n";
        }
        if (categoryId != 0) {
            sql += " AND categoryId = " + categoryId + "\n";
        }

        List<Product> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, storeId);
            if (key != null) {
                st.setString(2, "%" + key + "%");
            }
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product product = new Product(
                        rs.getInt("id"),
                        rs.getString("name"),
                        cdao.getCategoryById(rs.getInt("categoryId")),
                        bdao.getBrandById(rs.getInt("brandId")),
                        rs.getDate("releaseDate"),
                        rs.getString("description"),
                        rs.getString("specification"),
                        rs.getDouble("price"),
                        rs.getInt("discount"),
                        rs.getInt("quantity"),
                        sdao.getStateById(rs.getInt("stateId")),
                        stdao.getStoreById(rs.getInt("storeId")),
                        idao.getImagesByProductId(rs.getInt("id"))
                );
                list.add(product);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<Product> getProductsByCategory(Category category) {
        String sql = "SELECT [id]\n"
                + "      ,[name]\n"
                + "      ,[categoryId]\n"
                + "      ,[brandId]\n"
                + "      ,[releaseDate]\n"
                + "      ,[description]\n"
                + "      ,[specification]\n"
                + "      ,[price]\n"
                + "      ,[discount]\n"
                + "      ,[quantity]\n"
                + "      ,[stateId]\n"
                + "      ,[storeId]\n"
                + "  FROM [dbo].[product]\n"
                + "  WHERE [stateId] = 1 and categoryId = ?";
        List<Product> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, category.getId());
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product product = new Product(
                        rs.getInt("id"),
                        rs.getString("name"),
                        cdao.getCategoryById(rs.getInt("categoryId")),
                        bdao.getBrandById(rs.getInt("brandId")),
                        rs.getDate("releaseDate"),
                        rs.getString("description"),
                        rs.getString("specification"),
                        rs.getDouble("price"),
                        rs.getInt("discount"),
                        rs.getInt("quantity"),
                        sdao.getStateById(rs.getInt("stateId")),
                        stdao.getStoreById(rs.getInt("storeId")),
                        idao.getImagesByProductId(rs.getInt("id"))
                );
                list.add(product);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<Product> getAllProducts() {
        String sql = "SELECT [id]\n"
                + "      ,[name]\n"
                + "      ,[categoryId]\n"
                + "      ,[brandId]\n"
                + "      ,[releaseDate]\n"
                + "      ,[description]\n"
                + "      ,[specification]\n"
                + "      ,[price]\n"
                + "      ,[discount]\n"
                + "      ,[quantity]\n"
                + "      ,[stateId]\n"
                + "      ,[storeId]\n"
                + "  FROM [dbo].[product] where [stateId] = 1\n";
        List<Product> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product product = new Product(
                        rs.getInt("id"),
                        rs.getString("name"),
                        cdao.getCategoryById(rs.getInt("categoryId")),
                        bdao.getBrandById(rs.getInt("brandId")),
                        rs.getDate("releaseDate"),
                        rs.getString("description"),
                        rs.getString("specification"),
                        rs.getDouble("price"),
                        rs.getInt("discount"),
                        rs.getInt("quantity"),
                        sdao.getStateById(rs.getInt("stateId")),
                        stdao.getStoreById(rs.getInt("storeId")),
                        idao.getImagesByProductId(rs.getInt("id"))
                );
                list.add(product);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<Product> getProductsByKey(String key) {
        String sql = "SELECT [id]\n"
                + "      ,[name]\n"
                + "      ,[categoryId]\n"
                + "      ,[brandId]\n"
                + "      ,[releaseDate]\n"
                + "      ,[description]\n"
                + "      ,[specification]\n"
                + "      ,[price]\n"
                + "      ,[discount]\n"
                + "      ,[quantity]\n"
                + "      ,[stateId]\n"
                + "      ,[storeId]\n"
                + "  FROM [dbo].[product]\n"
                + "  WHERE [stateId] = 1 and name LIKE ?";
        List<Product> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + key + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product product = new Product(
                        rs.getInt("id"),
                        rs.getString("name"),
                        cdao.getCategoryById(rs.getInt("categoryId")),
                        bdao.getBrandById(rs.getInt("brandId")),
                        rs.getDate("releaseDate"),
                        rs.getString("description"),
                        rs.getString("specification"),
                        rs.getDouble("price"),
                        rs.getInt("discount"),
                        rs.getInt("quantity"),
                        sdao.getStateById(rs.getInt("stateId")),
                        stdao.getStoreById(rs.getInt("storeId")),
                        idao.getImagesByProductId(rs.getInt("id"))
                );
                list.add(product);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<Product> getProductsByCategoryId(int categoryId) {
        String sql = "SELECT [id]\n"
                + "      ,[name]\n"
                + "      ,[categoryId]\n"
                + "      ,[brandId]\n"
                + "      ,[releaseDate]\n"
                + "      ,[description]\n"
                + "      ,[specification]\n"
                + "      ,[price]\n"
                + "      ,[discount]\n"
                + "      ,[quantity]\n"
                + "      ,[stateId]\n"
                + "      ,[storeId]\n"
                + "  FROM [dbo].[product]\n"
                + "  WHERE [stateId] = 1 and 1 = 1 ";
        List<Product> list = new ArrayList<>();
        if (categoryId != 0) {
            sql += "AND categoryId = " + categoryId;
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product product = new Product(
                        rs.getInt("id"),
                        rs.getString("name"),
                        cdao.getCategoryById(rs.getInt("categoryId")),
                        bdao.getBrandById(rs.getInt("brandId")),
                        rs.getDate("releaseDate"),
                        rs.getString("description"),
                        rs.getString("specification"),
                        rs.getDouble("price"),
                        rs.getInt("discount"),
                        rs.getInt("quantity"),
                        sdao.getStateById(rs.getInt("stateId")),
                        stdao.getStoreById(rs.getInt("storeId")),
                        idao.getImagesByProductId(rs.getInt("id"))
                );
                list.add(product);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<Product> getProductsByBrands(int[] brandId) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT [id]\n"
                + "      ,[name]\n"
                + "      ,[categoryId]\n"
                + "      ,[brandId]\n"
                + "      ,[releaseDate]\n"
                + "      ,[description]\n"
                + "      ,[specification]\n"
                + "      ,[price]\n"
                + "      ,[discount]\n"
                + "      ,[quantity]\n"
                + "      ,[stateId]\n"
                + "      ,[storeId]\n"
                + "  FROM [dbo].[product]\n"
                + "  WHERE [stateId] = 1 and 1 = 1 ";
        if (brandId != null && brandId[0] != 0) {
            sql += " AND brandId IN (";
            for (int i = 0; i < brandId.length; i++) {
                sql += brandId[i] + ",";
            }
            if (sql.endsWith(",")) {
                sql = sql.substring(0, sql.length() - 1);
            }
            sql += ")";
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product product = new Product(
                        rs.getInt("id"),
                        rs.getString("name"),
                        cdao.getCategoryById(rs.getInt("categoryId")),
                        bdao.getBrandById(rs.getInt("brandId")),
                        rs.getDate("releaseDate"),
                        rs.getString("description"),
                        rs.getString("specification"),
                        rs.getDouble("price"),
                        rs.getInt("discount"),
                        rs.getInt("quantity"),
                        sdao.getStateById(rs.getInt("stateId")),
                        stdao.getStoreById(rs.getInt("storeId")),
                        idao.getImagesByProductId(rs.getInt("id"))
                );
                list.add(product);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<Product> getProductsByPrice(double from, double to) {
        String sql = "SELECT [id]\n"
                + "      ,[name]\n"
                + "      ,[categoryId]\n"
                + "      ,[brandId]\n"
                + "      ,[releaseDate]\n"
                + "      ,[description]\n"
                + "      ,[specification]\n"
                + "      ,[price]\n"
                + "      ,[discount]\n"
                + "      ,[quantity]\n"
                + "      ,[stateId]\n"
                + "      ,[storeId]\n"
                + "  FROM [dbo].[product]\n"
                + "  WHERE [stateId] = 1 and price BETWEEN ? AND ?";
        List<Product> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setDouble(1, from);
            st.setDouble(2, to);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product product = new Product(
                        rs.getInt("id"),
                        rs.getString("name"),
                        cdao.getCategoryById(rs.getInt("categoryId")),
                        bdao.getBrandById(rs.getInt("brandId")),
                        rs.getDate("releaseDate"),
                        rs.getString("description"),
                        rs.getString("specification"),
                        rs.getDouble("price"),
                        rs.getInt("discount"),
                        rs.getInt("quantity"),
                        sdao.getStateById(rs.getInt("stateId")),
                        stdao.getStoreById(rs.getInt("storeId")),
                        idao.getImagesByProductId(rs.getInt("id"))
                );
                list.add(product);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<Feedback> getFeedbacksByPage(List<Feedback> list, int start, int end) {
        ArrayList<Feedback> newList = new ArrayList<>();
        for (int i = start; i < end; i++) {
            newList.add(list.get(i));
        }
        return newList;
    }

    public List<Product> getProductsByPage(ArrayList<Product> list, int start, int end) {
        ArrayList<Product> newList = new ArrayList<>();
        for (int i = start; i < end; i++) {
            newList.add(list.get(i));
        }
        return newList;
    }

    public List<Product> searchProducts(String key, int categoryId, int[] brandIds, double from, double to, String sort) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT [id]\n"
                + "      ,[name]\n"
                + "      ,[categoryId]\n"
                + "      ,[brandId]\n"
                + "      ,[releaseDate]\n"
                + "      ,[description]\n"
                + "      ,[specification]\n"
                + "      ,[price]\n"
                + "      ,[discount]\n"
                + "      ,[quantity]\n"
                + "      ,[stateId]\n"
                + "      ,[storeId]\n"
                + "  FROM [dbo].[product]\n"
                + "  WHERE [stateId] = 1 and 1 = 1 \n";
        if (key != null) {
            sql += " AND name LIKE ?\n";
        }
        if (categoryId != 0) {
            sql += " AND categoryId = " + categoryId + "\n";
        }
        if (brandIds != null && brandIds[0] != 0) {
            sql += " AND brandId IN (";
            for (int i = 0; i < brandIds.length; i++) {
                sql += brandIds[i] + ",";
            }
            if (sql.endsWith(",")) {
                sql = sql.substring(0, sql.length() - 1);
            }
            sql += ")\n";
        }
        if (to != 0) {
            sql += " AND price BETWEEN ? AND ?\n";
        }
        switch (sort) {
            case "Name, A to Z":
                sql += " ORDER BY name ASC";
                break;
            case "Name, Z to A":
                sql += " ORDER BY name DESC";
                break;
            case "Price, low to high":
                sql += " ORDER BY price ASC";
                break;
            case "Price, high to low":
                sql += " ORDER BY price DESC";
                break;
            case "Sort By new":
                sql += " ORDER BY releaseDate DESC";
                break;
            case "Sort By old":
                sql += " ORDER BY releaseDate ASC";
                break;
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            if (key != null && to != 0) {
                st.setString(1, "%" + key + "%");
                st.setDouble(2, from);
                st.setDouble(3, to);
            } else if (to != 0 && key == null) {
                st.setDouble(1, from);
                st.setDouble(2, to);
            } else if (from == 0 && to == 0 && key != null) {
                st.setString(1, "%" + key + "%");
            }
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product product = new Product(
                        rs.getInt("id"),
                        rs.getString("name"),
                        cdao.getCategoryById(rs.getInt("categoryId")),
                        bdao.getBrandById(rs.getInt("brandId")),
                        rs.getDate("releaseDate"),
                        rs.getString("description"),
                        rs.getString("specification"),
                        rs.getDouble("price"),
                        rs.getInt("discount"),
                        rs.getInt("quantity"),
                        sdao.getStateById(rs.getInt("stateId")),
                        stdao.getStoreById(rs.getInt("storeId")),
                        idao.getImagesByProductId(rs.getInt("id"))
                );
                list.add(product);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public int getLastestProductId() {
        String sql = "select top 1 id from product order by id desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                int id = rs.getInt(1);
                return id;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public void addProduct(String name, int categoryId, int BrandId, String description, String specification, int price, int quantity, int storeId, List<Image> imageList) {
        String sql = "INSERT INTO [dbo].[product]\n"
                + "           ([name]\n"
                + "           ,[categoryId]\n"
                + "           ,[brandId]\n"
                + "           ,[releaseDate]\n"
                + "           ,[description]\n"
                + "           ,[specification]\n"
                + "           ,[price]\n"
                + "           ,[discount]\n"
                + "           ,[quantity]\n"
                + "           ,[stateId]\n"
                + "           ,[storeId])\n"
                + "     VALUES(?,?,?,?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setInt(2, categoryId);
            st.setInt(3, BrandId);
            st.setString(4, java.time.LocalDate.now().toString());
            st.setString(5, description);
            st.setString(6, specification);
            st.setInt(7, price);
            st.setInt(8, 0);
            st.setInt(9, quantity);
            st.setInt(10, 1);
            st.setInt(11, storeId);
            st.executeUpdate();
            int productId = getLastestProductId();
            idao.insertImages(imageList, productId);
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void insert(Product product) {
        String sql = "INSERT INTO [dbo].[product]\n"
                + "           ([name]\n"
                + "           ,[categoryId]\n"
                + "           ,[brandId]\n"
                + "           ,[releaseDate]\n"
                + "           ,[description]\n"
                + "           ,[specification]\n"
                + "           ,[price]\n"
                + "           ,[discount]\n"
                + "           ,[quantity]\n"
                + "           ,[stateId]\n"
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
            st.setString(1, product.getName());
            st.setInt(2, product.getCategory().getId());
            st.setInt(3, product.getBrand().getId());
            st.setDate(4, product.getReleaseDate());
            st.setString(5, product.getDescription());
            st.setString(6, product.getSpecification());
            st.setDouble(7, product.getPrice());
            st.setInt(8, product.getDiscount());
            st.setInt(9, product.getQuantity());
            st.setInt(10, product.getState().getId());
            st.setInt(11, product.getStore().getId());
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void update(Product product) {
        String sql = "UPDATE [dbo].[product]\n"
                + "   SET [name] = ?\n"
                + "      ,[categoryId] = ?\n"
                + "      ,[brandId] = ?\n"
                + "      ,[releaseDate] = ?\n"
                + "      ,[description] = ?\n"
                + "      ,[specification] = ?\n"
                + "      ,[price] = ?\n"
                + "      ,[discount] = ?\n"
                + "      ,[quantity] = ?\n"
                + "      ,[stateId] = ?\n"
                + "      ,[storeId] = ?\n"
                + " WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, product.getName());
            st.setInt(2, product.getCategory().getId());
            st.setInt(3, product.getBrand().getId());
            st.setDate(4, product.getReleaseDate());
            st.setString(5, product.getDescription());
            st.setString(6, product.getSpecification());
            st.setDouble(7, product.getPrice());
            st.setInt(8, product.getDiscount());
            st.setInt(9, product.getQuantity());
            st.setInt(10, product.getState().getId());
            st.setInt(11, product.getStore().getId());
            st.setInt(12, product.getId());
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void delete(int id) {
        String sql = "DELETE FROM [dbo].[product]\n"
                + "      WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public String getTotalRevenue() {
        String sql = "SELECT SUM(total)\n"
                + "  FROM dbo.[order];";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                double total = rs.getDouble(1);
                NumberFormat currencyFormat = NumberFormat.getCurrencyInstance(new Locale("vi", "VN"));
                return currencyFormat.format(total);
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public int getTotalQuantity() {
        String sql = "  SELECT SUM(quantity)\n"
                + "  FROM dbo.orderDetail";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                int total = rs.getInt(1);
                NumberFormat currencyFormat = NumberFormat.getCurrencyInstance(new Locale("vi", "VN"));
                return total;
            }
        } catch (SQLException e) {
        }
        return 0;
    }
}
