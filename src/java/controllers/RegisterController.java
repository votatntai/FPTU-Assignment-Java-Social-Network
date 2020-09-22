/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import daos.UserDAO;
import entities.Email;
import entities.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;
import utils.Hash;

/**
 *
 * @author Vo Tan Tai
 */
@WebServlet(name = "RegisterController", urlPatterns = {"/RegisterController"})
public class RegisterController extends HttpServlet {

    private static final Logger LOGGER = Logger.getLogger(RegisterController.class);

    private String host;
    private String port;
    private String user;
    private String pass;

    @Override
    public void init() {
        ServletContext context = getServletContext();
        host = context.getInitParameter("host");
        port = context.getInitParameter("port");
        user = context.getInitParameter("user");
        pass = context.getInitParameter("pass");
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        try (PrintWriter out = response.getWriter()) {
            try {
                String email = request.getParameter("txtEmail");
                String password = request.getParameter("txtPassword");
                String confirm = request.getParameter("txtConfirm");
                String name = request.getParameter("txtName");
                if (password.equals(confirm)) {
                    UserDAO dao = new UserDAO();
                    if (!dao.checkEmailExit(email)) {
                        String subject = "Authentication code for MiniSocialNetwork's account verification";
                        String recipient = request.getParameter("txtEmail");
                        Random rd = new Random();
                        int code = rd.nextInt(1000000);
                        HttpSession session = request.getSession();
                        session.setAttribute("CODE", code);
                        session.setAttribute("EMAIL", email);
                        String content = "Your account verification code is: " + code;
                        try {
                            Email.sendEmail(host, port, user, pass, recipient, subject, content);
                            User user = new User(email, name, Hash.sha256(password));
                            dao.register(user);
                            out.print("Success");
                        } catch (Exception e) {
                            LOGGER.error("Error at SendMail: " + e.toString());
                        }
                    } else {
                        out.print("Duplicate");
                    }   
                } else {
                    out.print("Password does not match");
                }
            } catch (Exception e) {
                LOGGER.error("Error at RegisterController: " + e.toString());
            } finally {
                out.close();
                request.getRequestDispatcher("confirm.jsp").forward(request, response);
            }
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
