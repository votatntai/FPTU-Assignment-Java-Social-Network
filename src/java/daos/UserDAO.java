/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import entities.Notice;
import entities.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import utils.MyConnection;

/**
 *
 * @author Vo Tan Tai
 */
public class UserDAO {

    private Connection conn;
    private PreparedStatement stm;
    private ResultSet rs;

    private void closeConnection() throws SQLException {
        if (rs != null) {
            rs.close();
        }
        if (stm != null) {
            stm.close();
        }
        if (conn != null) {
            conn.close();
        }
    }

    public User checkLogin(String email, String password) throws SQLException, NamingException {
        User user = null;
        try {
            conn = MyConnection.getConnection();
            stm = conn.prepareCall("{Call CheckLogin(?, ?)}");
            stm.setString(1, email);
            stm.setString(2, password);
            rs = stm.executeQuery();
            if (rs.next()) {
                user = new User(
                        rs.getString("Email"),
                        rs.getString("Name"),
                        rs.getString("Role"),
                        rs.getString("Status"));
            }
        } finally {
            closeConnection();
        }
        return user;
    }

    public int register(User register) throws SQLException, NamingException {
        int status = 0;
        try {
            conn = MyConnection.getConnection();
            if (!checkEmailExit(register.getEmail())) {
                stm = conn.prepareCall("{Call Register(?, ?, ?)}");
                stm.setString(1, register.getEmail());
                stm.setString(2, register.getPassword());
                stm.setString(3, register.getName());
                boolean result = stm.executeUpdate() > 0;
                if (result) {
                    status = 1;
                }
            } else {
                status = 2;
            }
        } finally {
            closeConnection();
        }
        return status;
    }

    public boolean checkEmailExit(String email) throws SQLException {
        boolean result = false;
        stm = conn.prepareStatement("Select Email From Users Where Email = ?");
        stm.setString(1, email);
        rs = stm.executeQuery();
        if (rs.next()) {
            result = true;
        }
        return result;
    }

    public List<Notice> getNotice(String email) throws SQLException, NamingException {
        List<Notice> list = null;
        try {
            conn = MyConnection.getConnection();
            stm = conn.prepareCall("{Call GetNotice(?)}");
            stm.setString(1, email);
            rs = stm.executeQuery();
            list = new ArrayList<>();
            Notice notice;
            while (rs.next()) {
                notice = new Notice(rs.getInt("Id"),
                        rs.getString("Email"),
                        rs.getInt("PostId"),
                        rs.getString("Content"),
                        rs.getString("Date"));
                list.add(notice);
            }
        } finally {
            closeConnection();
        }
        return list;
    }
}
