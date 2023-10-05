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
import java.util.ArrayList;
import java.util.List;
import util.BancoDados;

/**
 *
 * @author Suave
 */
public class Sala {

    /**
     * @return the tm
     */
    public int getTm() {
        return tm;
    }

    /**
     * @param tm the tm to set
     */
    public void setTm(int tm) {
        this.tm = tm;
    }

    /**
     * @return the tv
     */
    public int getTv() {
        return tv;
    }

    /**
     * @param tv the tv to set
     */
    public void setTv(int tv) {
        this.tv = tv;
    }

    /**
     * @return the tn
     */
    public int getTn() {
        return tn;
    }

    /**
     * @param tn the tn to set
     */
    public void setTn(int tn) {
        this.tn = tn;
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
     * @return the nome
     */
    public String getNome() {
        return nome;
    }

    /**
     * @param nome the nome to set
     */
    public void setNome(String nome) {
        this.nome = nome;
    }

    private int id;
    private String nome;
    private int tm;
    private int tv;
    private int tn;

    public boolean Cadastrar() {
        try {
            Connection conn = BancoDados.getConexao();
            String sql = "INSERT INTO `bdmapasala`.`sala`"
                    + "(`id`,`nome`)"
                    + "VALUES (?,?);";
            PreparedStatement ps = conn.prepareStatement(sql,
                    Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, this.getId());
            ps.setString(2, this.getNome());
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

    public List<Sala> ListarTodos() {
        try {
            Connection conn = BancoDados.getConexao();
            String sql = "SELECT * FROM sala; ";
            PreparedStatement ps = conn.prepareStatement(sql);

            List<Sala> salas = new ArrayList();

            final ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Sala sl = new Sala();
                sl.setId(rs.getInt("id"));
                sl.setNome(rs.getString("nome"));

                salas.add(sl);
            }
            return salas;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return null;
        }
    }

    public Sala PesquisarPorID(int id) {
        try {
            Connection conn = BancoDados.getConexao();
            String sql = "Select * from sala where id = ?; ";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            final ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Sala sl = new Sala();

                sl.setId(rs.getInt("id"));
                sl.setNome(rs.getString("nome"));

                return sl;
            } else {
                return null;
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return null;
        }
    }

   public boolean Deletar(int id) {
        try {
            Connection conn = BancoDados.getConexao();
            String sql = "DELETE FROM sala WHERE id = ? ; ";
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

    public boolean Atualizar() {
        try {
            Connection conn = BancoDados.getConexao();
            String sql = "UPDATE sala "
                    + "SET nome = ? "
                    + "WHERE id = ? ;";
                   

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, this.getNome());
            ps.setInt(2, this.getId());

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

}
