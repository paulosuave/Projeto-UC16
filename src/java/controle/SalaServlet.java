/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controle;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Sala;

/**
 *
 * @author Suave
 */
@WebServlet(name = "SalaServlet", urlPatterns = {"/SalaServlet"})
public class SalaServlet extends HttpServlet {

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

        if (request.getParameter("cadastrar") != null) {
            
            String strnome = request.getParameter("nome");

            Sala sl = new Sala();

            sl.setNome(strnome);

            boolean cadastrouSala = sl.Cadastrar();
            if (cadastrouSala) {
                response.sendRedirect("listarsala.jsp");
            }
        } else if (request.getParameter("apagar") != null) {

            String strIdSala = request.getParameter("apagar");
            Sala sl = new Sala();

            boolean deletou = sl.Deletar(Integer.parseInt(strIdSala));

            if (deletou) {
                response.sendRedirect("listarsala.jsp");
            } else {
                response.sendRedirect("listarsala.jsp?deletou=false");

            }

        } else if (request.getParameter("editar") != null) {

            Sala sl = new Sala();

            sl.setNome(request.getParameter("nome"));
            String strid = request.getParameter("id");
            sl.setId(Integer.parseInt(strid));

            boolean atualizou = sl.Atualizar();
            if (atualizou) {
                response.sendRedirect("listarsala.jsp");
            } else {

                request.getRequestDispatcher("editarsala.jsp")
                        .forward(request, response);
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
