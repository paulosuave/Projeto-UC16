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
import java.util.Calendar;
import java.util.List;
import javax.ws.rs.BadRequestException;
import util.BancoDados;

/**
 *
 * @author Suave
 */
public class Instrutor {

    /**
     * @return the dtcadastro
     */
    public Date getDtcadastro() {
        return dtcadastro;
    }

    /**
     * @param dtcadastro the dtcadastro to set
     */
    public void setDtcadastro(Date dtcadastro) {
        this.dtcadastro = dtcadastro;
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
     * @return the sexo
     */
    public String getSexo() {
        return sexo;
    }

    /**
     * @param sexo the sexo to set
     */
    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    /**
     * @return the cpf
     */
    public String getCpf() {
        return cpf;
    }

    /**
     * @param cpf the cpf to set
     */
    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    /**
     * @return the dtnascimento
     */
    public Date getDtnascimento() {
        return dtnascimento;
    }

    /**
     * @param dtnascimento the dtnascimento to set
     */
    public void setDtnascimento(Date dtnascimento) {
        this.dtnascimento = dtnascimento;
    }

    /**
     * @return the ddd
     */
    public String getDdd() {
        return ddd;
    }

    /**
     * @param ddd the ddd to set
     */
    public void setDdd(String ddd) {
        this.ddd = ddd;
    }

    /**
     * @return the telefone
     */
    public String getTelefone() {
        return telefone;
    }

    /**
     * @param telefone the telefone to set
     */
    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        this.email = email;
    }
    private int id;
    private String nome;
    private String sexo;
    private String cpf;
    private Date dtnascimento;
    private Date dtcadastro;
    private String ddd;
    private String telefone;
    private String email;

    public boolean Cadastrar() {
        try {
            Connection conn = BancoDados.getConexao();
            String sql = "INSERT INTO `bdmapasala`.`instrutor`"
                    + "(`id`,`nome`,`sexo`,`cpf`,`dtnascimento`,`ddd`,`telefone`,`email`)"
                    + "VALUES (?,?,?,?,?,?,?,?);";
            PreparedStatement ps = conn.prepareStatement(sql,
                    Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, this.getId());
            ps.setString(2, this.getNome());
            ps.setString(3, this.getSexo());
            ps.setString(4, this.getCpf());
            ps.setDate(5, this.getDtnascimento());
            ps.setString(6, this.getDdd());
            ps.setString(7, this.getTelefone());
            ps.setString(8, this.getEmail());

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

    public List<Instrutor> ListarTodos() {
        try {
            Connection conn = BancoDados.getConexao();
            String sql = "SELECT * FROM instrutor; ";
            PreparedStatement ps = conn.prepareStatement(sql);
            List<Instrutor> instrutores = new ArrayList();
            final ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Instrutor ins = new Instrutor();
                ins.setId(rs.getInt("id"));
                ins.setNome(rs.getString("nome"));
                ins.setSexo(rs.getString("sexo"));
                ins.setCpf(rs.getString("cpf"));
                ins.setDtnascimento(rs.getDate("dtnascimento"));
                ins.setDdd(rs.getString("ddd"));
                ins.setTelefone(rs.getString("telefone"));
                ins.setEmail(rs.getString("email"));
                ins.setDtcadastro(rs.getDate("dtcadastro"));

                instrutores.add(ins);
            }
            return instrutores;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return null;
        }
    }

    public Instrutor PesquisarPorId(int id) {
        try {
            Connection conn = BancoDados.getConexao();
            String sql = "Select * from instrutor where id = ?; ";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            final ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Instrutor ins = new Instrutor();
                ins.setId(rs.getInt("id"));
                ins.setNome(rs.getString("nome"));
                ins.setSexo(rs.getString("sexo"));
                ins.setCpf(rs.getString("cpf"));
                ins.setDtnascimento(rs.getDate("dtnascimento"));
                ins.setDdd(rs.getString("ddd"));
                ins.setTelefone(rs.getString("telefone"));
                ins.setEmail(rs.getString("email"));
                ins.setDtcadastro(rs.getDate("dtcadastro"));
                return ins;
            } else {
                return null;
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return null;
        }
    }

  

    public boolean Atualizar() {
        try {
            Connection conn = BancoDados.getConexao();
            String sql = "UPDATE instrutor "
                    + "SET "
                    + " nome = ?, "
                    + " cpf = ?, "
                    + " dtnascimento = ?, "
                    + " ddd = ?, "
                    + " telefone = ?, "
                    + " email = ? "
                    + "WHERE id = ? ;";
                   

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, this.getNome());          
            ps.setString(2, this.getCpf());
            ps.setDate(3, this.getDtnascimento());
            ps.setString(4, this.getDdd());
            ps.setString(5, this.getTelefone());
            ps.setString(6, this.getEmail());
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

    
    
      public boolean Deletar(int id) {
        try {
            Connection conn = BancoDados.getConexao();
            String sql = "DELETE FROM instrutor WHERE id = ? ; ";
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
}


