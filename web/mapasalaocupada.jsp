<%-- 
    Document   : mapasalaocupada
    Created on : 15/12/2021, 12:15:03
    Author     : sala303b
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Date"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Mapasala"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mapeamento de Salas Ocupadas</title>

        <link href="css/bootstrap.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <br>
        <br>
        <br>
        <br>
        <table class="table table-sm">
            <thead>
                <tr>
                    <th scope="col">Dias</th>
                    <th scope="col">1</th>
                    <th scope="col">2</th>
                    <th scope="col">3</th>
                    <th scope="col">4</th>
                    <th scope="col">5</th>
                    <th scope="col">6</th>
                    <th scope="col">7</th>
                    <th scope="col">8</th>
                    <th scope="col">9</th>
                    <th scope="col">10</th>
                    <th scope="col">11</th>
                    <th scope="col">12</th>
                    <th scope="col">13</th>
                    <th scope="col">14</th>
                    <th scope="col">15</th>
                    <th scope="col">16</th>
                    <th scope="col">17</th>
                    <th scope="col">18</th>
                    <th scope="col">19</th>
                    <th scope="col">20</th>
                    <th scope="col">21</th>
                    <th scope="col">21</th>
                    <th scope="col">22</th>
                    <th scope="col">23</th>
                    <th scope="col">24</th>
                    <th scope="col">25</th>
                    <th scope="col">26</th>
                    <th scope="col">27</th>
                    <th scope="col">28</th>
                    <th scope="col">29</th>
                    <th scope="col">30</th>
                    <th scope="col">31</th>
                    <th  colspan ="2">Janeiro</th>

                </tr>
            </thead>
            <tbody>
                <tr>
                    <td scope="row">Manhã</td>
                    <td scope="row">Tarde</td>
                    <td scope="row">Noite</td>
                    <td><%

                        Mapasala mpsl = new Mapasala();
                        List<Mapasala> mapas = mpsl.BuscarSalasOcupadasPorData(Date.valueOf("2021-01-01"));
                        List<Mapasala> mpsala1 = new ArrayList();

                        for (Mapasala ms : mapas) {
                            if (ms.getIdsala() == 1) {
                                mpsala1.add(ms);
                            }
                        }

                        if (mpsala1.size() == 0) {

                            out.print("<p style=\"width:15px; height:15px; background-color:blue; \" > &nbsp;</p>");
                            out.print("<p style=\"width:15px; height:15px; background-color:blue; \" > &nbsp;</p>");
                            out.print("<p style=\"width:15px; height:15px; background-color:blue; \" > &nbsp;</p>");

                        } else if (mpsala1.size() == 1) {

                            if (mpsala1.get(0).getTurno().equals("M")) {
                                out.print("<p style=\"width:15px; height:15px; background-color:red; \" > &nbsp;</p>");
                                out.print("<p style=\"width:15px; height:15px; background-color:blue; \" > &nbsp;</p>");
                                out.print("<p style=\"width:15px; height:15px; background-color:blue; \" > &nbsp;</p>");

                            } else if (mpsala1.get(0).getTurno().equals("V")) {
                                out.print("<p style=\"width:15px; height:15px; background-color:blue; \" > &nbsp;</p>");
                                out.print("<p style=\"width:15px; height:15px; background-color:red; \" > &nbsp;</p>");
                                out.print("<p style=\"width:15px; height:15px; background-color:blue; \" > &nbsp;</p>");

                            } else if (mpsala1.get(0).getTurno().equals("N")) {
                                out.print("<p style=\"width:15px; height:15px; background-color:blue; \" > &nbsp;</p>");
                                out.print("<p style=\"width:15px; height:15px; background-color:blue; \" > &nbsp;</p>");
                                out.print("<p style=\"width:15px; height:15px; background-color:red; \" > &nbsp;</p>");

                            }

                        } else if (mpsala1.size() == 2) {

                        } else if (mpsala1.size() == 3) {

                        }


                        %></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td scope="row">Tarde</th>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>

                </tr>
                <tr>
                    <td scope="row">Noite</th>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
            </tbody>
            <thead>
                <tr>
                    <th scope="col">Dias</th>
                    <th scope="col">1</th>
                    <th scope="col">2</th>
                    <th scope="col">3</th>
                    <th scope="col">4</th>
                    <th scope="col">5</th>
                    <th scope="col">6</th>
                    <th scope="col">7</th>
                    <th scope="col">8</th>
                    <th scope="col">9</th>
                    <th scope="col">10</th>
                    <th scope="col">11</th>
                    <th scope="col">12</th>
                    <th scope="col">13</th>
                    <th scope="col">14</th>
                    <th scope="col">15</th>
                    <th scope="col">16</th>
                    <th scope="col">17</th>
                    <th scope="col">18</th>
                    <th scope="col">19</th>
                    <th scope="col">20</th>
                    <th scope="col">21</th>
                    <th scope="col">21</th>
                    <th scope="col">22</th>
                    <th scope="col">23</th>
                    <th scope="col">24</th>
                    <th scope="col">25</th>
                    <th scope="col">26</th>
                    <th scope="col">27</th>
                    <th scope="col">28</th>
                    <th scope="col">29</th>
                    <th scope="col">30</th>
                    <th scope="col">31</th>
                </tr>
            </thead>
        </table>
    </body>
</html>
