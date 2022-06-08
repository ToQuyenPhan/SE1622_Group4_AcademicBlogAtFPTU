/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

/**
 *
 * @author hotan
 */
public class BlogError {
    private int userIDError;
    private int subjectIDError;
    private String titleError;
    private String contentError;
    private String dateError;
    private String imageError;
    private String videoError;

    public BlogError(int userIDError, int subjectIDError, String titleError, String contentError, String dateError, String imageError, String videoError) {
        this.userIDError = userIDError;
        this.subjectIDError = subjectIDError;
        this.titleError = titleError;
        this.contentError = contentError;
        this.dateError = dateError;
        this.imageError = imageError;
        this.videoError = videoError;
    }

    public BlogError() {
        this.userIDError = 0;
        this.subjectIDError = 0;
        this.titleError = "";
        this.contentError = "";
        this.dateError = "";
        this.imageError = "";
        this.videoError = "";
    }

    public int getUserIDError() {
        return userIDError;
    }

    public void setUserIDError(int userIDError) {
        this.userIDError = userIDError;
    }

    public int getSubjectIDError() {
        return subjectIDError;
    }

    public void setSubjectIDError(int subjectIDError) {
        this.subjectIDError = subjectIDError;
    }

    public String getTitleError() {
        return titleError;
    }

    public void setTitleError(String titleError) {
        this.titleError = titleError;
    }

    public String getContentError() {
        return contentError;
    }

    public void setContentError(String contentError) {
        this.contentError = contentError;
    }

    public String getDateError() {
        return dateError;
    }

    public void setDateError(String dateError) {
        this.dateError = dateError;
    }

    public String getImageError() {
        return imageError;
    }

    public void setImageError(String imageError) {
        this.imageError = imageError;
    }

    public String getVideoError() {
        return videoError;
    }

    public void setVideoError(String videoError) {
        this.videoError = videoError;
    }
            
    
}
