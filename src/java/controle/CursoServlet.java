/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controle;

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Curso;

/**
 *
 * @author Suave
 */
@WebServlet(name = "CursoServlet", urlPatterns = {"/CursoServlet"})
public class CursoServlet extends HttpServlet {

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

        String strnome = request.getParameter("nome");
        String strhoras = request.getParameter("horas");

        if (request.getParameter("cadastrar") != null) {

            Curso cs = new Curso();

            cs.setNome(strnome);
            cs.setHoras(strhoras);

            boolean cadastrouCurso = cs.Cadastrar();
            if (cadastrouCurso) {

                response.sendRedirect("listarcurso.jsp");
            }

        } else if (request.getParameter("apagar") != null) {

            String strIdCurso = request.getParameter("apagar");
            Curso sl = new Curso();

            boolean deletou = sl.Deletar(Integer.parseInt(strIdCurso));

            if (deletou) {
                response.sendRedirect("listarcurso.jsp");
            } else {
                response.sendRedirect("listarcurso.jsp?deletou=false");

            }

        } else if (request.getParameter("editar") != null) {

            Curso cs = new Curso();

            cs.setNome(request.getParameter("nome"));
            cs.setHoras(request.getParameter("horas"));
            String strid = request.getParameter("id");
            cs.setId(Integer.parseInt(strid));

            boolean atualizou = cs.Atualizar();
            if (atualizou) {
                response.sendRedirect("listarcurso.jsp?sucesso=" + cs.getId());
            }

        } else {

            request.getRequestDispatcher("editarcurso.jsp")
                    .forward(request, response);
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
