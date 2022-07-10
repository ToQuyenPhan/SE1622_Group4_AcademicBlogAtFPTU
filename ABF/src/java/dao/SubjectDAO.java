/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.SubjectDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import utils.DBUtils;

/**
 *
 * @author To Quyen Phan
 */
public class SubjectDAO {
    private static final String GET_SUBJECT = "SELECT subjectID, subjectName,majorID,status FROM Subject WHERE status = 1";
    private static final String DELETE_SUBJECT = "UPDATE Subject SET status = 0 WHERE subjectID = ?";
    private static final String EDIT_SUBJECT = "SET subjectName = ?,\n"
            + "majorID = ?\n"
            + "WHERE subjectID = ?";
    
    public static ArrayList<SubjectDTO> getSubject(){
        ArrayList<SubjectDTO> list = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                PreparedStatement pst = cn.prepareStatement(GET_SUBJECT);
                ResultSet rs = pst.executeQuery();
                while (rs != null && rs.next()) {
                    int subjectID = rs.getInt("subjectID");
                    String subjectName = rs.getString("subjectName");
                    int majorID = rs.getInt("majorID");
                    String status = rs.getString("status");
                    SubjectDTO c= new SubjectDTO(subjectID,majorID, subjectName,status);
                    list.add(c);
                }}
            } catch (Exception e) {
        }
        return list;   
        }
    
    public int editSubject(int subjectID, int majorID, String subjectName) throws SQLException, ClassNotFoundException {
        int check = 0;
        Connection conn = null;
        PreparedStatement psm = null;
        conn = DBUtils.getConnection();
        if (conn != null) {
            psm = conn.prepareStatement(EDIT_SUBJECT);
            psm.setString(1, subjectName);
            psm.setInt(2, majorID);
            psm.setInt(3, subjectID);
            check = psm.executeUpdate();
        }
        conn.close();
        return check;
    }
    
    public boolean deleteSubject(int subjectID) throws SQLException{
        boolean check = false;
        Connection conn = null;
        PreparedStatement psm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                psm = conn.prepareStatement(DELETE_SUBJECT);
                psm.setInt(1, subjectID);
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
}
