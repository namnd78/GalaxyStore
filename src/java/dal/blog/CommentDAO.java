/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal.blog;

import dal.DBContext;
import dal.auth.AccountDAO;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import model.Account;
import model.Blog;
import model.Comment;

/**
 *
 * @author NamND
 */
public class CommentDAO extends DBContext {

    AccountDAO adao = new AccountDAO();
    BlogDAO bdao = new BlogDAO();

    public void create(Blog blog, Account account, String content, LocalDateTime today) {
        String sql = "INSERT INTO [dbo].[comment]\n"
                + "           ([blogId]\n"
                + "           ,[accountId]\n"
                + "           ,[content]\n"
                + "           ,[createdDate])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, blog.getId());
            st.setInt(2, account.getId());
            st.setString(3, content);
            st.setObject(4, today);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public Comment getCommentById(int id) {
        String sql = "SELECT [id]\n"
                + "      ,[blogId]\n"
                + "      ,[accountId]\n"
                + "      ,[content]\n"
                + "      ,[createdDate]\n"
                + "  FROM [dbo].[comment]\n"
                + "  WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Comment comment = new Comment(
                        rs.getInt(1),
                        bdao.getBlogById(rs.getInt(2)),
                        adao.getAccountById(rs.getInt(3)),
                        rs.getString(4),
                        rs.getTimestamp(5)
                );
                return comment;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void update(Comment comment) {
        String sql = "UPDATE [dbo].[comment]\n"
                + "   SET [blogId] = ?\n"
                + "      ,[accountId] = ?\n"
                + "      ,[content] = ?\n"
                + "      ,[createdDate] = ?\n"
                + " WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, comment.getBlog().getId());
            st.setInt(2, comment.getAccount().getId());
            st.setString(3, comment.getContent());
            st.setObject(4, comment.getCreatedDate());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void delete(int id) {
        String sql = "DELETE FROM [dbo].[comment]\n"
                + "      WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public List<Comment> getCommentByBlog(int blogId) {
        List<Comment> list = new ArrayList<>();
        String sql = "SELECT [id]\n"
                + "      ,[blogId]\n"
                + "      ,[accountId]\n"
                + "      ,[content]\n"
                + "      ,[createdDate]\n"
                + "  FROM [dbo].[comment]\n"
                + "  WHERE blogId = ?\n"
                + "  ORDER BY createdDate DESC";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, blogId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Comment comment = new Comment(
                        rs.getInt(1),
                        bdao.getBlogById(rs.getInt(2)),
                        adao.getAccountById(rs.getInt(3)),
                        rs.getString(4),
                        rs.getTimestamp(5)
                );
                list.add(comment);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
}
