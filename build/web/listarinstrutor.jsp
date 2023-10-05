<%-- 
    Document   : listarinstrutor
    Created on : 12/12/2021, 15:33:08
    Author     : Suave
--%>


<!doctype html>
<%@page import="java.util.List"%>
<%@page import="modelo.Instrutor"%>
<html>
    <head>
        <meta charset="utf-8">
        <title>Listar Instrutor</title>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css">
        <link href="css/estilo_index.css" rel="stylesheet" type="text/css">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

        <!rodapé>   
    <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">




    <%
        Instrutor ins = new Instrutor();
        List<Instrutor> instrutor = ins.ListarTodos();

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
    <div class="container">
        <div class="row">
            <div class="col-md-7"></div>
            <div class="col-md-17">
                <div class="container" style="background-color:#DCDCDC; padding: 30px; margin: 50px;">
                    <h1>Listagem de Instrutores</h1>

                    <br>
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <td>ID</td>
                                <td>Nome</td>                          
                                <td>CPF</td>                          
                                <td>Data Nascimento</th>                          
                                <td>Data Email></td>                          
                                <td>DDD/Telefone</td>
                                <td>Ação</td>
                        </thead>
                        </tr>

                        <%         for (int i = 0; i < instrutor.size(); i++) {

                                out.print("<tbody>");
                                out.print("<tr>");

                                out.print("<td>");
                                out.print(instrutor.get(i).getId());
                                out.print("</td>");

                                out.print("<td>");
                                out.print(instrutor.get(i).getNome());
                                out.print("</td>");

                                out.print("<td>");
                                out.print(instrutor.get(i).getCpf());
                                out.print("</td>");

                                out.print("<td>");
                                out.print(instrutor.get(i).getDtnascimento());
                                out.print("</td>");

                                out.print("<td>");
                                out.print(instrutor.get(i).getEmail());
                                out.print("</td>");

                                out.print("<td>");
                                out.print(instrutor.get(i).getDdd() + instrutor.get(i).getTelefone());
                                out.print("</td>");

                                out.print("<td >");
                                out.print("<form action='editarinstrutor.jsp'>");
                                out.print("<button  name='editar' value='" + instrutor.get(i).getId() + "' type='submit' class='btn btn-primary mb-2'>Editar</button>");
                                out.print("</form>");
                                out.print("</td>");

                                out.print("</tr>");

                                out.print("</tbody>");

                            }
                        %>

                    </table>
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
