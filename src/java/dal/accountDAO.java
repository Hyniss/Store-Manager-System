/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;

/**
 *
 * @author DELL
 */
public class accountDAO extends MyDAO{
    
    public void singup(String user, String pass) {
        xSql = "insert into account values(?,?,0)";
        try {
            ps = conn.prepareStatement(xSql);
            ps.setString(1, user);
            ps.setString(2, pass);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    public void changePassword(String username, String newPass) {
            xSql = "update account set pass = ? where username = ?";
        try {    
            ps = conn.prepareStatement(xSql);
            ps.setString(1, newPass);
            ps.setString(2, username);
            rs = ps.executeQuery();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
    
    public Account getAccountLogin(String userid, String password) {
        Account a = null;
        xSql = "select * from account where username = ? and pass = ? ";
        try {
            ps = conn.prepareStatement(xSql);
            ps.setString(1, userid);
            ps.setString(2, password);
            rs = ps.executeQuery();
            while (rs.next()) {
                a = new Account(rs.getString("username"), rs.getString("pass"), rs.getBoolean("isAdmin"));
            }
            rs.close();
            ps.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return a;
    }
    
    public void deleteAccount(String username) {
        xSql = "delete from account where username = ?";
        try {
            ps = conn.prepareStatement(xSql);
            ps.setString(1, username);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    
    public List<Account> getAllAccount() {
        List<Account> list = new ArrayList<>();
        xSql = "select * from account";
        try {
            ps = conn.prepareStatement(xSql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Account(rs.getString("username"), rs.getString("pass"), rs.getBoolean("isAdmin")));
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public Account getDuplicateAcc(String userid) {
        Account a = null;
        xSql = "select * from account where username = ?";
        try {
            ps = conn.prepareStatement(xSql);
            ps.setString(1, userid);
            rs = ps.executeQuery();
            while (rs.next()) {
                a = new Account(rs.getString("username"), rs.getString("pass"), rs.getBoolean("isAdmin"));
            }
            rs.close();
            ps.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return a;
    }
}
