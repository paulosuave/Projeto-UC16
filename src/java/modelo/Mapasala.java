/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;
import util.BancoDados;

/**
 *
 * @author Suave
 */
public class Mapasala {

    /**
     * @return the turno
     */
    public String getTurno() {
        return turno;
    }

    /**
     * @param turno the turno to set
     */
    public void setTurno(String turno) {
        this.turno = turno;
    }

    /**
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * @return the idinstrutor
     */
    public int getIdinstrutor() {
        return idinstrutor;
    }

    /**
     * @param idinstrutor the idinstrutor to set
     */
    public void setIdinstrutor(int idinstrutor) {
        this.idinstrutor = idinstrutor;
    }

    /**
     * @return the idcurso
     */
    public int getIdcurso() {
        return idcurso;
    }

    /**
     * @param idcurso the idcurso to set
     */
    public void setIdcurso(int idcurso) {
        this.idcurso = idcurso;
    }

    /**
     * @return the idsala
     */
    public int getIdsala() {
        return idsala;
    }

    /**
     * @param idsala the idsala to set
     */
    public void setIdsala(int idsala) {
        this.idsala = idsala;
    }

    /**
     * @return the datainicio
     */
    public Date getDatainicio() {
        return datainicio;
    }

    /**
     * @param datainicio the datainicio to set
     */
    public void setDatainicio(Date datainicio) {
        this.datainicio = datainicio;
    }

    /**
     * @return the datafim
     */
    public Date getDatafim() {
        return datafim;
    }

    /**
     * @param datafim the datafim to set
     */
    public void setDatafim(Date datafim) {
        this.datafim = datafim;
    }
    private int id;
    private int idinstrutor;
    private int idcurso;
    private int idsala;
    private String turno;
    private Date datainicio;
    private Date datafim;

    public boolean Cadastrar() {
        try {
            Connection conn = BancoDados.getConexao();
            String sql = "INSERT INTO `bdmapasala`.`mapasala`"
                    + "(`id`,`idinstrutor`,`idcurso`,`idsala`,`turno`,`datainicio`,`datafim`)"
                    + "VALUES (?,?,?,?,?,?,?);";
            PreparedStatement ps = conn.prepareStatement(sql,
                    Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, this.getId());
            ps.setInt(2, this.getIdinstrutor());
            ps.setInt(3, this.getIdcurso());
            ps.setInt(4, this.getIdsala());
            ps.setString(5, this.getTurno());
            ps.setDate(6, this.getDatainicio());
            ps.setDate(7, this.getDatafim());

            int linhasafetadas = ps.executeUpdate();
            if (linhasafetadas > 0) {
                ResultSet rs = ps.getGeneratedKeys();
                if (rs.next()) {
                    int lastId = rs.getInt(1);
                    //insere o id registrado no banco no objeto
                    this.setId(lastId);

                    return true;
                } else {
                    return false;
                }
            } else {
                return false;
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return false;
        }
    }

    public List<Mapasala> ListarTodos() {
        try {
            Connection conn = BancoDados.getConexao();
            String sql = "SELECT * FROM mapasala; ";
            PreparedStatement ps = conn.prepareStatement(sql);

            List<Mapasala> mapasala = new ArrayList();

            final ResultSet rs = ps.executeQuery();
            while (rs.next()) {

                Mapasala mps = new Mapasala();
                mps.setId(rs.getInt("id"));
                mps.setIdinstrutor(rs.getInt("idinstrutor"));
                mps.setIdcurso(rs.getInt("idcurso"));
                mps.setIdsala(rs.getInt("idsala"));
                mps.setTurno(rs.getString("turno"));
                mps.setDatainicio(rs.getDate("datainicio"));
                mps.setDatafim(rs.getDate("datafim"));
                mapasala.add(mps);
            }
            return mapasala;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return null;
        }
    }

    public boolean Atualizar() {
        try {
            Connection conn = BancoDados.getConexao();
            String sql = "UPDATE mapasala "
                    + "SET "
                    + " idinstrutor = ?, "
                    + " idcurso = ? ,"
                    + " idsala = ? ,"
                    + " turno = ? ,"
                    + " datainicio = ? ,"
                    + " datafim = ? "
                    + "WHERE id = ? ;";

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, this.getIdinstrutor());
            ps.setInt(2, this.getIdcurso());
            ps.setInt(3, this.getIdsala());
            ps.setString(4, this.getTurno());
            ps.setDate(5, this.getDatainicio());
            ps.setDate(6, this.getDatafim());
            ps.setInt(7, this.getId());

            int qtd = ps.executeUpdate();

            if (qtd > 0) {
                return true;
            } else {
                return false;
            }

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            return false;
        }
    }

    public boolean estaIndisponivelist(int idinstrutor, String turno, Date dtInicio) {

        try {
            Connection conn = BancoDados.getConexao();
            String sql = "SELECT * FROM bdmapasala.mapasala "
                    + "WHERE idinstrutor = ? AND turno = ? AND datainicio >= ? ";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, idinstrutor);
            ps.setString(2, turno);
            ps.setDate(3, dtInicio);

            boolean indisponivel = false;

            final ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                indisponivel = true;
                return indisponivel;

            } else {
                return indisponivel;
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return false;
        }

    }

    public boolean estaIndisponivelsala(int idsala, String turno, Date dtInicio) {

        try {
            Connection conn = BancoDados.getConexao();
            String sql = "SELECT * FROM bdmapasala.mapasala "
                    + "WHERE idsala = ? AND turno = ? AND datainicio >= ? ";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, idsala);
            ps.setString(2, turno);
            ps.setDate(3, dtInicio);

            boolean indisponivel = false;

            final ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                indisponivel = true;
                return indisponivel;

            } else {
                return indisponivel;
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return false;
        }

    }

    public Mapasala PesquisarPorID(int id) {
        try {
            Connection conn = BancoDados.getConexao();
            String sql = "Select * from mapasala where id = ?; ";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            final ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Mapasala mps = new Mapasala();
                mps.setId(rs.getInt("id"));
                mps.setIdinstrutor(rs.getInt("idinstrutor"));
                mps.setIdcurso(rs.getInt("idcurso"));
                mps.setIdsala(rs.getInt("idsala"));
                mps.setTurno(rs.getString("turno"));
                mps.setDatainicio(rs.getDate("datainicio"));
                mps.setDatafim(rs.getDate("datafim"));
                return mps;
            } else {
                return null;
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return null;
        }
    }

    public String getNomeInstrutorPorID(int id) {
        try {
            Connection conn = BancoDados.getConexao();
            String sql = "Select nome from instrutor where id = ?; ";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            final ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                String nomeinstrutor = rs.getString("nome");
                return nomeinstrutor;
            } else {
                return "";
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return "";
        }
    }

    public String getNomeCursoPorID(int id) {
        try {
            Connection conn = BancoDados.getConexao();
            String sql = "Select nome from curso where id = ?; ";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            final ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                String nomecurso = rs.getString("nome");
                return nomecurso;
            } else {
                return "";
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return "";
        }
    }

    public String getNomeSalaPorID(int id) {
        try {
            Connection conn = BancoDados.getConexao();
            String sql = "Select nome from sala where id = ?; ";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            final ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                String nomesala = rs.getString("nome");
                return nomesala;
            } else {
                return "";
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return "";
        }
    }

    public boolean Deletar(int id) {
        try {
            Connection conn = BancoDados.getConexao();
            String sql = "DELETE FROM mapasala WHERE id = ? ; ";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            int qtd = ps.executeUpdate();
            if (qtd > 0) {
                return true;
            } else {
                return false;
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            return false;
        }
    }

    public static List<Mapasala> BuscarOcupadosPorSalaData(Connection conn, Date dataOcupada, int idSala) {
        try {

            String sql = "Select * from mapasala "
                    + " where idsala = ? AND datainicio <= ? AND datafim >= ? ; ";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, idSala);
            ps.setDate(2, dataOcupada);
            ps.setDate(3, dataOcupada);

            List<Mapasala> mapassala = new ArrayList();

            final ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                Mapasala mps = new Mapasala();
                mps.setId(rs.getInt("id"));
                mps.setIdsala(rs.getInt("idsala"));
                mps.setTurno(rs.getString("turno"));
                mps.setDatainicio(rs.getDate("datainicio"));
                mps.setDatafim(rs.getDate("datafim"));
                mapassala.add(mps);

            }
            return mapassala;
            
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return null;
        }
    }

    public static String adicionarDias(int ano, int mes, int dia) {

        SimpleDateFormat simpleDateFormat1 = new SimpleDateFormat("yyyy-MM-dd");
        Calendar cal = Calendar.getInstance();
        cal.set(ano, mes, dia);
        return simpleDateFormat1.format(cal.getTime());
    }
    
    public static int getQuantidadeDiasByMes(int mes){
        Calendar datas = new GregorianCalendar();
        datas.set(Calendar.MONTH, mes-1);//2
        int quantidadeDias = datas.getActualMaximum (Calendar.DAY_OF_MONTH);  
        return quantidadeDias ;
    }

}
