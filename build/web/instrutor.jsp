<%-- 
    Document   : instrutor
    Created on : 14/11/2021, 17:56:06
    Author     : Suave
--%>

<!doctype html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Cadatrar Instrutor</title>
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
    <div class="container">

        <div class="row">
            <div class="col-md-3"></div>

            <div class="col-md-10">
                <form action="InstrutorServlet" method="POST" style="background-color:#DCDCDC; padding: 30px; margin: 50px;">
                    <h1>Cadastrar Novo Instrutor</h1>
                    <input type="hidden" name="cadastrar"  />

                    <div class="form-group">
                        <label  for="txtnome">Nome</label>
                        <input  required type="text" name="nome" class="form-control" id="formGroupExampleInput" 
                                placeholder="Insira o nome">
                    </div>
                    <br>
                    <label id="lblsexo" for="txtsexo"><em>Sexo:&nbsp;&nbsp;&nbsp;</em></label>
                    <div class="custom-control custom-radio custom-control-inline">
                        <input type="radio" id="rbdm" name="sexo" class="custom-control-input" value="M">
                        <label class="custom-control-label" for="rbdm">Masculino</label>
                    </div>

                    <div class="custom-control custom-radio custom-control-inline">
                        <input type="radio" id="rbdf" name="sexo" class="custom-control-input" value="F">
                        <label class="custom-control-label" for="rbdf">Feminino</label>
                    </div>
                    <div class="custom-control custom-radio custom-control-inline">
                        <input type="radio" id="rbdo" name="sexo" class="custom-control-input" value="o">
                        <label class="custom-control-label" for="rbdo">Outros</label>
                    </div>	
                    <br>
                    <br>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label id="lbldtnascimento" for="txtdtnascimento">Data Nascimento</label>
                            <input class="form-control"  required id="txdtnascimento" name="dtnascimento" type="date">
                            <br>
                            <br>
                        </div>
                        <div class="form-group col-md-6">
                            <label id="lblcpf" for="txtcf">CPF</label>
                            <input  class="form-control" required id="txtcpf" name="cpf" type="text" placeholder="Insira o CPF">
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label id="lblemail" for="txtemail">Email</label>
                            <input type="email" class="form-control" required  id="txtemail" name="email"  placeholder="Insira o Email">
                        </div>
                        <div class="form-group col-md-6">
                            <label id="lbltelefone" for="txtelefone">Telefone</label>
                            <input class="form-control" required  id="txttelefone" name="telefone" type="text" placeholder="Insira o telefone">
                        </div>
                    </div>
                    <div>
                        <button  type ="submit" id="btnCadastrar" class="btn btn-primary" > Cadastrar</button>
                    </div>
                    <br>
                    <br>
                    </div>
                </form>
            </div>

            <div class="col-md-2"></div>
        </div>

        <script  src="https://code.jquery.com/jquery-3.6.0.js"  integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="  crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.11.2/jquery.mask.js"></script>

        <script type="text/javascript">

            jQuery(document).ready(function ($) {

                $("#txttelefone").mask("(00) 00000-0000");
                $("#txtcpf").mask("000.000.000-00");


            });



        </script>



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

