<%-- 
    Document   : editarinstrutor
    Created on : 13/12/2021, 23:25:37
    Author     : Suave
--%>

<%@page import="modelo.Instrutor"%>

<%
    Instrutor ins = new Instrutor();
    if (request.getParameter("editar") != null) {
        int id = Integer.parseInt(request.getParameter("editar"));
        ins = ins.PesquisarPorId(id);
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Editar Instrutor</title>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css">
        <link href="css/estilo_index.css" rel="stylesheet" type="text/css">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

        <!rodapé>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/Footer-with-button-logo.css">
</head>
<body>
    <br>
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
            <div class="col-md-2"></div>

            <div class="col-md-8">
        <form action="InstrutorServlet" method="POST" style="background-color:#DCDCDC; padding: 30px; margin: 50px; ">
             <h1>Editar Instrutor</h1>
            <input type="hidden" name="editar" value="1">

            <div class="form-row">
                <div class="form-group col-md-2">
                    <label label id="lblid" for="txtid">ID</label>
                    <input  readonly="readonly" class="form-control" name="id" value="<% out.print(ins.getId());%>" id="txtid" type="text" size="10"/> 
                </div>
                <div class="form-group col-md-10">
                    <label id="lblnome" for="txnome">Nome</label>
                    <input  class="form-control" name="nome" value="<% out.print(ins.getNome());%>" id="txtinstrutor" type="text"/>
                </div>
            </div>
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label label id="lblcpf" for="txtcpf">Cpf</label>
                    <input class="form-control" name="cpf" value="<% out.print(ins.getCpf());%>" id="txtcpf" type="text" size="10"/> 
                </div>
                <div class="form-group col-md-6">
                    <label label id="lbldtnascimento" for="txtdtnascimento">Data Nascimento</label>
                    <input class="form-control" name="dtnascimento" value="<% out.print(ins.getDtnascimento());%>" id="txtdtnascimento" type="date" /> 
                </div>

                <br>

            </div>

            <div class="form-row">
                <div class="form-group col-md-6">
                    <label label id="lblemail" for="txtdtinicio">Email</label>
                    <input class="form-control" name="email" value="<% out.print(ins.getEmail());%>" id="txtemail" type="text" /> 
                </div>
                <div class="form-group col-md-2">
                    <label id="lblddd" for="txtddd">DDD</label>
                    <input  class="form-control" name="ddd" value="<% out.print(ins.getDdd());%>" id="txtddd" type="text"/>
                </div>
                <div class="form-group col-md-4">
                    <label id="lbltelefone" for="txttelefone">Telefone</label>
                    <input  class="form-control" name="telefone" value="<% out.print(ins.getTelefone());%>" id="txttelefone" type="text"/>
                </div>
            </div>
            <div>
                <button  type ="submit" id="btnEditar" class="btn btn-primary"> Editar</button>
            </div>
            <br>
            <br>
            <br>
            </div>
        </form>
            </div>
            <div class="col-md-2"></div>
        </div>
     </div>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <div class="content">
        </div>
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

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>
