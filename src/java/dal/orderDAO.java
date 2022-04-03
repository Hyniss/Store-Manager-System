/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.util.ArrayList;
import java.util.List;
import model.Order;

/**
 *
 * @author DELL
 */
public class orderDAO extends MyDAO {

    public void deleteOrder(String oid) {
        xSql = "delete from [order] where orderid = ?";
        try {
            ps = conn.prepareStatement(xSql);
            ps.setString(1, oid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public Order getLatestOrder() {
        Order order = new Order();
        xSql = "select top 1 * from [order] order by orderid desc";
        try {
            ps = conn.prepareStatement(xSql);
            rs = ps.executeQuery();
            while (rs.next()) {
                order = new Order(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5));
            }
        } catch (Exception e) {
        }
        return order;
    }

    public int addOder(String username, String Cname, String address, int total) {
        int n = 0;
        xSql = "INSERT INTO [order] (username,Cname,[address],total) VALUES (?,?,?,?)";
        try {
            ps = conn.prepareStatement(xSql);
            ps.setString(1, username);
            ps.setString(2, Cname);
            ps.setString(3, address);
            ps.setInt(4, total);
            n = ps.executeUpdate();
        } catch (Exception e) {
        }
        return n;
    }

    public List<Order> getAllOrder() {
        List<Order> list = new ArrayList<>();
        xSql = "select * from [order]";
        try {
            ps = conn.prepareStatement(xSql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Order(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public Order getOrderByID(int oid) {
        Order order = new Order();
        xSql = "select * from [order] where orderid = ?";
        try {
            ps = conn.prepareStatement(xSql);
            ps.setInt(1, oid);
            rs = ps.executeQuery();
            while (rs.next()) {
                order = new Order(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5));
            }
        } catch (Exception e) {
        }
        return order;
    }
    
    public Order getOrderByIdAndUser(int oid, String username) {
        Order order = new Order();
        xSql = "select * from [order] where orderid = ? and username = ?";
        try {
            ps = conn.prepareStatement(xSql);
            ps.setInt(1, oid);
            ps.setString(2, username);
            rs = ps.executeQuery();
            while (rs.next()) {
                order = new Order(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5));
            }
        } catch (Exception e) {
        }
        return order;
    }

    public List<Order> getOrderByUser(String username) {
        List<Order> order = new ArrayList<Order>();
        xSql = "select * from [order] where username = ?";
        try {
            ps = conn.prepareStatement(xSql);
            ps.setString(1, username);
            rs = ps.executeQuery();
            while (rs.next()) {
                order.add(new Order(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5)));
            }
        } catch (Exception e) {
        }
        return order;
    }
    
}
