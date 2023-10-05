<%-- 
    Document   : mapasalaocupada
    Created on : 15/12/2021, 12:15:03
    Author     : sala303b
--%>
<%@page import="util.BancoDados"%>
<%@page import="java.sql.Connection"%>
<%@page import="modelo.Sala"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Date"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Mapasala"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Connection conn = BancoDados.getConexao();
    int idsala = 1;
    if (request.getParameter("idsala") != null) {
        idsala = Integer.parseInt(request.getParameter("idsala"));
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Salas Ocupadas</title>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css">
        <link href="css/estilo_index.css" rel="stylesheet" type="text/css">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
         <!rodapé>   
    <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">


        <style type="text/css">
            .table-sm th, .table-sm td {
                padding: 0;
            }

        </style>


    </head>
    <body> <!-- Navbar (sit on top) -->
        <<!-- Navbar (sit on top) -->
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
        <div class="container-fluid">

            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <form action="salasocupadas.jsp" method="POST">
                            <div class="col-md-6">
                                <label id="lblsalas" for="txtsalas">Salas:</label>                                 
                            </div>        
                            <div class="row">                                                     
                                <div class="col-md-6">

                                    <select class="form-control" required id="sltSalas" name="idsala">
                                        <option value="">Selecione...</option>

                                        <%
                                            List<Sala> salas = new Sala().ListarTodos();

                                            for (Sala sl : salas) {

                                                out.print("<option value='" + sl.getId() + "'>");
                                                out.print(sl.getNome());
                                                out.print("</option>");

                                            }
                                        %>
                                    </select>
                                </div>
                                <div class="col-md-6"> 
                                    <label>&nbsp;</label>
                                    <button class="btn btn-primary" type="submit" id="btnBuscar"  >Buscar</button> 
                                </div>
                            </div>



                        </form>


                    </div>
                </div>
                <div class="col-md-6"></div>
            </div>





            <div class="row">
                <div class="col-md-3">
                    <table class="table table-bordered table-sm ">
                        <thead>
                            <tr>                       
                                <th  width="5%" scope="col" colspan="4" >JANEIRO</th>            
                            </tr>
                            <tr>

                                <th>Dias</th>
                                <th>MAT</th>
                                <th>VES</th>
                                <th>NOT</th>            
                            </tr>
                        </thead>

                        <tbody>

                            <%
                                int diasdessemes = Mapasala.getQuantidadeDiasByMes(1);

                                for (int i = 1; i <= diasdessemes; i++) {

                                    out.print("<tr>");
                                    out.print("<th scope='col'>" + i + "</th>");

                                    String dtbusca = Mapasala.adicionarDias(2022, 0, i);

                                    List<Mapasala> mapas = Mapasala.BuscarOcupadosPorSalaData(conn, Date.valueOf(dtbusca), idsala);
                                    List<Mapasala> mpsala1 = new ArrayList();

                                    if (mapas == null) {
                                        out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                        out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                        out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                    } else {

                                        for (Mapasala ms : mapas) {
                                            if (ms.getIdsala() == idsala) {
                                                mpsala1.add(ms);
                                            }
                                        }

                                        if (mpsala1.size() == 0) {

                                            out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                            out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                            out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");

                                        } else if (mpsala1.size() == 1) {

                                            if (mpsala1.get(0).getTurno().equals("M")) {
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");

                                            } else if (mpsala1.get(0).getTurno().equals("V")) {
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");

                                            } else if (mpsala1.get(0).getTurno().equals("N")) {
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");

                                            }
                                        } else if (mpsala1.size() == 2) {

                                            if (mpsala1.get(0).getTurno().equals("M") && mpsala1.get(1).getTurno().equals("V")) {
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");//coluna manhã
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");//coluna tarde
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");//coluna noite

                                            } else if (mpsala1.get(1).getTurno().equals("M") && mpsala1.get(0).getTurno().equals("V")) {
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");

                                            } else if (mpsala1.get(0).getTurno().equals("V") && mpsala1.get(1).getTurno().equals("N")) {
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");

                                            } else if (mpsala1.get(0).getTurno().equals("N") && mpsala1.get(1).getTurno().equals("V")) {
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");

                                            } else if (mpsala1.get(0).getTurno().equals("M") && mpsala1.get(1).getTurno().equals("N")) {
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");

                                            } else if (mpsala1.get(0).getTurno().equals("N") && mpsala1.get(1).getTurno().equals("M")) {
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                            }
                                        } else if (mpsala1.size() == 3) {

                                            out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                            out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                            out.print("<td style=\" background-color:red; \" > &nbsp;</td>");

                                        }
                                    }
                                    out.print("</tr>");
                                }

                            %>

                        </tbody>

                    </table>
                </div>






                <div class="col-md-3">

                    <table class="table table-bordered table-sm ">
                        <thead>
                            <tr>                       
                                <th  width="5%" scope="col" colspan="4">FEVEREIRO</th>            
                            </tr>
                        </thead>
                        <thead>
                            <tr>


                                <th>Dias</th>
                                <th>MAT</th>
                                <th>VES</th>
                                <th>NOT</th>            
                            </tr>
                        </thead>

                        <tbody>

                            <%                                int diasdessemes2 = Mapasala.getQuantidadeDiasByMes(2);

                                for (int i = 1; i <= diasdessemes2; i++) {

                                    out.print("<tr>");
                                    out.print("<th scope='col'>" + i + "</th>");

                                    String dtbusca = Mapasala.adicionarDias(2022, 1, i);

                                    List<Mapasala> mapas = Mapasala.BuscarOcupadosPorSalaData(conn, Date.valueOf(dtbusca), idsala);
                                    List<Mapasala> mpsala1 = new ArrayList();

                                    if (mapas == null) {
                                        out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                        out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                        out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                    } else {

                                        for (Mapasala ms : mapas) {
                                            if (ms.getIdsala() == idsala) {
                                                mpsala1.add(ms);
                                            }
                                        }

                                        if (mpsala1.size() == 0) {

                                            out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                            out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                            out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");

                                        } else if (mpsala1.size() == 1) {

                                            if (mpsala1.get(0).getTurno().equals("M")) {
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");

                                            } else if (mpsala1.get(0).getTurno().equals("V")) {
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");

                                            } else if (mpsala1.get(0).getTurno().equals("N")) {
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");

                                            }
                                        } else if (mpsala1.size() == 2) {

                                            if (mpsala1.get(0).getTurno().equals("M") && mpsala1.get(1).getTurno().equals("V")) {
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");//coluna manhã
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");//coluna tarde
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");//coluna noite

                                            } else if (mpsala1.get(1).getTurno().equals("M") && mpsala1.get(0).getTurno().equals("V")) {
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");

                                            } else if (mpsala1.get(0).getTurno().equals("V") && mpsala1.get(1).getTurno().equals("N")) {
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");

                                            } else if (mpsala1.get(0).getTurno().equals("N") && mpsala1.get(1).getTurno().equals("V")) {
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");

                                            } else if (mpsala1.get(0).getTurno().equals("M") && mpsala1.get(1).getTurno().equals("N")) {
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");

                                            } else if (mpsala1.get(0).getTurno().equals("N") && mpsala1.get(1).getTurno().equals("M")) {
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                            }
                                        } else if (mpsala1.size() == 3) {

                                            out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                            out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                            out.print("<td style=\" background-color:red; \" > &nbsp;</td>");

                                        }
                                    }
                                    out.print("</tr>");
                                }

                            %>

                        </tbody>

                    </table>


                </div>



                <div class="col-md-3">
                    <table class="table table-bordered table-sm ">
                        <thead>
                            <tr>                       
                                <th  width="5%" scope="col" colspan="4">MARÇO</th>            
                            </tr>
                        </thead>
                        <thead>
                            <tr>

                                <th>Dias</th>
                                <th>MAT</th>
                                <th>VES</th>
                                <th>NOT</th>            
                            </tr>
                        </thead>

                        <tbody>

                            <%                                int diasdessemes3 = Mapasala.getQuantidadeDiasByMes(3);

                                for (int i = 1; i <= diasdessemes3; i++) {

                                    out.print("<tr>");
                                    out.print("<th scope='col'>" + i + "</th>");

                                    String dtbusca = Mapasala.adicionarDias(2022, 2, i);

                                    List<Mapasala> mapas = Mapasala.BuscarOcupadosPorSalaData(conn, Date.valueOf(dtbusca), idsala);
                                    List<Mapasala> mpsala1 = new ArrayList();

                                    if (mapas == null) {
                                        out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                        out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                        out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                    } else {

                                        for (Mapasala ms : mapas) {
                                            if (ms.getIdsala() == idsala) {
                                                mpsala1.add(ms);
                                            }
                                        }

                                        if (mpsala1.size() == 0) {

                                            out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                            out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                            out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");

                                        } else if (mpsala1.size() == 1) {

                                            if (mpsala1.get(0).getTurno().equals("M")) {
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");

                                            } else if (mpsala1.get(0).getTurno().equals("V")) {
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");

                                            } else if (mpsala1.get(0).getTurno().equals("N")) {
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");

                                            }
                                        } else if (mpsala1.size() == 2) {

                                            if (mpsala1.get(0).getTurno().equals("M") && mpsala1.get(1).getTurno().equals("V")) {
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");//coluna manhã
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");//coluna tarde
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");//coluna noite

                                            } else if (mpsala1.get(1).getTurno().equals("M") && mpsala1.get(0).getTurno().equals("V")) {
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");

                                            } else if (mpsala1.get(0).getTurno().equals("V") && mpsala1.get(1).getTurno().equals("N")) {
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");

                                            } else if (mpsala1.get(0).getTurno().equals("N") && mpsala1.get(1).getTurno().equals("V")) {
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");

                                            } else if (mpsala1.get(0).getTurno().equals("M") && mpsala1.get(1).getTurno().equals("N")) {
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");

                                            } else if (mpsala1.get(0).getTurno().equals("N") && mpsala1.get(1).getTurno().equals("M")) {
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                            }
                                        } else if (mpsala1.size() == 3) {

                                            out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                            out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                            out.print("<td style=\" background-color:red; \" > &nbsp;</td>");

                                        }
                                    }
                                    out.print("</tr>");
                                }

                            %>

                        </tbody>

                    </table>


                </div>

                <div class="col-md-3">
                    <table class="table table-bordered table-sm ">
                        <thead>
                            <tr>                       
                                <th  width="5%" scope="col" colspan="4">ABRIL</th>            
                            </tr>
                        </thead>
                        <thead>
                            <tr>
                                <th>Dias</th>
                                <th>MAT</th>
                                <th>VES</th>
                                <th>NOT</th>                    
                            </tr>
                        </thead>

                        <tbody>

                            <%                                int diasdessemes4 = Mapasala.getQuantidadeDiasByMes(4);

                                for (int i = 1; i <= diasdessemes4; i++) {

                                    out.print("<tr>");
                                    out.print("<th scope='col'>" + i + "</th>");

                                    String dtbusca = Mapasala.adicionarDias(2022, 3, i);

                                    List<Mapasala> mapas = Mapasala.BuscarOcupadosPorSalaData(conn, Date.valueOf(dtbusca), idsala);
                                    List<Mapasala> mpsala1 = new ArrayList();

                                    if (mapas == null) {
                                        out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                        out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                        out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                    } else {

                                        for (Mapasala ms : mapas) {
                                            if (ms.getIdsala() == idsala) {
                                                mpsala1.add(ms);
                                            }
                                        }

                                        if (mpsala1.size() == 0) {

                                            out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                            out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                            out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");

                                        } else if (mpsala1.size() == 1) {

                                            if (mpsala1.get(0).getTurno().equals("M")) {
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");

                                            } else if (mpsala1.get(0).getTurno().equals("V")) {
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");

                                            } else if (mpsala1.get(0).getTurno().equals("N")) {
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");

                                            }
                                        } else if (mpsala1.size() == 2) {

                                            if (mpsala1.get(0).getTurno().equals("M") && mpsala1.get(1).getTurno().equals("V")) {
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");//coluna manhã
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");//coluna tarde
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");//coluna noite

                                            } else if (mpsala1.get(1).getTurno().equals("M") && mpsala1.get(0).getTurno().equals("V")) {
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");

                                            } else if (mpsala1.get(0).getTurno().equals("V") && mpsala1.get(1).getTurno().equals("N")) {
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");

                                            } else if (mpsala1.get(0).getTurno().equals("N") && mpsala1.get(1).getTurno().equals("V")) {
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");

                                            } else if (mpsala1.get(0).getTurno().equals("M") && mpsala1.get(1).getTurno().equals("N")) {
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");

                                            } else if (mpsala1.get(0).getTurno().equals("N") && mpsala1.get(1).getTurno().equals("M")) {
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                            }
                                        } else if (mpsala1.size() == 3) {

                                            out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                            out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                            out.print("<td style=\" background-color:red; \" > &nbsp;</td>");

                                        }
                                    }
                                    out.print("</tr>");
                                }

                            %>

                        </tbody>

                    </table>


                </div>







            </div>







            <div class="row">

                <div class="col-md-3">
                    <table class="table table-bordered table-sm ">
                        <thead>
                            <tr>                       
                                <th  width="5%" scope="col" colspan="4" >MAIO</th>            
                            </tr>
                            <tr>

                                <th>Dias</th>
                                <th>MAT</th>
                                <th>VES</th>
                                <th>NOT</th>            
                            </tr>
                        </thead>

                        <tbody>
                            <%    int diasdessemes5 = Mapasala.getQuantidadeDiasByMes(5);

                                for (int i = 1; i <= diasdessemes5; i++) {

                                    out.print("<tr>");
                                    out.print("<th scope='col'>" + i + "</th>");

                                    String dtbusca = Mapasala.adicionarDias(2022, 4, i);

                                    List<Mapasala> mapas = Mapasala.BuscarOcupadosPorSalaData(conn, Date.valueOf(dtbusca), idsala);
                                    List<Mapasala> mpsala1 = new ArrayList();

                                    if (mapas == null) {
                                        out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                        out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                        out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                    } else {

                                        for (Mapasala ms : mapas) {
                                            if (ms.getIdsala() == idsala) {
                                                mpsala1.add(ms);
                                            }
                                        }

                                        if (mpsala1.size() == 0) {

                                            out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                            out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                            out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");

                                        } else if (mpsala1.size() == 1) {

                                            if (mpsala1.get(0).getTurno().equals("M")) {
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");

                                            } else if (mpsala1.get(0).getTurno().equals("V")) {
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");

                                            } else if (mpsala1.get(0).getTurno().equals("N")) {
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");

                                            }
                                        } else if (mpsala1.size() == 2) {

                                            if (mpsala1.get(0).getTurno().equals("M") && mpsala1.get(1).getTurno().equals("V")) {
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");//coluna manhã
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");//coluna tarde
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");//coluna noite

                                            } else if (mpsala1.get(1).getTurno().equals("M") && mpsala1.get(0).getTurno().equals("V")) {
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");

                                            } else if (mpsala1.get(0).getTurno().equals("V") && mpsala1.get(1).getTurno().equals("N")) {
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");

                                            } else if (mpsala1.get(0).getTurno().equals("N") && mpsala1.get(1).getTurno().equals("V")) {
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");

                                            } else if (mpsala1.get(0).getTurno().equals("M") && mpsala1.get(1).getTurno().equals("N")) {
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");

                                            } else if (mpsala1.get(0).getTurno().equals("N") && mpsala1.get(1).getTurno().equals("M")) {
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                            }
                                        } else if (mpsala1.size() == 3) {

                                            out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                            out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                            out.print("<td style=\" background-color:red; \" > &nbsp;</td>");

                                        }
                                    }
                                    out.print("</tr>");
                                }

                            %>
                        </tbody>

                    </table>

                </div>




                <div class="col-md-3">
                    <table class="table table-bordered table-sm ">
                        <thead>
                            <tr>                       
                                <th  width="5%" scope="col" colspan="4" >JUNHO</th>            
                            </tr>
                            <tr>

                                <th>Dias</th>
                                <th>MAT</th>
                                <th>VES</th>
                                <th>NOT</th>            
                            </tr>
                        </thead>

                        <tbody>
                            <%                                int diasdessemes6 = Mapasala.getQuantidadeDiasByMes(6);

                                for (int i = 1; i <= diasdessemes6; i++) {

                                    out.print("<tr>");
                                    out.print("<th scope='col'>" + i + "</th>");

                                    String dtbusca = Mapasala.adicionarDias(2022, 5, i);

                                    List<Mapasala> mapas = Mapasala.BuscarOcupadosPorSalaData(conn, Date.valueOf(dtbusca), idsala);
                                    List<Mapasala> mpsala1 = new ArrayList();

                                    if (mapas == null) {
                                        out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                        out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                        out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                    } else {

                                        for (Mapasala ms : mapas) {
                                            if (ms.getIdsala() == idsala) {
                                                mpsala1.add(ms);
                                            }
                                        }

                                        if (mpsala1.size() == 0) {

                                            out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                            out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                            out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");

                                        } else if (mpsala1.size() == 1) {

                                            if (mpsala1.get(0).getTurno().equals("M")) {
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");

                                            } else if (mpsala1.get(0).getTurno().equals("V")) {
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");

                                            } else if (mpsala1.get(0).getTurno().equals("N")) {
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");

                                            }
                                        } else if (mpsala1.size() == 2) {

                                            if (mpsala1.get(0).getTurno().equals("M") && mpsala1.get(1).getTurno().equals("V")) {
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");//coluna manhã
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");//coluna tarde
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");//coluna noite

                                            } else if (mpsala1.get(1).getTurno().equals("M") && mpsala1.get(0).getTurno().equals("V")) {
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");

                                            } else if (mpsala1.get(0).getTurno().equals("V") && mpsala1.get(1).getTurno().equals("N")) {
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");

                                            } else if (mpsala1.get(0).getTurno().equals("N") && mpsala1.get(1).getTurno().equals("V")) {
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");

                                            } else if (mpsala1.get(0).getTurno().equals("M") && mpsala1.get(1).getTurno().equals("N")) {
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");

                                            } else if (mpsala1.get(0).getTurno().equals("N") && mpsala1.get(1).getTurno().equals("M")) {
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                            }
                                        } else if (mpsala1.size() == 3) {

                                            out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                            out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                            out.print("<td style=\" background-color:red; \" > &nbsp;</td>");

                                        }
                                    }
                                    out.print("</tr>");
                                }

                            %>
                        </tbody>


                    </table>

                </div>

                <div class="col-md-3">
                    <table class="table table-bordered table-sm ">
                        <thead>
                            <tr>                       
                                <th  width="5%" scope="col" colspan="4" >JULHO</th>            
                            </tr>
                            <tr>

                                <th>Dias</th>
                                <th>MAT</th>
                                <th>VES</th>
                                <th>NOT</th>            
                            </tr>
                        </thead>

                        <tbody>
                            <%     int diasdessemes7 = Mapasala.getQuantidadeDiasByMes(7);

                                for (int i = 1; i <= diasdessemes7; i++) {

                                    out.print("<tr>");
                                    out.print("<th scope='col'>" + i + "</th>");

                                    String dtbusca = Mapasala.adicionarDias(2022, 6, i);

                                    List<Mapasala> mapas = Mapasala.BuscarOcupadosPorSalaData(conn, Date.valueOf(dtbusca), idsala);
                                    List<Mapasala> mpsala1 = new ArrayList();

                                    if (mapas == null) {
                                        out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                        out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                        out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                    } else {

                                        for (Mapasala ms : mapas) {
                                            if (ms.getIdsala() == idsala) {
                                                mpsala1.add(ms);
                                            }
                                        }

                                        if (mpsala1.size() == 0) {

                                            out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                            out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                            out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");

                                        } else if (mpsala1.size() == 1) {

                                            if (mpsala1.get(0).getTurno().equals("M")) {
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");

                                            } else if (mpsala1.get(0).getTurno().equals("V")) {
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");

                                            } else if (mpsala1.get(0).getTurno().equals("N")) {
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");

                                            }
                                        } else if (mpsala1.size() == 2) {

                                            if (mpsala1.get(0).getTurno().equals("M") && mpsala1.get(1).getTurno().equals("V")) {
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");//coluna manhã
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");//coluna tarde
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");//coluna noite

                                            } else if (mpsala1.get(1).getTurno().equals("M") && mpsala1.get(0).getTurno().equals("V")) {
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");

                                            } else if (mpsala1.get(0).getTurno().equals("V") && mpsala1.get(1).getTurno().equals("N")) {
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");

                                            } else if (mpsala1.get(0).getTurno().equals("N") && mpsala1.get(1).getTurno().equals("V")) {
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");

                                            } else if (mpsala1.get(0).getTurno().equals("M") && mpsala1.get(1).getTurno().equals("N")) {
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");

                                            } else if (mpsala1.get(0).getTurno().equals("N") && mpsala1.get(1).getTurno().equals("M")) {
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                            }
                                        } else if (mpsala1.size() == 3) {

                                            out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                            out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                            out.print("<td style=\" background-color:red; \" > &nbsp;</td>");

                                        }
                                    }
                                    out.print("</tr>");
                                }

                            %>
                        </tbody>

                    </table>

                </div>   

                <div class="col-md-3">
                    <table class="table table-bordered table-sm ">
                        <thead>
                            <tr>                       
                                <th  width="5%" scope="col" colspan="4" >AGOSTO</th>            
                            </tr>
                            <tr>

                                <th>Dias</th>
                                <th>MAT</th>
                                <th>VES</th>
                                <th>NOT</th>            
                            </tr>
                        </thead>

                        <tbody>
                            <%     int diasdessemes8 = Mapasala.getQuantidadeDiasByMes(8);

                                for (int i = 1; i <= diasdessemes8; i++) {

                                    out.print("<tr>");
                                    out.print("<th scope='col'>" + i + "</th>");

                                    String dtbusca = Mapasala.adicionarDias(2022, 7, i);

                                    List<Mapasala> mapas = Mapasala.BuscarOcupadosPorSalaData(conn, Date.valueOf(dtbusca), idsala);
                                    List<Mapasala> mpsala1 = new ArrayList();

                                    if (mapas == null) {
                                        out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                        out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                        out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                    } else {

                                        for (Mapasala ms : mapas) {
                                            if (ms.getIdsala() == idsala) {
                                                mpsala1.add(ms);
                                            }
                                        }

                                        if (mpsala1.size() == 0) {

                                            out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                            out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                            out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");

                                        } else if (mpsala1.size() == 1) {

                                            if (mpsala1.get(0).getTurno().equals("M")) {
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");

                                            } else if (mpsala1.get(0).getTurno().equals("V")) {
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");

                                            } else if (mpsala1.get(0).getTurno().equals("N")) {
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");

                                            }
                                        } else if (mpsala1.size() == 2) {

                                            if (mpsala1.get(0).getTurno().equals("M") && mpsala1.get(1).getTurno().equals("V")) {
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");//coluna manhã
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");//coluna tarde
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");//coluna noite

                                            } else if (mpsala1.get(1).getTurno().equals("M") && mpsala1.get(0).getTurno().equals("V")) {
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");

                                            } else if (mpsala1.get(0).getTurno().equals("V") && mpsala1.get(1).getTurno().equals("N")) {
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");

                                            } else if (mpsala1.get(0).getTurno().equals("N") && mpsala1.get(1).getTurno().equals("V")) {
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");

                                            } else if (mpsala1.get(0).getTurno().equals("M") && mpsala1.get(1).getTurno().equals("N")) {
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");

                                            } else if (mpsala1.get(0).getTurno().equals("N") && mpsala1.get(1).getTurno().equals("M")) {
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                            }
                                        } else if (mpsala1.size() == 3) {

                                            out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                            out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                            out.print("<td style=\" background-color:red; \" > &nbsp;</td>");

                                        }
                                    }
                                    out.print("</tr>");
                                }

                            %>
                        </tbody>

                    </table>

                </div>         


            </div>

            <div class="row">

                <div class="col-md-3">
                    <table class="table table-bordered table-sm ">
                        <thead>
                            <tr>                       
                                <th  width="5%" scope="col" colspan="4" >SETEMBRO</th>            
                            </tr>
                            <tr>

                                <th>Dias</th>
                                <th>MAT</th>
                                <th>VES</th>
                                <th>NOT</th>            
                            </tr>
                        </thead>

                        <tbody>
                            <%     int diasdessemes9 = Mapasala.getQuantidadeDiasByMes(9);

                                for (int i = 1; i <= diasdessemes9; i++) {

                                    out.print("<tr>");
                                    out.print("<th scope='col'>" + i + "</th>");

                                    String dtbusca = Mapasala.adicionarDias(2022, 8, i);

                                    List<Mapasala> mapas = Mapasala.BuscarOcupadosPorSalaData(conn, Date.valueOf(dtbusca), idsala);
                                    List<Mapasala> mpsala1 = new ArrayList();

                                    if (mapas == null) {
                                        out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                        out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                        out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                    } else {

                                        for (Mapasala ms : mapas) {
                                            if (ms.getIdsala() == idsala) {
                                                mpsala1.add(ms);
                                            }
                                        }

                                        if (mpsala1.size() == 0) {

                                            out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                            out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                            out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");

                                        } else if (mpsala1.size() == 1) {

                                            if (mpsala1.get(0).getTurno().equals("M")) {
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");

                                            } else if (mpsala1.get(0).getTurno().equals("V")) {
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");

                                            } else if (mpsala1.get(0).getTurno().equals("N")) {
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");

                                            }
                                        } else if (mpsala1.size() == 2) {

                                            if (mpsala1.get(0).getTurno().equals("M") && mpsala1.get(1).getTurno().equals("V")) {
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");//coluna manhã
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");//coluna tarde
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");//coluna noite

                                            } else if (mpsala1.get(1).getTurno().equals("M") && mpsala1.get(0).getTurno().equals("V")) {
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");

                                            } else if (mpsala1.get(0).getTurno().equals("V") && mpsala1.get(1).getTurno().equals("N")) {
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");

                                            } else if (mpsala1.get(0).getTurno().equals("N") && mpsala1.get(1).getTurno().equals("V")) {
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");

                                            } else if (mpsala1.get(0).getTurno().equals("M") && mpsala1.get(1).getTurno().equals("N")) {
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");

                                            } else if (mpsala1.get(0).getTurno().equals("N") && mpsala1.get(1).getTurno().equals("M")) {
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                            }
                                        } else if (mpsala1.size() == 3) {

                                            out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                            out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                            out.print("<td style=\" background-color:red; \" > &nbsp;</td>");

                                        }
                                    }
                                    out.print("</tr>");
                                }

                            %>
                        </tbody>

                    </table>

                </div>  

                <div class="col-md-3">
                    <table class="table table-bordered table-sm ">
                        <thead>
                            <tr>                       
                                <th  width="5%" scope="col" colspan="4" >OUTUBRO</th>            
                            </tr>
                            <tr>

                                <th>Dias</th>
                                <th>MAT</th>
                                <th>VES</th>
                                <th>NOT</th>            
                            </tr>
                        </thead>

                        <tbody>
                            <%     int diasdessemes10 = Mapasala.getQuantidadeDiasByMes(10);

                                for (int i = 1; i <= diasdessemes10; i++) {

                                    out.print("<tr>");
                                    out.print("<th scope='col'>" + i + "</th>");

                                    String dtbusca = Mapasala.adicionarDias(2022, 9, i);

                                    List<Mapasala> mapas = Mapasala.BuscarOcupadosPorSalaData(conn, Date.valueOf(dtbusca), idsala);
                                    List<Mapasala> mpsala1 = new ArrayList();

                                    if (mapas == null) {
                                        out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                        out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                        out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                    } else {

                                        for (Mapasala ms : mapas) {
                                            if (ms.getIdsala() == idsala) {
                                                mpsala1.add(ms);
                                            }
                                        }

                                        if (mpsala1.size() == 0) {

                                            out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                            out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                            out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");

                                        } else if (mpsala1.size() == 1) {

                                            if (mpsala1.get(0).getTurno().equals("M")) {
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");

                                            } else if (mpsala1.get(0).getTurno().equals("V")) {
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");

                                            } else if (mpsala1.get(0).getTurno().equals("N")) {
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");

                                            }
                                        } else if (mpsala1.size() == 2) {

                                            if (mpsala1.get(0).getTurno().equals("M") && mpsala1.get(1).getTurno().equals("V")) {
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");//coluna manhã
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");//coluna tarde
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");//coluna noite

                                            } else if (mpsala1.get(1).getTurno().equals("M") && mpsala1.get(0).getTurno().equals("V")) {
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");

                                            } else if (mpsala1.get(0).getTurno().equals("V") && mpsala1.get(1).getTurno().equals("N")) {
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");

                                            } else if (mpsala1.get(0).getTurno().equals("N") && mpsala1.get(1).getTurno().equals("V")) {
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");

                                            } else if (mpsala1.get(0).getTurno().equals("M") && mpsala1.get(1).getTurno().equals("N")) {
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");

                                            } else if (mpsala1.get(0).getTurno().equals("N") && mpsala1.get(1).getTurno().equals("M")) {
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                            }
                                        } else if (mpsala1.size() == 3) {

                                            out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                            out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                            out.print("<td style=\" background-color:red; \" > &nbsp;</td>");

                                        }
                                    }
                                    out.print("</tr>");
                                }

                            %>


                        </tbody>

                    </table>

                </div>   

                <div class="col-md-3">
                    <table class="table table-bordered table-sm ">
                        <thead>
                            <tr>                       
                                <th  width="5%" scope="col" colspan="4" >NOVEMBRO</th>            
                            </tr>
                            <tr>

                                <th>Dias</th>
                                <th>MAT</th>
                                <th>VES</th>
                                <th>NOT</th>            
                            </tr>
                        </thead>

                        <tbody>
                            <%     int diasdessemes11 = Mapasala.getQuantidadeDiasByMes(11);

                                for (int i = 1; i <= diasdessemes11; i++) {

                                    out.print("<tr>");
                                    out.print("<th scope='col'>" + i + "</th>");

                                    String dtbusca = Mapasala.adicionarDias(2022, 10, i);

                                    List<Mapasala> mapas = Mapasala.BuscarOcupadosPorSalaData(conn, Date.valueOf(dtbusca), idsala);
                                    List<Mapasala> mpsala1 = new ArrayList();

                                    if (mapas == null) {
                                        out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                        out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                        out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                    } else {

                                        for (Mapasala ms : mapas) {
                                            if (ms.getIdsala() == idsala) {
                                                mpsala1.add(ms);
                                            }
                                        }

                                        if (mpsala1.size() == 0) {

                                            out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                            out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                            out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");

                                        } else if (mpsala1.size() == 1) {

                                            if (mpsala1.get(0).getTurno().equals("M")) {
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");

                                            } else if (mpsala1.get(0).getTurno().equals("V")) {
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");

                                            } else if (mpsala1.get(0).getTurno().equals("N")) {
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");

                                            }
                                        } else if (mpsala1.size() == 2) {

                                            if (mpsala1.get(0).getTurno().equals("M") && mpsala1.get(1).getTurno().equals("V")) {
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");//coluna manhã
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");//coluna tarde
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");//coluna noite

                                            } else if (mpsala1.get(1).getTurno().equals("M") && mpsala1.get(0).getTurno().equals("V")) {
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");

                                            } else if (mpsala1.get(0).getTurno().equals("V") && mpsala1.get(1).getTurno().equals("N")) {
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");

                                            } else if (mpsala1.get(0).getTurno().equals("N") && mpsala1.get(1).getTurno().equals("V")) {
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");

                                            } else if (mpsala1.get(0).getTurno().equals("M") && mpsala1.get(1).getTurno().equals("N")) {
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");

                                            } else if (mpsala1.get(0).getTurno().equals("N") && mpsala1.get(1).getTurno().equals("M")) {
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                            }
                                        } else if (mpsala1.size() == 3) {

                                            out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                            out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                            out.print("<td style=\" background-color:red; \" > &nbsp;</td>");

                                        }
                                    }
                                    out.print("</tr>");
                                }

                            %>
                        </tbody>

                    </table>

                </div>   

                <div class="col-md-3">
                    <table class="table table-bordered table-sm ">
                        <thead>
                            <tr>                       
                                <th  width="5%" scope="col" colspan="4" >DEZEMBRO</th>            
                            </tr>
                            <tr>

                                <th>Dias</th>
                                <th>MAT</th>
                                <th>VES</th>
                                <th>NOT</th>            
                            </tr>
                        </thead>

                        <tbody>
                            <%     int diasdessemes12 = Mapasala.getQuantidadeDiasByMes(12);

                                for (int i = 1; i <= diasdessemes12; i++) {

                                    out.print("<tr>");
                                    out.print("<th scope='col'>" + i + "</th>");

                                    String dtbusca = Mapasala.adicionarDias(2022, 11, i);

                                    List<Mapasala> mapas = Mapasala.BuscarOcupadosPorSalaData(conn, Date.valueOf(dtbusca), idsala);
                                    List<Mapasala> mpsala1 = new ArrayList();

                                    if (mapas == null) {
                                        out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                        out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                        out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                    } else {

                                        for (Mapasala ms : mapas) {
                                            if (ms.getIdsala() == idsala) {
                                                mpsala1.add(ms);
                                            }
                                        }

                                        if (mpsala1.size() == 0) {

                                            out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                            out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                            out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");

                                        } else if (mpsala1.size() == 1) {

                                            if (mpsala1.get(0).getTurno().equals("M")) {
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");

                                            } else if (mpsala1.get(0).getTurno().equals("V")) {
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");

                                            } else if (mpsala1.get(0).getTurno().equals("N")) {
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");

                                            }
                                        } else if (mpsala1.size() == 2) {

                                            if (mpsala1.get(0).getTurno().equals("M") && mpsala1.get(1).getTurno().equals("V")) {
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");//coluna manhã
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");//coluna tarde
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");//coluna noite

                                            } else if (mpsala1.get(1).getTurno().equals("M") && mpsala1.get(0).getTurno().equals("V")) {
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");

                                            } else if (mpsala1.get(0).getTurno().equals("V") && mpsala1.get(1).getTurno().equals("N")) {
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");

                                            } else if (mpsala1.get(0).getTurno().equals("N") && mpsala1.get(1).getTurno().equals("V")) {
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");

                                            } else if (mpsala1.get(0).getTurno().equals("M") && mpsala1.get(1).getTurno().equals("N")) {
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");

                                            } else if (mpsala1.get(0).getTurno().equals("N") && mpsala1.get(1).getTurno().equals("M")) {
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:blue; \" > &nbsp;</td>");
                                                out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                            }
                                        } else if (mpsala1.size() == 3) {

                                            out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                            out.print("<td style=\" background-color:red; \" > &nbsp;</td>");
                                            out.print("<td style=\" background-color:red; \" > &nbsp;</td>");

                                        }
                                    }
                                    out.print("</tr>");
                                }

                            %>
                        </tbody>

                    </table>

                </div>         
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
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.js"></script>
    <script type="text/javascript">




    </script>

</body>
</html>
