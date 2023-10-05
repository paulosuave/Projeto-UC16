/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controle;

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Instrutor;
import modelo.Mapasala;

/**
 *
 * @author Suave
 */
@WebServlet(name = "MapasalaServlet", urlPatterns = {"/MapasalaServlet"})
public class MapasalaServlet extends HttpServlet {

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

        String stridinstrutor = request.getParameter("idinstrutor");
        String stridcurso = request.getParameter("idcurso");
        String stridsala = request.getParameter("idsala");
        String strturno = request.getParameter("turno"); //M=Matutino, V=Vespertino, N=Noturno
        String strdtinicio = request.getParameter("dtinicio");
        String strdtfim = request.getParameter("dtfim");

        if (request.getParameter("cadastrar") != null) {

            Mapasala mps = new Mapasala();

            mps.setIdinstrutor(Integer.parseInt(stridinstrutor));
            mps.setIdcurso(Integer.parseInt(stridcurso));
            mps.setIdsala(Integer.parseInt(stridsala));
            mps.setTurno(strturno);
            mps.setDatainicio(Date.valueOf(strdtinicio));
            mps.setDatafim(Date.valueOf(strdtfim));

            //se o instrutor no turno selecionado estiver atuando em algum curso ele está indisponível.
            boolean impedido = mps.estaIndisponivelist(mps.getIdinstrutor(), strturno, mps.getDatainicio());
            boolean impedido2 = mps.estaIndisponivelsala(mps.getIdinstrutor(), strturno, mps.getDatainicio());

            if (impedido || impedido2) {
                response.sendRedirect("mapasala.jsp");
            } else {
                boolean cadastrouMapasala = mps.Cadastrar();

                if (cadastrouMapasala) {

                    response.sendRedirect("inicial.jsp");

                } else {
                    response.sendRedirect("mapasala.jsp");
                }
            }
        } else if (request.getParameter("apagar") != null) {

            String strIdCurso = request.getParameter("apagar");
            Mapasala mp = new Mapasala();

            boolean deletou = mp.Deletar(Integer.parseInt(strIdCurso));

            if (deletou) {
                response.sendRedirect("listarmapasala.jsp");
            } else {
                response.sendRedirect("editarmapasala.jsp?deletou=false");

            }

        } else if (request.getParameter("editar") != null) {

            Mapasala mps = new Mapasala();

            mps.setIdinstrutor(Integer.parseInt(stridinstrutor));
            mps.setIdcurso(Integer.parseInt(stridcurso));
            mps.setIdsala(Integer.parseInt(stridsala));
            mps.setTurno(strturno);
            mps.setDatainicio(Date.valueOf(strdtinicio));
            mps.setDatafim(Date.valueOf(strdtfim));
            String strid = request.getParameter("id");
            mps.setId(Integer.parseInt(strid));

            boolean atualizou = mps.Atualizar();
            if (atualizou) {
                response.sendRedirect("listarmapasala.jsp");
            } else {

                request.getRequestDispatcher("editarmapasala.jsp")
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
