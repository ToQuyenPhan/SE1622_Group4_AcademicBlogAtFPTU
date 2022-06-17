/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

/**
 *
 * @author DELL
 */
public class ActivityTypeDTO {
    private int activityTypeID;
    private String activity;
    private String activityType;

    public ActivityTypeDTO() {
    }

    public ActivityTypeDTO(int activityTypeID, String activity, String activityType) {
        this.activityTypeID = activityTypeID;
        this.activity = activity;
        this.activityType = activityType;
    }

    public int getActivityTypeID() {
        return activityTypeID;
    }

    public void setActivityTypeID(int activityTypeID) {
        this.activityTypeID = activityTypeID;
    }

    public String getActivity() {
        return activity;
    }

    public void setActivity(String activity) {
        this.activity = activity;
    }

    public String getActivityType() {
        return activityType;
    }

    public void setActivityType(String activityType) {
        this.activityType = activityType;
    }
    
}
