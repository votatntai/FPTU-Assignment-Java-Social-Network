/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import daos.PostDAO;
import entities.Post;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.log4j.Logger;

/**
 *
 * @author Vo Tan Tai
 */
@WebServlet(name = "LikeController", urlPatterns = {"/LikeController"})
public class LikeController extends HttpServlet {

    private static final Logger LOGGER = Logger.getLogger(LikeController.class);

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        try (PrintWriter out = response.getWriter()) {
            JsonObject res = null;
            try {
                String email = request.getParameter("txtEmail");
                int id = Integer.parseInt(request.getParameter("txtPostId"));
                PostDAO dao = new PostDAO();
                if (dao.isExpressed(email, id)) {
                    if (dao.isLiked(email, id)) {
                        dao.updateEmotion(email, id, 0);
                    } else {
                        dao.updateEmotion(email, id, 1);
                    }
                } else {
                    dao.likePost(email, id);
                }
                Post post = dao.getPostById(id);
                if (post != null) {
                    res = new JsonObject();
                    res.addProperty("likes", post.getLike());
                    res.addProperty("dislikes", post.getDislike());
                }
            } catch (Exception e) {
                LOGGER.error("Error at LikeController: " + e.toString());
            } finally {
                out.print(res);
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
