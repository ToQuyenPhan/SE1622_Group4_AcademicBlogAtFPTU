/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.BlogDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.DBUtils;

/**
 *
 * @author To Quyen Phan
 */
public class BlogDAO {
    private static final String GET_ALL_BLOGS = "SELECT blogID,userID,userApproveID,subjectID,title,content,date,"
            + "updateDate,image,video,numberOfVotes,numberOfComments,status from Blog";
    public List<BlogDTO> getAllBlogs() throws SQLException {
        List<BlogDTO> listAllBlogs = new ArrayList<>();
        Connection conn = null;
        PreparedStatement psm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                psm = conn.prepareStatement(GET_ALL_BLOGS);
                rs = psm.executeQuery();
                while (rs.next()) {
                    int blogID = rs.getInt("blogID");
                    int userID = rs.getInt("userID");
                    int userApproveID = rs.getInt("userApproveID");
                    int subjectID = rs.getInt("subjectID");
                    String title = rs.getString("title");
                    String content = rs.getString("content");
                    String date = rs.getString("date");
                    String updateDate = rs.getString("updateDate");
                    String image = rs.getString("image");
                    String video = rs.getString("video");
                    int numberOfVotes = rs.getInt("numberOfVotes");
                    int numberOfComments = rs.getInt("numberOfComments");
                    String status = rs.getString("status");
                    listAllBlogs.add(new BlogDTO(blogID, userID, userApproveID, subjectID, title, content,
                            date , updateDate, image, video, numberOfVotes, numberOfComments, status));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (psm != null) {
                psm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return listAllBlogs;
    }
    
}
