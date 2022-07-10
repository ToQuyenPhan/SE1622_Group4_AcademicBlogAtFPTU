/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.RegistrationDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.DBUtils;

/**
 *
 * @author Bat
 */
public class RegistrationDAO {

    private static final String CREATE_REGISTRATION = "INSERT Registration(userID,subjectID,certificate,date,status) VALUES(?,?,?,?,3)";
    private static final String GET_REGITRATION_BY_USERID = "SELECT [registrationID] ,[userID],[subjectID],[certificate],[date],[status]\n"
            + "  FROM [ABF].[dbo].[Registration]\n"
            + "  WHERE [userID] = ?";

    public static boolean createRegistration(int userID, int subjectID, String certificate, String date) throws SQLException, ClassNotFoundException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement psm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                psm = conn.prepareStatement(CREATE_REGISTRATION);
                psm.setInt(1, userID);
                psm.setInt(2, subjectID);
                psm.setString(3, certificate);
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

    public static List<RegistrationDTO> getRegistrationByUserid(int userId) throws SQLException {
        List<RegistrationDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement psm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                psm = conn.prepareStatement(GET_REGITRATION_BY_USERID);
                psm.setInt(1, userId);
                rs = psm.executeQuery();
                while (rs.next()) {
                    int registrationID = rs.getInt("registrationID");
                    int subjectID = rs.getInt("subjectID");
                    String certificate = rs.getString("certificate");
                    String date = rs.getString("date");
                    int status = rs.getInt("status");
                    list.add(new RegistrationDTO(registrationID, userId, subjectID, certificate, date, status));
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
        return list;
    }
}
