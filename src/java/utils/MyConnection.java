/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

import java.sql.Connection;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

/**
 *
 * @author Vo Tan Tai
 */
public class MyConnection {

    public static Connection getConnection() throws NamingException, SQLException {
        Connection conn;
        Context context = new InitialContext();
        Context end = (Context) context.lookup("java:comp/env");
        DataSource ds = (DataSource) end.lookup("Connection");
        conn = ds.getConnection();
        return conn;
    }

}
