/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package loginwithgoogle;

/**
 *
 * @author To Quyen Phan
 */
public class Contants {
    //Các thông tin lấy được khi tạo 1 project trên google API
    public static String GOOGLE_CLIENT_ID = "454266315319-skcdadndavf804t478jc0igbfc9si76m.apps.googleusercontent.com";
    public static String GOOGLE_CLIENT_SECRET = "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";
    public static String GOOGLE_REDIRECT_URI = "http://localhost:8080/ABF/MainController?action=LoginWithGoogle";
    public static String GOOGLE_LINK_GET_TOKEN = "https://accounts.google.com/o/oauth2/token";
    public static String GOOGLE_LINK_GET_USER_INFO = "https://www.googleapis.com/oauth2/v1/userinfo?access_token=";
    public static String GOOGLE_GRANT_TYPE = "authorization_code";
    public static final String SITE_KEY = "6LcXX7ceAAAAAPYPH8EzPWO1rZl946Sj6Qgu7xZT";
    public static final String SECRET_KEY = "6LcXX7ceAAAAABoTaXiHACifu5VQIDuPzmsBC4Sh";
}
