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
            + "image,video,numberOfVotes,numberOfComments,status from Blog";
    private static final String DELETE = "DELETE Blog WHERE blogID=? ";
//    private static final String SEARCH = "SELECT blogID,userID,userApproveID,subjectID,title,content,date,"
//            + "image,video,numberOfVotes,numberOfComments,status from Blog WHERE subjectID like ? and status = 1 ";
    private static final String SEARCH = "SELECT blogID,userID,userApproveID,Blog.subjectID,title,content,date,image,video,numberOfVotes,numberOfComments,Blog.status\n"
            + "FROM Blog \n"
            + "JOIN Subject  ON Blog.subjectID = Subject.subjectID \n"
            + "JOIN Major ON Subject.majorID = Major.majorID \n"
            + "WHERE Major.majorName LIKE ?";
    private static final String INSERT = "INSERT INTO Blog(NumberOfVotes) VALUES(?)";
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
                    String image = rs.getString("image");
                    String video = rs.getString("video");
                    int numberOfVotes = rs.getInt("numberOfVotes");
                    int numberOfComments = rs.getInt("numberOfComments");
                    String status = rs.getString("status");
                    listAllBlogs.add(new BlogDTO(blogID, userID, userApproveID, subjectID, title, content,
                            date, image, video, numberOfVotes, numberOfComments, status));
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

    public List<BlogDTO> SearchBySubject(String search) throws SQLException {
        List<BlogDTO> listAllBlogs = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH);
                ptm.setString(1, "%" + search + "%");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int blogID = rs.getInt("blogID");
                    int userID = rs.getInt("userID");
                    int userApproveID = rs.getInt("userApproveID");
                    int subjectID = rs.getInt("subjectID");
                    String title = rs.getString("title");
                    String content = rs.getString("content");
                    String date = rs.getString("date");
                    String image = rs.getString("image");
                    String video = rs.getString("video");
                    int numberOfVotes = rs.getInt("numberOfVotes");
                    int numberOfComments = rs.getInt("numberOfComments");
                    String status = rs.getString("status");
                    listAllBlogs.add(new BlogDTO(blogID, userID, userApproveID, subjectID, title, content,
                            date, image, video, numberOfVotes, numberOfComments, status));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return listAllBlogs;
    }

    public boolean delete(String blogID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(DELETE);
                ptm.setString(1, blogID);
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }
    public boolean insert(BlogDTO blogVote) throws SQLException, ClassNotFoundException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(INSERT);
                ptm.setInt(1, blogVote.getNumberOfVotes());
                
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

}
