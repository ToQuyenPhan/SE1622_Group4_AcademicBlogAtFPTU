/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

/**
 *
 * @author Bat
 */
public class RegistrationDTO {
    private int registrationID;
    private int userID;
    private int subjectID;
    private String date;
    private String certificate;
    private int status;

    public RegistrationDTO() {
    }

    public RegistrationDTO(int registrationID, int userID, int subjectID, String date, String certificate,int status) {
        this.registrationID = registrationID;
        this.userID = userID;
        this.subjectID = subjectID;
        this.date = date;
        this.certificate = certificate;
        this.status = status;
    }

    public int getRegistrationID() {
        return registrationID;
    }

    public void setRegistrationID(int registrationID) {
        this.registrationID = registrationID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public int getSubjectID() {
        return subjectID;
    }

    public void setSubjectID(int subjectID) {
        this.subjectID = subjectID;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getCertificate() {
        return certificate;
    }

    public void setCertificate(String certificate) {
        this.certificate = certificate;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
    
}
