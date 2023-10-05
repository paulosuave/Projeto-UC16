package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class inicial_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("<!doctype html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta charset=\"utf-8\">\n");
      out.write("        <title>Inicial</title>\n");
      out.write("        <link href=\"css/bootstrap.css\" rel=\"stylesheet\" type=\"text/css\">\n");
      out.write("        <link href=\"css/estilo_index.css\" rel=\"stylesheet\" type=\"text/css\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://www.w3schools.com/w3css/4/w3.css\"> \n");
      out.write("\n");
      out.write("        <!rodapé>  \n");
      out.write("    <link rel=\"stylesheet\" href=\"http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css\">   \n");
      out.write("\n");
      out.write("\n");
      out.write("    <style type=\"text/css\">\n");
      out.write("\n");
      out.write("        .fundo{\n");
      out.write("            opacity: 0.3;\n");
      out.write("            z-index: -1;\n");
      out.write("            background-color: #CCC;\n");
      out.write("            height: 600px;\n");
      out.write("            width: 800px;\n");
      out.write("            float: left;\n");
      out.write("            position: absolute;\n");
      out.write("            top:120px;\n");
      out.write("            left: 15%;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("\n");
      out.write("    </style>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("</head>\n");
      out.write("\n");
      out.write("<body>\n");
      out.write("\n");
      out.write("    <!-- Navbar (sit on top) -->\n");
      out.write("    <div class=\"w3-top\">\n");
      out.write("        <div class=\"w3-bar w3-white w3-wide w3-padding w3-card\">\n");
      out.write("            <a href=\"index.jsp\" class=\"w3-bar-item w3-button\"><img  src=\"Imagens/Senac_logo.png\" alt=\"Architecture\" width=\"85\" height=\"50\"></a>\n");
      out.write("            <!-- Float links to the right. Hide them on small screens -->\n");
      out.write("            <div class=\"w3-right w3-hide-small\">\n");
      out.write("                <br>\n");
      out.write("                <a href=\"quemsomosnos.jsp\" class=\"w3-bar-item w3-button\"><img  src=\"Imagens/botaosobre1.png\" alt=\"Architecture\" width=\"150\" height=\"35\"></a>\n");
      out.write("                <a href=\"arearestrita.jsp\" class=\"w3-bar-item w3-button\"><img  src=\"Imagens/botaologin.PNG\" alt=\"Architecture\" width=\"200\" height=\"35\"></a>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("    <br>\n");
      out.write("    <br>\n");
      out.write("    <br>\n");
      out.write("    <div class=\"container\">\n");
      out.write("\n");
      out.write("        <div class=\"row\">\n");
      out.write("            <div class=\"col-md-3\"></div>\n");
      out.write("\n");
      out.write("            <div class=\"col-md-9\" style=\"padding: 30px; margin: 50px;\">\n");
      out.write("                <div >\n");
      out.write("                    <div class=\"container\">\n");
      out.write("                        <table class=\"table\">\n");
      out.write("\n");
      out.write("                            <tbody>\n");
      out.write("                                <tr>\n");
      out.write("                                    <th>SALA</th>\n");
      out.write("                                    <th>CURSO</th>\n");
      out.write("                                </tr>\n");
      out.write("                                <tr>\n");
      out.write("                                    <td><a href=\"sala.jsp\"><img  src=\"Imagens/btnCadastrar.png\" alt=\"Architecture\" width=\"200\" height=\"50\"></a></td>\n");
      out.write("                                    <td> <a href=\"curso.jsp\"><img  src=\"Imagens/btnCadastrar.png\" alt=\"Architecture\" width=\"200\" height=\"50\"></a></td>\n");
      out.write("\n");
      out.write("                                <tr>\n");
      out.write("                                    <td> <a href=\"listarsala.jsp\"><img  src=\"Imagens/btnListarEditar.png\" alt=\"Architecture\" width=\"200\" height=\"50\"></a></h1></td>\n");
      out.write("                                    <td> <a href=\"listarcurso.jsp\"><img  src=\"Imagens/btnListarEditar.png\" alt=\"Architecture\" width=\"200\" height=\"50\"></a></h1></td>\n");
      out.write("\n");
      out.write("                            </tbody>\n");
      out.write("                        </table>\n");
      out.write("                    </div>\n");
      out.write("                    <br>\n");
      out.write("                    <br>\n");
      out.write("                    <br>\n");
      out.write("                    <div class=\"container\" >\n");
      out.write("                        <table class=\"table\">\n");
      out.write("                            <tbody>\n");
      out.write("                                <tr>\n");
      out.write("                                    <th>INSTRUTOR</th>\n");
      out.write("                                    <th>MAPA DE SALA</th>\n");
      out.write("                                </tr>\n");
      out.write("                                <tr>\n");
      out.write("                                    <td><a href=\"instrutor.jsp\"><img  src=\"Imagens/btnCadastrar.png\" alt=\"Architecture\" width=\"200\" height=\"50\"></a></td>\n");
      out.write("                                    <td><a href=\"mapasala.jsp\"><img  src=\"Imagens/btnCadastrar.png\" alt=\"Architecture\" width=\"200\" height=\"50\"></a></td>\n");
      out.write("                                </tr>\n");
      out.write("                                <tr>\n");
      out.write("                                    <td><a href=\"listarinstrutor.jsp\"><img  src=\"Imagens/btnListarEditar.png\" alt=\"Architecture\" width=\"200\" height=\"50\"></a></h1></td>\n");
      out.write("                                    <td> <a href=\"listarmapasala.jsp\"><img  src=\"Imagens/btnListarEditar.png\" alt=\"Architecture\" width=\"200\" height=\"50\"></a></h1></td>\n");
      out.write("\n");
      out.write("                                </tr>\n");
      out.write("                                <tr>\n");
      out.write("                                    <td></td>\n");
      out.write("                                    <td><a href=\"listarmapasala.jsp\"><img  src=\"Imagens/btnSalasOcupadas.png\" alt=\"Architecture\" width=\"200\" height=\"50\"></a></h1></td>\n");
      out.write("                                </tr>\n");
      out.write("                            </tbody>\n");
      out.write("                        </table>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>          \n");
      out.write("        </div>\n");
      out.write("    </div>    \n");
      out.write("    <br>\n");
      out.write("    <div class=\"fundo\">\n");
      out.write("    </div>\n");
      out.write("    <br>\n");
      out.write("  \n");
      out.write("    <footer id=\"myFooter\">\n");
      out.write("        <div class=\"container\">\n");
      out.write("            <div class=\"row\">\n");
      out.write("                <div class=\"col-sm-3\">\n");
      out.write("                    <h2 class=\"logo\"><a href=\"index.jsp\"><img  src=\"Imagens/senac_branco.png\" alt=\"Architecture\" width=\"120\" height=\"120\"></a></h2>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"col-sm-2\">\n");
      out.write("                    <h5>Inicio</h5>\n");
      out.write("                    <ul>\n");
      out.write("                        <li><a href=\"index.jsp\">Home</a></li>\n");
      out.write("                        <li><a href=\"\">Cursos</a></li>\n");
      out.write("                        <li><a href=\"\">Downloads</a></li>\n");
      out.write("                    </ul>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"col-sm-2\">\n");
      out.write("                    <h5>Sobre-nós</h5>\n");
      out.write("                    <ul>\n");
      out.write("                        <li><a href=\"\">Informações da Empresa</a></li>\n");
      out.write("                        <li><a href=\"\">Contato</a></li>\n");
      out.write("                        <li><a href=\"\">Blog</a></li>\n");
      out.write("                    </ul>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"col-sm-2\">\n");
      out.write("                    <h5>Suporte</h5>\n");
      out.write("                    <ul>\n");
      out.write("                        <li><a href=\"\">FAQ</a></li>\n");
      out.write("                        <li><a href=\"\">Telefones</a></li>\n");
      out.write("                        <li><a href=\"\">Chat</a></li>\n");
      out.write("                    </ul>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"col-sm-3\">\n");
      out.write("                    <div class=\"social-networks\">\n");
      out.write("                        <a href=\"\" class=\"twitter\"><i class=\"fa fa-twitter\"></i></a>\n");
      out.write("                        <a href=\"\" class=\"facebook\"><i class=\"fa fa-facebook\"></i></a>\n");
      out.write("                        <a href=\"\" class=\"instagram\"><i class=\"fa fa-instagram\"></i></a>\n");
      out.write("                    </div>\n");
      out.write("                    <a href=\"\">\n");
      out.write("                        <button type=\"button\" class=\"btn btn-default\">Contato</button>\n");
      out.write("                    </a>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"footer-copyright\">\n");
      out.write("            <p>© 2022 Copyright - Todos direitos reservados &nbsp; &nbsp; Senac  </p>\n");
      out.write("        </div>\n");
      out.write("    </footer>\n");
      out.write("\n");
      out.write("    <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js\"></script>\n");
      out.write("    <script src=\"http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js\"></script>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("</body>\n");
      out.write("</html>\n");
      out.write("\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
