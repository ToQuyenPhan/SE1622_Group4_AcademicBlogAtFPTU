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
import java.util.ArrayList;
import utils.DBUtils;

/**
 *
 * @author To Quyen Phan
 */
public class SubjectDAO {
    private static final String GET_SUBJECT = "SELECT subjectID, subjectName,majorID,status FROM Subject";
    
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
}
