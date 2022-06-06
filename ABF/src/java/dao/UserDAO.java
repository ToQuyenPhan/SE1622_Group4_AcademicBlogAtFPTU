/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import dto.UserDTO;
import utils.DBUtils;

/**
 *
 * @author To Quyen Phan
 */
public class UserDAO {
    private static final String FIND_USER = "SELECT userID, password, fullName, roleID, gender, dateOfBirth, image, status"
            + " FROM [User] WHERE email like ?";
    private static final String LOGIN = "SELECT userID, fullName, roleID, gender, dateOfBirth, image, status"
            + " FROM [User] WHERE email like ? AND password like ?";
    private static final String CREATE_USER = "INSERT INTO [User](password, fullName, roleID, email, gender, dateOfBirth, image, status)"
            + " VALUES(?,?,1,?,null,null,null,1)";
    private static final String CHECK_ROLE = "SELECT roleName FROM Role WHERE roleID = ?";
    
    public UserDTO checkLogin(String email, String password) throws SQLException {
        UserDTO user = null;
        Connection conn = null;
        PreparedStatement psm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                psm = conn.prepareStatement(LOGIN);
                psm.setString(1, email);
                psm.setString(2, password);
                rs = psm.executeQuery();
                if (rs.next()) {
                    int userID = rs.getInt("userID");
                    String fullName = rs.getString("fullName");
                    int roleID = rs.getInt("roleID");
                    String gender = rs.getString("gender");
                    String dateOfBirth = rs.getString("dateOfBirth");
                    String image = rs.getString("image");
                    boolean status = rs.getBoolean("status");
                    user = new UserDTO(userID, password, fullName, roleID, email, gender, dateOfBirth, image, status);
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
        return user;
    }
    
    public UserDTO checkLoginByEmail(String email) throws SQLException {
        UserDTO user = null;
        Connection conn = null;
        PreparedStatement psm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                psm = conn.prepareStatement(FIND_USER);
                psm.setString(1, email);
                rs = psm.executeQuery();
                if (rs.next()) {
                    int userID = rs.getInt("userID");
                    String password = rs.getString("password");
                    String fullName = rs.getString("fullName");
                    int roleID = rs.getInt("roleID");
                    String gender = rs.getString("gender");
                    String dateOfBirth = rs.getString("dateOfBirth");
                    String image = rs.getString("image");
                    boolean status = rs.getBoolean("status");
                    user = new UserDTO(userID, password, fullName, roleID, email, gender, dateOfBirth, image, status);
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
        return user;
    }
    
    public String checkRole(int roleID) throws SQLException {
        String roleName = null;
        Connection conn = null;
        PreparedStatement psm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                psm = conn.prepareStatement(CHECK_ROLE);
                psm.setInt(1, roleID);
                rs = psm.executeQuery();
                if (rs.next()) {
                    roleName = rs.getString("roleName");
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
        return roleName;
    }
    
    public boolean createUser(String fullName, String email) throws SQLException, ClassNotFoundException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement psm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                psm = conn.prepareStatement(CREATE_USER);
                psm.setString(1, "");
                psm.setString(2, fullName);
                psm.setString(3, email);
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
