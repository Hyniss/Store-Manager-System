/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.util.ArrayList;
import java.util.List;
import model.Order;
import model.OrderDetail;

/**
 *
 * @author DELL
 */
public class orderDetailDAO extends MyDAO {

    public int addOderDetail(int oid, int pid, int quantity, int price) {
        xSql = "INSERT INTO orderdetail (orderid,productID,quantity,price) VALUES (?,?,?,?)";
        int n = 0;
        try {
            ps = conn.prepareStatement(xSql);
            ps.setInt(1, oid);
            ps.setInt(2, pid);
            ps.setInt(3, quantity);
            ps.setInt(4, price);
            n = ps.executeUpdate();
        } catch (Exception e) {
        }
        return n;
    }

    public List<OrderDetail> getAllOrderDetail() {
        List<OrderDetail> list = new ArrayList<>();
        xSql = "select * from orderdetail";
        try {
            ps = conn.prepareStatement(xSql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new OrderDetail(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public ArrayList<OrderDetail> getOrderDetailByID(int oid) {
        ArrayList<OrderDetail> order = new ArrayList<OrderDetail>();
        xSql = "select * from orderdetail where orderid = ?";
        try {
            ps = conn.prepareStatement(xSql);
            ps.setInt(1, oid);
            rs = ps.executeQuery();
            while (rs.next()) {
                order.add(new OrderDetail(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4)));
            }
        } catch (Exception e) {
        }
        return order;
    }
    
    public ArrayList<OrderDetail> getOrderDetailByIdAndUser(int oid, String username) {
        ArrayList<OrderDetail> order = new ArrayList<OrderDetail>();
        xSql = "select od.orderid, od.productID, od.quantity,od.price from orderdetail od inner join [order] o on\n"
                + "od.orderid = o.orderid \n"
                + "where od.orderid = ? and o.username= ?";
        try {
            ps = conn.prepareStatement(xSql);
            ps.setInt(1, oid);
            ps.setString(2, username);
            rs = ps.executeQuery();
            while (rs.next()) {
                order.add(new OrderDetail(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4)));
            }
        } catch (Exception e) {
        }
        return order;
    }
}
