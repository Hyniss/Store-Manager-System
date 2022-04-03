/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author sonnt
 */
public class DBContext {
  
    
    public static Connection getConnect() {
        Connection conn = null;
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=PRJ_Assignment;"
                    + " user=sa;password=huytruong0612"
                    + ";userUnicode=true;characterEncoding=UTF-8");
            System.out.println("Successfull");
        } catch(SQLException | ClassNotFoundException e){
            System.out.println("Error" + e.getMessage());
        }
        return conn;
    }
    
    public static void main(String[] args) {
        System.out.println(getConnect());
    }
}
