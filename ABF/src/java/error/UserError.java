/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package error;

/**
 *
 * @author ASUS
 */
public class UserError {
    private String fullNameError;
    private String emailError;
    private String passwordError;
    private String confirmError;

    public UserError() {
        this.fullNameError = "";
        this.emailError = "";
        this.passwordError = "";
        this.confirmError = "";
    }

    public UserError(String fullNameError, String emailError, String passwordError, String confirmError) {
        this.fullNameError = fullNameError;
        this.emailError = emailError;
        this.passwordError = passwordError;
        this.confirmError = confirmError;
    }

    public String getFullNameError() {
        return fullNameError;
    }

    public void setFullNameError(String fullNameError) {
        this.fullNameError = fullNameError;
    }

    public String getEmailError() {
        return emailError;
    }

    public void setEmailError(String emailError) {
        this.emailError = emailError;
    }

    public String getPasswordError() {
        return passwordError;
    }

    public void setPasswordError(String passwordError) {
        this.passwordError = passwordError;
    }

    public String getConfirmError() {
        return confirmError;
    }

    public void setConfirmError(String confirmError) {
        this.confirmError = confirmError;
    }
    
    
    
}
