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
    private static final String GET_APPROVE_LIST = "GetApproveList";
    private static final String SORT_APPROVE_LIST = "Sort Blog";
    private static final String VIEW_APPROVE_BLOG_DETAIL = "ViewApproveBlogDetails";
    private static final String DELETE_BLOG = "DeleteBlog";
    private static final String EDIT_BLOG = "EditBlog";
    private static final String EDIT = "Edit";
    private static final String GET_MAJOR_LIST = "GetMajorList";
    private static final String DELETE_MAJOR = "DeleteMajor";
    private static final String GET_SUBJECT_LIST = "GetSubjectList";
    private static final String DELETE_SUBJECT = "DeleteSubject";
    private static final String APPROVE_BLOG = "Approve";
    private static final String REJECT_BLOG = "Reject";
    private static final String CREATE = "Create";

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
    private static final String GET_APPROVE_BLOG_CONTROLLER = "GetApproveBlogListController";
    private static final String APPROVE_BLOG_DETAIL_CONTROLLER = "ApproveBlogDetailController";
    private static final String DELETE_BLOG_CONTROLLER = "DeleteBlogController";
    private static final String GO_TO_EDIT_BLOG_PAGE_CONTROLLER = "GoToEditBlogPageController";
    private static final String EDIT_BLOG_CONTROLLER = "EditBlogController";
    private static final String GET_MAJOR_LIST_CONTROLLER = "GetMajorListController";
    private static final String DELETE_MAJOR_CONTROLLER = "DeleteMajorController";
    private static final String GET_SUBJECT_LIST_CONTROLLER = "GetSubjectListController";
    private static final String DELETE_SUBJECT_CONTROLLER = "DeleteSubjectController";
    private static final String APPROVE_BLOG_CONTROLLER = "ApproveBlogController";
    private static final String REJECT_BLOG_CONTROLLER = "RejectBlogController";
    private static final String CREATE_CONTROLLER = "CreateController";

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
            } else if (GET_APPROVE_LIST.equals(action)) {
                url = GET_APPROVE_BLOG_CONTROLLER;
            } else if (SORT_APPROVE_LIST.equals(action)) {
                url = GET_APPROVE_BLOG_CONTROLLER;
            } else if (DELETE_BLOG.equals(action)) {
                url = DELETE_BLOG_CONTROLLER;
            } else if (EDIT_BLOG.equals(action)) {
                url = GO_TO_EDIT_BLOG_PAGE_CONTROLLER;
            } else if (EDIT.equals(action)) {
                url = EDIT_BLOG_CONTROLLER;
            } else if (GET_MAJOR_LIST.equals(action)) {
                url = GET_MAJOR_LIST_CONTROLLER;
            } else if (DELETE_MAJOR.equals(action)) {
                url = DELETE_MAJOR_CONTROLLER;
            } else if (GET_SUBJECT_LIST.equals(action)) {
                url = GET_SUBJECT_LIST_CONTROLLER;
            } else if (DELETE_SUBJECT.equals(action)) {
                url = DELETE_SUBJECT_CONTROLLER;
            } else if (APPROVE_BLOG.equals(action)) {
                url = APPROVE_BLOG_CONTROLLER;
            } else if (VIEW_APPROVE_BLOG_DETAIL.equals(action)) {
                url = APPROVE_BLOG_DETAIL_CONTROLLER;
            } else if (REJECT_BLOG.equals(action)) {
                url = REJECT_BLOG_CONTROLLER;
            } else if (CREATE.equals(action)) {
                url = CREATE_CONTROLLER;
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
