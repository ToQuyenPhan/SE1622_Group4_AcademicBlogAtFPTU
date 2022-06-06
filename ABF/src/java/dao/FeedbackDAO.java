/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.FeedbackTypeDTO;
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
public class FeedbackDAO {
    private static final String GET_ALL_FEEDBACK_TYPE = "SELECT feedbackTypeID, feedbackName from FeedbackType";
    private static final String GIVE_FEEDBACK = "INSERT INTO Feedback(userID, feedbackTypeID, description, date)"
            + " VALUES(?,?,?,?)";

    public List<FeedbackTypeDTO> getAllFeedbackTypes() throws SQLException {
        List<FeedbackTypeDTO> listAllFeedbackTypes = new ArrayList<>();
        Connection conn = null;
        PreparedStatement psm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                psm = conn.prepareStatement(GET_ALL_FEEDBACK_TYPE);
                rs = psm.executeQuery();
                while (rs.next()) {
                    int feedbackTypeID = rs.getInt("feedbackTypeID");
                    String feedbackName = rs.getString("feedbackName");
                    listAllFeedbackTypes.add(new FeedbackTypeDTO(feedbackTypeID, feedbackName));
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
        return listAllFeedbackTypes;
    }    
    
    public boolean giveFeedback(int userID, int feedbackTypeID, String description, String date) throws SQLException, ClassNotFoundException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement psm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                psm = conn.prepareStatement(GIVE_FEEDBACK);
                psm.setInt(1, userID);
                psm.setInt(2, feedbackTypeID);
                psm.setString(3, description);
                psm.setString(4, date);
                check = psm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (psm != null) {
                psm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }
}
