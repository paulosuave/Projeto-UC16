/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import util.BancoDados;

/**
 *
 * @author Suave
 */
public class Usuario {

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
     * @return the login
     */
    public String getLogin() {
        return login;
    }

    /**
     * @param login the login to set
     */
    public void setLogin(String login) {
        this.login = login;
    }

    /**
     * @return the senha
     */
    public String getSenha() {
        return senha;
    }

    /**
     * @param senha the senha to set
     */
    public void setSenha(String senha) {
        this.senha = senha;
    }
    private int id;
    private String login;
    private String senha;
    public boolean temUsuario(String login, String senha){
          try {
            Connection conn = BancoDados.getConexao();
            String sql = "SELECT id "
                    + "FROM usuario "
                    + "WHERE login = ? AND senha= ?; ";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, login);
            ps.setString(2, senha);
            final ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                int idusuario = rs.getInt("id");
                this.setId(idusuario);
                return true;
            } else {
                return false;
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return false;
        }
       
    }
    
}
