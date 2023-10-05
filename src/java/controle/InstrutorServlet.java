/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controle;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Instrutor;

/**
 *
 * @author Suave
 */
@WebServlet(name = "InstrutorServlet", urlPatterns = {"/InstrutorServlet"})
public class InstrutorServlet extends HttpServlet {

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

        String strnome = request.getParameter("nome");
        String strsexo = request.getParameter("sexo");
        String strDtnascimento = request.getParameter("dtnascimento");
        String strEmail = request.getParameter("email");

        String strdddtelefone = request.getParameter("telefone");
        strdddtelefone = strdddtelefone.replace("(", "");
        strdddtelefone = strdddtelefone.replace(")", "");
        strdddtelefone = strdddtelefone.replace(" ", "");
        strdddtelefone = strdddtelefone.replace("-", "");

        String strddd = strdddtelefone.substring(0, 2);
        String strtelefone = strdddtelefone.substring(2);

        String strcpf = request.getParameter("cpf");
        strcpf = strcpf.replace(".", "");
        strcpf = strcpf.replace("-", "");

        if (request.getParameter("cadastrar") != null) {

            Instrutor ins = new Instrutor();

            ins.setNome(strnome);
            ins.setSexo(strsexo);
            ins.setCpf(strcpf);
            ins.setDtnascimento(Date.valueOf(strDtnascimento));
            ins.setEmail(strEmail);
            ins.setDdd(strddd);
            ins.setTelefone(strtelefone);

            boolean cadastrouInstrutor = ins.Cadastrar();
            if (cadastrouInstrutor) {
                response.sendRedirect("listarinstrutor.jsp");
            }
            
                    
        } else if (request.getParameter("apagar") != null) {

            String strIdinstrutor = request.getParameter("apagar");
            Instrutor ins = new Instrutor();
       
            boolean deletou = ins.Deletar(Integer.parseInt(strIdinstrutor));
          
           
            if (deletou) {
                response.sendRedirect("listarinstrutor.jsp");
            } else {
                response.sendRedirect("editarinstrutor.jsp?deletou=false");

            }

            } else if (request.getParameter("editar") != null) {

                Instrutor inss = new Instrutor();

                inss.setNome(request.getParameter("nome"));
                inss.setCpf(request.getParameter("cpf"));
                inss.setDtnascimento(Date.valueOf(request.getParameter("dtnascimento")));
                inss.setEmail(request.getParameter("email"));
                inss.setDdd(request.getParameter("ddd"));
                inss.setTelefone(request.getParameter("telefone")); 
                String strid = request.getParameter("id");
                inss.setId(Integer.parseInt(strid));

                boolean atualizou = inss.Atualizar();
                if (atualizou) {
                    response.sendRedirect("listarinstrutor.jsp");
                } else {

                    request.getRequestDispatcher("editarinstrutor.jsp")
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
        protected void doGet
        (HttpServletRequest request, HttpServletResponse response)
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
        protected void doPost
        (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            processRequest(request, response);
        }

        /**
         * Returns a short description of the servlet.
         *
         * @return a String containing servlet description
         */
        @Override
        public String getServletInfo
        
        
            () {
        return "Short description";
        }// </editor-fold>

    }
    