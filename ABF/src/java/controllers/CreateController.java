/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import dao.UserDAO;
import dto.UserDTO;
import error.UserError;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "CreateController", urlPatterns = {"/CreateController"})
public class CreateController extends HttpServlet {

    private static final String ERROR = "signup.jsp";
    private static final String SUCCESS = "signup.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        UserError userError = new UserError();
        try {

            String fullName = request.getParameter("fullName");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String confirm = request.getParameter("confirm");
            UserDAO dao = new UserDAO();

            boolean checkValidation = true;
            boolean checkDuplicate = dao.checkDuplicate(email);

            if (checkDuplicate) {
                checkValidation = false;
                userError.setEmailError("Email already exists!!");
            }
            if (!email.contains("@fpt.edu.vn")) {
                checkValidation = false;
                userError.setEmailError("Please register to FPT University's email address");
            }
            if (fullName.length() < 3 || fullName.length() > 20) {
                checkValidation = false;
                userError.setFullNameError("Full Name must be in [3,20]");
            }
            if (!password.equals(confirm)) {
                checkValidation = false;
                userError.setConfirmError("Password not confirmed");
            }
            if (checkValidation) {
                boolean checkCreate = dao.createAccount(fullName, email, password);
                if (checkCreate) {
                    request.setAttribute("MESSAGE", "Create Successfully!!");
                    url = SUCCESS;
                }
            } else {
                request.setAttribute("USER_ERROR", userError);
            }

        } catch (Exception e) {
            log("Error at CreateController: " + e.toString());
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
