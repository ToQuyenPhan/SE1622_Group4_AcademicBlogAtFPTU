/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.MajorDTO;
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
public class MajorDAO {
    private static final String GET_ALL_MAJORS = "SELECT majorID, majorName, status FROM Major WHERE status = 1";
     private static final String DELETE_MAJOR = "UPDATE Major SET status = 0 WHERE majorID = ?";
     private static final String SEARCH_MAJORS_BY_NAME = "SELECT majorID, majorName, status FROM Major WHERE majorName LIKE ? AND status = 1";
     
    public List<MajorDTO> getAllMajors() throws SQLException {
        List<MajorDTO> listAllMajors = new ArrayList<>();
        Connection conn = null;
        PreparedStatement psm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                psm = conn.prepareStatement(GET_ALL_MAJORS);
                rs = psm.executeQuery();
                while (rs.next()) {
                    int majorID = rs.getInt("majorID");
                    String majorName = rs.getString("majorName");
                    String status = rs.getString("status");
                    listAllMajors.add(new MajorDTO(majorID, majorName, status));
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
        return listAllMajors;
    }
    
    public boolean deleteMajor(int majorID) throws SQLException{
        boolean check = false;
        Connection conn = null;
        PreparedStatement psm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                psm = conn.prepareStatement(DELETE_MAJOR);
                psm.setInt(1, majorID);
                check = psm.executeUpdate() > 0 ? true : false;
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
        return check;
    }
    
    public List<MajorDTO> searchMajorByName(String searchName) throws SQLException {
        List<MajorDTO> listAllMajors = new ArrayList<>();
        Connection conn = null;
        PreparedStatement psm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                psm = conn.prepareStatement(SEARCH_MAJORS_BY_NAME);
                psm.setString(1, "%" +searchName+ "%");
                rs = psm.executeQuery();
                while (rs.next()) {
                    int majorID = rs.getInt("majorID");
                    String majorName = rs.getString("majorName");
                    String status = rs.getString("status");
                    listAllMajors.add(new MajorDTO(majorID, majorName, status));
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
        return listAllMajors;
    }
}
