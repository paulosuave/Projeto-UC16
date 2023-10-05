<%-- 
    Document   : listarmapasala
    Created on : 13/12/2021, 10:05:42
    Author     : sala303b
--%>
<!doctype html>

<%@page import="java.util.List"%>
<%@page import="modelo.Mapasala"%>


<html>
    <head>
        <meta charset="utf-8">
        <title>Listar Mapa de Salas</title>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css">
        <link href="css/estilo_index.css" rel="stylesheet" type="text/css">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

        <!rodapé>   
    <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">


    <%
        Mapasala mps = new Mapasala();
        List<Mapasala> mapasalas = mps.ListarTodos();

    %>
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
    <br>
    <br>
    <br>
    <br>
    <br>
    <div class="container">

        <div class="row">
            <div class="col-md-3"></div>

            <div class="col-md-17">
                <div class="container" style="background-color:#DCDCDC; padding: 30px; margin: 50px;">
                    <h1>Listagem de Mapa de Sala</h1>

                    <br>
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <td>ID&nbsp;</td>
                                <td>Instrutor</td>
                                <td>Curso</td>
                                <td>Sala></td>
                                <td>Turno</td>
                                <td>Data Inicio</td>
                                <td>Data Final</td>

                                <td>Ação</td>

                            </tr>
                        </thead>
                        <%                for (Mapasala map : mapasalas) {

                                out.print("<tbody>");
                                out.print("<tr>");
                                out.print("<td>");
                                out.print(map.getId());
                                out.print("</td>");

                                out.print("<td>");
                                out.print(map.getNomeInstrutorPorID(map.getIdinstrutor()));
                                out.print("</td>");

                                out.print("<td>");
                                out.print(map.getNomeCursoPorID(map.getIdcurso()));
                                out.print("</td>");

                                out.print("<td>");
                                out.print(map.getNomeSalaPorID(map.getIdsala()));
                                out.print("</td>");

                                out.print("<td>");
                                out.print(map.getTurno());
                                out.print("</td>");

                                out.print("<td>");
                                out.print(map.getDatainicio());
                                out.print("</td>");

                                out.print("<td>");
                                out.print(map.getDatafim());
                                out.print("</td>");

                                out.print("<td >");
                                out.print("<form action='editarmapasala.jsp'>");
                                out.print("<button  name='editar' value='" + map.getId() + "' type='submit' class='btn btn-primary mb-2'>Editar</button>");
                                out.print("</form>");
                                out.print("</td>");
                                out.print("<td>");
                                out.print("<form action = 'MapasalaServlet' >");
                                out.print("<button name='apagar'  value='" + map.getId() + "' type='submit' class='btn btn-primary mb-2'>Apagar</button>");
                                out.print("</form>");
                                out.print("</td>");

                                out.print("</tr>");
                                out.print("</tbody>");

                            }
                        %>

                    </table>
                    <hr color="white">
                    <br>
                    <br>

                </div>
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