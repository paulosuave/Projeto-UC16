<%-- 
    Document   : mapasala
    Created on : 07/12/2021, 22:19:25
    Author     : Suave
--%>

<%@page import="modelo.Sala"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Instrutor"%>
<%@page import="modelo.Curso"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html>
    <head>
        <%@page import="modelo.Sala"%>
        <%@page import="java.util.List"%>
        <%@page import="modelo.Instrutor"%>
        <%@page import="modelo.Curso"%>
        <meta charset="utf-8">

        <title>Cadastro Mapa de Sala</title>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css">
        <link href="css/estilo_index.css" rel="stylesheet" type="text/css">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        
           <!rodapé>   
    <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
    </head>

    <body>
        <!-- Navbar (sit on top) -->
        <div class="w3-top">
            <div class="w3-bar w3-white w3-wide w3-padding w3-card">
                <a href="index.jsp" class="w3-bar-item w3-button"><img  src="Imagens/Senac_logo.png" alt="Architecture" width="85" height="50"></a>
                <!-- Float links to the right. Hide them on small screens -->
                <div class="w3-right w3-hide-small">
                    <br>
                    <a href="quemsomosnos.jsp" class="w3-bar-item w3-button"><img  src="Imagens/botaosobre1.png" alt="Architecture" width="150" height="35"></a>
                    <a href="arearestrita.jsp" class="w3-bar-item w3-button"><img  src="Imagens/botaologin.PNG" alt="Architecture" width="200" height="35"></a>
                </div>
            </div>
        </div>

       
       
        <br>
        <br>
        <br>
        <br>
        <br>
        <div class="container">

            <div class="row">
                <div class="col-md-2"></div>

                <div class="col-md-17">
                    <form action="MapasalaServlet" method="POST" style="background-color:#DCDCDC; padding: 30px; margin: 50px;">
                        <h1>Cadastrar Novo Mapa de Sala</h1>

                        <input type="hidden" name="cadastrar" value="1"/>


                        <label id="lblinstrutor" for="txtinstrutor">Instrutor:</label>
                        <select class="form-control" required id="txtinstrutor" name="idinstrutor">
                            <option value="">Selecione...</option>

                            <%
                                Instrutor ins = new Instrutor();
                                List<Instrutor> instrutores = ins.ListarTodos();

                                for (Instrutor inst : instrutores) {

                                    out.print("<option value='" + inst.getId() + "'>");
                                    out.print(inst.getNome());
                                    out.print("</option>");

                                }
                            %>
                        </select>


                        <br>

                        <label id="lblcurso" for="txtcurso">Curso</label>
                        <select class="form-control" required id="txtcurso" name="idcurso">
                            <option value="">Selecione...</option>
                            <%
                                Curso cs = new Curso();
                                List<Curso> cursos = cs.ListarTodos();

                                for (Curso css : cursos) {

                                    out.print("<option value='" + css.getId() + "'>");
                                    out.print(css.getNome());
                                    out.print("</option>");
                                }
                            %>
                        </select>
                        <br>
                        <div class="form-row">
                            <div class="col">

                                <label id="lblsala" for="txtcursos">Sala</label>
                                <select class="form-control" required id="txtsala" name="idsala">
                                    <option value="">Selecione...</option>
                                    <%
                                        Sala sl = new Sala();
                                        List<Sala> salas = sl.ListarTodos();

                                        for (Sala sls : salas) {

                                            out.print("<option value='" + sls.getId() + "'>");
                                            out.print(sls.getNome());
                                            out.print("</option>");
                                        }
                                    %>
                                </select>
                            </div>
                            <div class="col">

                                <label id="lblturno" for="txtturno">Turno:</label>
                                <select class="form-control" required id="txtturno" name="turno">
                                    <option value="">Selecione...</option>
                                    <option value="M">Matutino</option>
                                    <option value="V">Vespertino</option>
                                    <option value="N">Noturno</option>
                                </select>

                            </div>
                        </div>
                        <br>
                        <div class="form-row">
                            <div class="col">
                                <label id="lbldtinicio" for="txtdtinicio">Data Inicio  </label>
                                <input  required id="txtdtinicio" name="dtinicio" type="date" class="form-control" > 
                            </div>
                            <div class="col">
                                <label id="lbldtfim" for="txtdtfim">Data Fim:  </label>
                                <input  required id="txtdtfim" name="dtfim" type="date" class="form-control" > 
                            </div>
                        </div>
                        <br>

                        <div>
                            <button  type ="submit" id="btnCadastrar" class="btn btn-primary" > Cadastrar</button>
                        </div>
                        <br>
                        </div>
                    </form>
                </div>

                <div class="col-md-3"></div>
            </div>
        </div>
       <br>
    <br>
    <br>
    <br>
    <br>
    <footer id="myFooter">
        <div class="container">
            <div class="row">
                <div class="col-sm-3">
                    <h2 class="logo"><a href="index.jsp"><img  src="Imagens/senac_branco.png" alt="Architecture" width="120" height="120"></a></h2>
                </div>
                <div class="col-sm-2">
                    <h5>Inicio</h5>
                    <ul>
                        <li><a href="index.jsp">Home</a></li>
                        <li><a href="">Cursos</a></li>
                        <li><a href="">Downloads</a></li>
                    </ul>
                </div>
                <div class="col-sm-2">
                    <h5>Sobre-nós</h5>
                    <ul>
                        <li><a href="">Informações da Empresa</a></li>
                        <li><a href="">Contato</a></li>
                        <li><a href="">Blog</a></li>
                    </ul>
                </div>
                <div class="col-sm-2">
                    <h5>Suporte</h5>
                    <ul>
                        <li><a href="">FAQ</a></li>
                        <li><a href="">Telefones</a></li>
                        <li><a href="">Chat</a></li>
                    </ul>
                </div>
                <div class="col-sm-3">
                    <div class="social-networks">
                        <a href="" class="twitter"><i class="fa fa-twitter"></i></a>
                        <a href="" class="facebook"><i class="fa fa-facebook"></i></a>
                        <a href="" class="instagram"><i class="fa fa-instagram"></i></a>
                    </div>
                    <a href="">
                        <button type="button" class="btn btn-default">Contato</button>
                    </a>
                </div>
            </div>
        </div>
        <div class="footer-copyright">
            <p>© 2022 Copyright - Todos direitos reservados &nbsp; &nbsp; Senac  </p>
        </div>
    </footer>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

   
</html>
