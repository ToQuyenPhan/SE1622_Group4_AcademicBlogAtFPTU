/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.CommentDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import utils.DBUtils;

/**
 *
 * @author To Quyen Phan
 */
public class CommentDAO {
   private static final String INSERT = "Insert into Comment(blogID,userID,content,date,status) values(?,?,?,?,1)";
   
    private static final String GET_COMMENT_BY_BLOGID = "";
    public static CommentDTO getCommentbyBlogID(int blogID) throws ClassNotFoundException, SQLException{
        CommentDTO cm = null;
        Connection cn= DBUtils.getConnection();
        if(cn != null){
            PreparedStatement pn = cn.prepareStatement(GET_COMMENT_BY_BLOGID);
            pn.setInt(1, blogID);
            ResultSet rs = pn.executeQuery();
            if (rs != null && rs.next()) {
                int commentID = rs.getInt("commentID");
                int userID = rs.getInt("userID");
                String content = rs.getString("content");
                String date = rs.getString("date");
                String status = rs.getString("status");
                cm = new CommentDTO(blogID,commentID, userID, content, date, status);
            }
            cn.close();
        }
        return cm;
    }
    public static int insertComment(int blogID, int userID, String content,String date) throws ClassNotFoundException, SQLException {
        int result = 0;
        Connection cn = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                PreparedStatement pst = cn.prepareStatement(INSERT);
                pst.setInt(1, blogID);
                pst.setInt(2, userID);
                pst.setString(3, content);
                pst.setString(4, date);
                result = pst.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        } finally {
            if (cn != null) {
                cn.close();
            }
        }
        return result;
    } 
}
