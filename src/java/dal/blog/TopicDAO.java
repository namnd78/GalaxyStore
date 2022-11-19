/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal.blog;

import dal.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Blog;
import model.Topic;

/**
 *
 * @author thanh
 */
public class TopicDAO extends DBContext {

    public Topic getTopicById(int id) {
        String sql = "SELECT [id]\n"
                + "      ,[name]\n"
                + "  FROM [dbo].[topic]\n"
                + "  WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Topic topic = new Topic(rs.getInt(1), rs.getString(2));
                return topic;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Topic> getAllTopics() {
        List<Topic> list = new ArrayList<>();
        String sql = "SELECT [id]\n"
                + "      ,[name]\n"
                + "  FROM [dbo].[topic]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Topic topic = new Topic(rs.getInt(1), rs.getString(2));
                list.add(topic);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
}
