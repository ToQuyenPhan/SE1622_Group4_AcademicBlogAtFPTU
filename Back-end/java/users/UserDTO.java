/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package users;

/**
 *
 * @author To Quyen Phan
 */
public class UserDTO {
    private int userID;
    private String fullName;
    private int roleID;
    private String email;
    private String gender;
    private String dateOfBirth;
    private String image;
    private boolean status;

    public UserDTO() {
        this.userID = 0;
        this.fullName = "";
        this.roleID = 0;
        this.email = "";
        this.gender = "";
        this.dateOfBirth = "";
        this.image = "";    
        this.status = false;
    }

    public UserDTO(int userID, String fullName, int roleID, String email, String gender, String dateOfBirth, String image,  boolean status) {
        this.userID = userID;
        this.fullName = fullName;
        this.roleID = roleID;
        this.email = email;
        this.gender = gender;
        this.dateOfBirth = dateOfBirth;
        this.image = image;       
        this.status = status;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public int getRoleID() {
        return roleID;
    }

    public void setRoleID(int roleID) {
        this.roleID = roleID;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(String dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image= image;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
}
