/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal.blog;

import dal.DBContext;
import dal.auth.AccountDAO;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import model.Account;
import model.Blog;

/**
 *
 * @author thanh
 */
public class BlogDAO extends DBContext {

    TopicDAO tdao = new TopicDAO();
    AccountDAO adao = new AccountDAO();
    BlogStatusDAO bsdao = new BlogStatusDAO();

    public List<Blog> getAllBlogs() {
        List<Blog> list = new ArrayList<>();
        String sql = "SELECT [id]\n"
                + "      ,[title]\n"
                + "      ,[thumbnail]\n"
                + "      ,[description]\n"
                + "      ,[content]\n"
                + "      ,[createdDate]\n"
                + "      ,[authorId]\n"
                + "      ,[topicId]\n"
                + "      ,[statusId]\n"
                + "  FROM [dbo].[blog]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Blog blog = new Blog(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getTimestamp(6),
                        adao.getAccountById(rs.getInt(7)),
                        tdao.getTopicById(rs.getInt(8)),
                        bsdao.getBlogStatusById(rs.getInt(9))
                );
                list.add(blog);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Blog> getApprovedBlogs() {
        List<Blog> list = new ArrayList<>();
        String sql = "SELECT [id]\n"
                + "      ,[title]\n"
                + "      ,[thumbnail]\n"
                + "      ,[description]\n"
                + "      ,[content]\n"
                + "      ,[createdDate]\n"
                + "      ,[authorId]\n"
                + "      ,[topicId]\n"
                + "      ,[statusId]\n"
                + "  FROM [dbo].[blog]"
                + "  WHERE statusId = ?"
                + "  ORDER BY createdDate DESC\n";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, 2);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Blog blog = new Blog(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getTimestamp(6),
                        adao.getAccountById(rs.getInt(7)),
                        tdao.getTopicById(rs.getInt(8)),
                        bsdao.getBlogStatusById(rs.getInt(9))
                );
                list.add(blog);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Blog getBlogById(int id) {
        String sql = "SELECT [id]\n"
                + "      ,[title]\n"
                + "      ,[thumbnail]\n"
                + "      ,[description]\n"
                + "      ,[content]\n"
                + "      ,[createdDate]\n"
                + "      ,[authorId]\n"
                + "      ,[topicId]\n"
                + "      ,[statusId]\n"
                + "  FROM [dbo].[blog]\n"
                + "  WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Blog blog = new Blog(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getTimestamp(6),
                        adao.getAccountById(rs.getInt(7)),
                        tdao.getTopicById(rs.getInt(8)),
                        bsdao.getBlogStatusById(rs.getInt(9))
                );
                return blog;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Blog> getBlogsByPage(ArrayList<Blog> list, int start, int end) {
        ArrayList<Blog> newList = new ArrayList<>();
        for (int i = start; i < end; i++) {
            newList.add(list.get(i));
        }
        return newList;
    }

    public List<Blog> searchBlogs(String key, int topicId, int statusId, String sort) {
        List<Blog> list = new ArrayList<>();
        String sql = "SELECT [id]\n"
                + "      ,[title]\n"
                + "      ,[thumbnail]\n"
                + "      ,[description]\n"
                + "      ,[content]\n"
                + "      ,[createdDate]\n"
                + "      ,[authorId]\n"
                + "      ,[topicId]\n"
                + "      ,[statusId]\n"
                + "  FROM [dbo].[blog]\n"
                + " WHERE 1 = 1\n";
        if (key != null) {
            sql += "AND (   title LIKE ?\n"
                    + "      OR   description LIKE ?)\n";
        }
        if (topicId != 0) {
            sql += "AND topicId = ?\n";
        }
        if (statusId != 0) {
            sql += " AND statusId = ?\n";
        }
        switch (sort) {
            case "ID Ascending":
                sql += "ORDER BY id ASC\n";
                break;
            case "ID Descending":
                sql += "ORDER BY id DESC\n";
                break;
            case "Latest modified Ascending":
                sql += "ORDER BY createdDate DESC\n";
                break;
            case "Latest modified Descending":
                sql += "ORDER BY createdDate ASC\n";
                break;
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            if (key != null && topicId != 0 && statusId != 0) {
                st.setString(1, "%" + key + "%");
                st.setString(2, "%" + key + "%");
                st.setInt(3, topicId);
                st.setInt(4, statusId);
            } else if (key != null && topicId != 0 && statusId == 0) {
                st.setString(1, "%" + key + "%");
                st.setString(2, "%" + key + "%");
                st.setInt(3, topicId);
            } else if (key != null && topicId == 0 && statusId != 0) {
                st.setString(1, "%" + key + "%");
                st.setString(2, "%" + key + "%");
                st.setInt(3, statusId);
            } else if (key == null && topicId != 0 && statusId != 0) {
                st.setInt(1, topicId);
                st.setInt(2, statusId);
            } else if (key == null && topicId != 0 && statusId == 0) {
                st.setInt(1, topicId);
            } else if (key == null && topicId == 0 && statusId != 0) {
                st.setInt(1, statusId);
            } else if (key != null && topicId == 0 && statusId == 0) {
                st.setString(1, "%" + key + "%");
                st.setString(2, "%" + key + "%");
            }
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Blog blog = new Blog(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getTimestamp(6),
                        adao.getAccountById(rs.getInt(7)),
                        tdao.getTopicById(rs.getInt(8)),
                        bsdao.getBlogStatusById(rs.getInt(9))
                );
                list.add(blog);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public void create(String title, String thumbnail, String description, String content, LocalDateTime today, int accountId, int topicId) {
        String sql = "INSERT INTO [dbo].[blog]\n"
                + "           ([title]\n"
                + "           ,[thumbnail]\n"
                + "           ,[description]\n"
                + "           ,[content]\n"
                + "           ,[createdDate]\n"
                + "           ,[authorId]\n"
                + "           ,[topicId])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, title);
            st.setString(2, thumbnail);
            st.setString(3, description);
            st.setString(4, content);
            st.setObject(5, today);
            st.setInt(6, accountId);
            st.setInt(7, topicId);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void update(Blog blog) {
        String sql = "UPDATE [dbo].[blog]\n"
                + "   SET [title] = ?\n"
                + "      ,[thumbnail] = ?\n"
                + "      ,[description] = ?\n"
                + "      ,[content] = ?\n"
                + "      ,[createdDate] = ?\n"
                + "      ,[topicId] = ?\n"
                + "      ,[statusId] = ?\n"
                + " WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, blog.getTitle());
            st.setString(2, blog.getThumbnail());
            st.setString(3, blog.getDescription());
            st.setString(4, blog.getContent());
            st.setObject(5, blog.getCreatedDate());
            st.setInt(6, blog.getTopic().getId());
            st.setInt(7, blog.getStatus().getId());
            st.setInt(8, blog.getId());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void delete(int id) {
        String sql = "DELETE FROM [dbo].[blog]\n"
                + "      WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public List<Blog> getRelatedBlogs(Blog blog) {
        List<Blog> list = new ArrayList<>();
        String sql = "SELECT TOP 5 [id]\n"
                + "      ,[title]\n"
                + "      ,[thumbnail]\n"
                + "      ,[description]\n"
                + "      ,[content]\n"
                + "      ,[createdDate]\n"
                + "      ,[authorId]\n"
                + "      ,[topicId]\n"
                + "      ,[statusId]\n"
                + "  FROM [dbo].[blog]\n"
                + "  WHERE id != ?\n"
                + "  AND topicId = ?\n"
                + "  AND statusId = ?\n"
                + "  ORDER BY NEWID()";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, blog.getId());
            st.setInt(2, blog.getTopic().getId());
            st.setInt(3, 2);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Blog b = new Blog(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getTimestamp(6),
                        adao.getAccountById(rs.getInt(7)),
                        tdao.getTopicById(rs.getInt(8)),
                        bsdao.getBlogStatusById(rs.getInt(9))
                );
                list.add(b);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Blog> searchApprovedBlogs(String keyblog, int topicId) {
        List<Blog> list = new ArrayList<>();
        String sql = "SELECT [id]\n"
                + "      ,[title]\n"
                + "      ,[thumbnail]\n"
                + "      ,[description]\n"
                + "      ,[content]\n"
                + "      ,[createdDate]\n"
                + "      ,[authorId]\n"
                + "      ,[topicId]\n"
                + "      ,[statusId]\n"
                + "  FROM [dbo].[blog]\n"
                + "  WHERE statusId = 2\n";
        if (keyblog != null) {
            sql += "AND (   title LIKE ?\n"
                    + "      OR   description LIKE ?)\n";
        }
        if (topicId != 0) {
            sql += "AND topicId = ?\n";
        }
        sql += "  ORDER BY createdDate DESC\n";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            if (keyblog != null && topicId != 0) {
                st.setString(1, "%" + keyblog + "%");
                st.setString(2, "%" + keyblog + "%");
                st.setInt(3, topicId);
            } else if (keyblog != null && topicId == 0) {
                st.setString(1, "%" + keyblog + "%");
                st.setString(2, "%" + keyblog + "%");
            } else if (keyblog == null && topicId != 0) {
                st.setInt(1, topicId);
            }
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Blog blog = new Blog(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getTimestamp(6),
                        adao.getAccountById(rs.getInt(7)),
                        tdao.getTopicById(rs.getInt(8)),
                        bsdao.getBlogStatusById(rs.getInt(9))
                );
                list.add(blog);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
}
