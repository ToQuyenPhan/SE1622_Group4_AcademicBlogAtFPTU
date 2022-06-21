/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author To Quyen Phan
 */
@WebServlet(name = "MainController", urlPatterns = {"/MainController"})
public class MainController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String LOGIN = "Login";
    private static final String LOGIN_WITH_GOOGLE = "LoginWithGoogle";
    private static final String GETLIST = "GetList";
    private static final String GETFEEDBACKTYPELIST = "GetFeedbackTypeList";
    private static final String SEND = "Send";
    private static final String SEARCH = "Search";
    private static final String SORT_BY_DATE = "Sort";
    private static final String VIEW_BLOG_DETAIL = "ViewBlogDetails";
    private static final String POST = "Post";
    private static final String UPLOAD = "Upload";
    private static final String COMMENT = "Comment";
    private static final String GET_ACTIVITY_LIST = "GetActivityList";
    private static final String DELETE_ACTIVITY = "DeleteActivity";
    private static final String VOTE = "Vote";
    private static final String DELETE_BLOG = "DeleteBlog";
    private static final String PERSONAL_SEARCH = "PersonalSearch";
    private static final String GET_PERSONAL_LIST = "GetPersonalList";
    private static final String SEARCH_ACTIVITY_BY_NAME = "SearchActivityByName";
    private static final String SAVE_DRAFT_BLOG = "SaveDraftBlog";
    private static final String GET_PERSONAL_DRAFT_LIST = "GetPersonalDraftList";
    private static final String SEARCH_DRAFT_BLOG = "SearchDraftBlog";

    private static final String LOGIN_WITH_GOOGLE_CONTROLLER = "LoginWithGoogleController";
    private static final String LOGIN_CONTROLLER = "LoginController";
    private static final String GET_LIST_CONTROLLER = "GetListController";
    private static final String GET_FEEDBACK_TYPE_LIST_CONTROLLER = "GetFeedbackTypeListController";
    private static final String SEND_FEEDBACK_CONTROLLER = "SendFeedbackController";
    private static final String SEARCH_CONTROLLER = "SearchController";
    private static final String SORT_BY_DATE_PAGE = "MainController?action=GetList";
    private static final String BLOG_DETAIL_CONTROLLER = "BlogDetailController";
    private static final String POST_BLOG_CONTROLLER = "PostBlogController";
    private static final String UPLOAD_FILE_CONTROLLER = "UploadFileController";
    private static final String COMMENT_CONTROLLER = "CommentController";
    private static final String GET_ACTIVITY_LIST_CONTROLLER = "GetActivityListController";
    private static final String DELETE_ACTIVITY_CONTROLLER = "DeleteActivityController";
    private static final String VOTE_CONTROLLER = "VoteController";
    private static final String DELETE_BLOG_CONTROLLER = "DeleteBlogController";
    private static final String PERSONAL_SEARCH_CONTROLLER = "PersonalSearchController";
    private static final String GET_PERSONAL_LIST_CONTROLLER = "GetPersonalListController";
    private static final String SEARCH_ACTIVITY_BY_NAME_CONTROLLER = "SearchActivitiesByNameController";
    private static final String SAVE_DRAFT_BLOG_CONTROLLER = "SaveDraftBlogController";
    private static final String GET_PERSONAL_DRAFT_LIST_CONTROLLER = "GetPersonalDraftListController";
    private static final String SEARCH_DRAFT_BLOG_CONTROLLER = "SearchDraftBlogController";

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String action = request.getParameter("action");
            if (LOGIN_WITH_GOOGLE.equals(action)) {
                url = LOGIN_WITH_GOOGLE_CONTROLLER;
            } else if (LOGIN.equals(action)) {
                url = LOGIN_CONTROLLER;
            } else if (GETLIST.equals(action)) {
                url = GET_LIST_CONTROLLER;
            } else if (GETFEEDBACKTYPELIST.equals(action)) {
                url = GET_FEEDBACK_TYPE_LIST_CONTROLLER;
            } else if (SEND.equals(action)) {
                url = SEND_FEEDBACK_CONTROLLER;
            } else if (SEARCH.equals(action)) {
                url = SEARCH_CONTROLLER;
            } else if (SORT_BY_DATE.equals(action)) {
                url = SORT_BY_DATE_PAGE;
            } else if (VIEW_BLOG_DETAIL.equals(action)) {
                url = BLOG_DETAIL_CONTROLLER;
            } else if (POST.equals(action)) {
                url = POST_BLOG_CONTROLLER;
            } else if (UPLOAD.equals(action)) {
                url = UPLOAD_FILE_CONTROLLER;
            } else if (COMMENT.equals(action)) {
                url = COMMENT_CONTROLLER;
            } else if (GET_ACTIVITY_LIST.equals(action)) {
                url = GET_ACTIVITY_LIST_CONTROLLER;
            } else if (DELETE_ACTIVITY.equals(action)) {
                url = DELETE_ACTIVITY_CONTROLLER;
            } else if (VOTE.equals(action)) {
                url = VOTE_CONTROLLER;
            } else if (DELETE_BLOG.equals(action)) {
                url = DELETE_BLOG_CONTROLLER;
            } else if (PERSONAL_SEARCH.equals(action)) {
                url = PERSONAL_SEARCH_CONTROLLER;
            } else if (GET_PERSONAL_LIST.equals(action)) {
                url = GET_PERSONAL_LIST_CONTROLLER;
            } else if (SEARCH_ACTIVITY_BY_NAME.equals(action)) {
                url = SEARCH_ACTIVITY_BY_NAME_CONTROLLER;
            } else if (SAVE_DRAFT_BLOG.equals(action)) {
                url = SAVE_DRAFT_BLOG_CONTROLLER;
            } else if (GET_PERSONAL_DRAFT_LIST.equals(action)) {
                url = GET_PERSONAL_DRAFT_LIST_CONTROLLER;
            } else if (SEARCH_DRAFT_BLOG.equals(action)) {
                url = SEARCH_DRAFT_BLOG_CONTROLLER;
            } else {
                request.setAttribute("ERROR_MESSAGE", "Function is not available!");
            }
        } catch (Exception e) {
            log("Error at Main Controller: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
