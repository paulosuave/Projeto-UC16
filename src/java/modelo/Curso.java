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
public class Curso {

    /**
     * @return the datacadastro
     */
    public Date getDatacadastro() {
        return datacadastro;
    }

    /**
     * @param datacadastro the datacadastro to set
     */
    public void setDatacadastro(Date datacadastro) {
        this.datacadastro = datacadastro;
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

    /**
     * @return the horas
     */
    public String getHoras() {
        return horas;
    }

    /**
     * @param horas the horas to set
     */
    public void setHoras(String horas) {
        this.horas = horas;
    }
  private int id;
  private String nome;
  private String horas;
  private Date datacadastro;
  
  public boolean Cadastrar() {
        try {
            Connection conn = BancoDados.getConexao();
            String sql = "INSERT INTO `bdmapasala`.`curso`"
                    + "(`id`,`nome`,`horas`)"
                    + "VALUES (?,?,?);";
            PreparedStatement ps = conn.prepareStatement(sql,
                    Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, this.getId());
            ps.setString(2, this.getNome());
            ps.setString(3, this.getHoras());

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
   public List<Curso> ListarTodos() {
        try {
            Connection conn = BancoDados.getConexao();
            String sql = "SELECT * FROM curso; ";
            PreparedStatement ps = conn.prepareStatement(sql);
            List<Curso> cursos = new ArrayList();
            final ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Curso cs = new Curso();
                cs.setId(rs.getInt("id"));
                cs.setNome(rs.getString("nome"));
                cs.setHoras(rs.getString("horas"));
                cs.setDatacadastro(rs.getDate("dtcadastro"));

                cursos.add(cs);
            }
            return cursos;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return null;
        }
    }
    public Curso PesquisarPorID(int id) {
        try {
            Connection conn = BancoDados.getConexao();
            String sql = "Select * from curso where id = ?; ";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            final ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Curso cs = new Curso();

                cs.setId(rs.getInt("id"));
                cs.setNome(rs.getString("nome"));
                cs.setHoras(rs.getString("horas"));

                return cs;
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
            String sql = "DELETE FROM curso WHERE id = ? ; ";
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
            String sql = "UPDATE curso "
                    + "SET "
                    + " nome = ?, "
                    + " horas = ? "
                    + "WHERE id = ? ;";
                   

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, this.getNome());
            ps.setString(2, this.getHoras());
            ps.setInt(3, this.getId());

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


