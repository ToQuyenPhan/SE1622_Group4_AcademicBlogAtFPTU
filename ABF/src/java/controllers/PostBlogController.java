/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import dao.BlogDAO;
import dao.UserDAO;
import dto.BlogDTO;
import dto.BlogError;
import dto.UserDTO;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author To Quyen Phan
 */
@WebServlet(name = "PostBlogController", urlPatterns = {"/PostBlogController"})
public class PostBlogController extends HttpServlet {

    private static final String ERROR = "postblog.jsp";
    private static final String SUCCESS = "MainController?action=GetList";

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
        BlogError blogError = new BlogError();
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
        Date dateFormat = new Date();
        try {
            int userID = Integer.parseInt(request.getParameter("userID"));
            int subjectID = Integer.parseInt(request.getParameter("subjectID"));
            String title = request.getParameter("title").trim();
            String content = request.getParameter("content").trim();
            String date = sdf.format(dateFormat);
            String image = "image/"+request.getParameter("image");
            boolean checkValidation = true;
            BlogDAO dao = new BlogDAO();
            if (title.length() < 10 || title.length() > 100) {
                blogError.setTitleError("Title must be in [10,100]!");
                checkValidation = false;
            }
            if (content.length() < 50) {
                blogError.setContentError("Content must be greater than 50!");
                checkValidation = false;
            }
            if (checkValidation) {
                boolean check = dao.postBlog(userID, subjectID, title, content, date, image);
                if (check) {
                    response.sendRedirect("MainController?action=GetList&noti=success");
                }
            } else {
                request.setAttribute("BLOG_ERROR", blogError);
                request.setAttribute("TITLE", title);
                request.setAttribute("CONTENT", content);
                request.getRequestDispatcher(ERROR).forward(request, response);
            }

        } catch (Exception e) {
            log("Error at Post Blog Controller: " + e.toString());

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
