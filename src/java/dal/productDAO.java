/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.util.ArrayList;
import java.util.List;
import model.Product;

/**
 *
 * @author DELL
 */
public class productDAO extends MyDAO {

    public  void deleteProduct(String pid) {
        xSql = "delete from orderdetail where productID = ?\n" +
"delete from product where id = ?";
        try {
            ps = conn.prepareStatement(xSql);
            
            ps.setString(1, pid);
            ps.setString(2, pid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        
    }

    public void addProduct(int pid, String name, String image, String price, int quantity,
            String title, String description, int cid) {
        xSql = "INSERT INTO product(id,name,[image],price,quantity,title,[description],cid) VALUES (?,?,?,?,?,?,?,?)";
        try {
            ps = conn.prepareStatement(xSql);
            ps.setInt(1, pid);
            ps.setString(2, name);
            ps.setString(3, image);
            ps.setString(4, price);
            ps.setInt(5, quantity);
            ps.setString(6, title);
            ps.setString(7, description);
            ps.setInt(8, cid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void editProduct(int pid, String name, String image, int price, int quantity, String title, String description,int cid) {
        
         xSql = "update product\n"
                + "set [name] = ?,\n"
                + "[image] = ?,\n"
                + "price = ?,\n"
                + "quantity= ?,\n"
                + "title = ?,\n"
                + "[description] = ?,\n"
                + "cid = ?\n"
                + "where id = ?";
        try {
            
            ps = conn.prepareStatement(xSql);
            ps.setString(1,name);
            ps.setString(2, image);
            ps.setInt(3, price);
            ps.setInt(4, quantity);
            ps.setString(5, title);
            ps.setString(6, description);
            ps.setInt(7, cid);
            ps.setInt(8,pid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
     
    }

    public int checkoutProduct(int pid,int quantity) {
        int n = 0;
        xSql = "update product set quantity =? where id = ?";
        try {
            ps = conn.prepareStatement(xSql);
            ps.setInt(1, quantity);
            ps.setInt(2, pid);
            n = ps.executeUpdate();
        } catch (Exception e) {
        } return n;
    }

    public List<Product> getAllProduct() {
        List<Product> list = new ArrayList<>();
        xSql = "select * from product";
        try {
            ps = conn.prepareStatement(xSql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt("id"), rs.getString("name"), rs.getString("image"), rs.getInt("price"), rs.getInt("quantity"), rs.getString("title"), rs.getString("description"), rs.getInt("cid")));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public Product getProductByID(int id) {
        Product product = new Product();
        xSql = "select * from product where id = ?";
        try {
            ps = conn.prepareStatement(xSql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                product = new Product(rs.getInt("id"), rs.getString("name"), rs.getString("image"), rs.getInt("price"), rs.getInt("quantity"), rs.getString("title"), rs.getString("description"), rs.getInt("cid"));
            }
        } catch (Exception e) {
        }
        return product;
    }

    public List<Product> getProductByCateID(String cid) {
        List<Product> list = new ArrayList<>();
        xSql = "select * from product where cid = ?";
        try {
            ps = conn.prepareStatement(xSql);
            ps.setString(1, cid);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt("id"), rs.getString("name"), rs.getString("image"), rs.getInt("price"), rs.getInt("quantity"), rs.getString("title"), rs.getString("description"), rs.getInt("cid")));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public ArrayList<Product> getProductByName(String name) {
        ArrayList<Product> list = new ArrayList<>();
        xSql = "SELECT * FROM product WHERE name like ?";
        try {
            ps = conn.prepareStatement(xSql);
            ps.setString(1, "%" + name + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt("id"), rs.getString("name"), rs.getString("image"), rs.getInt("price"), rs.getInt("quantity"), rs.getString("title"), rs.getString("description"), rs.getInt("cid")));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public int getMaxQuantity(int pid) {
        xSql = "select quantity from product where id = ?";
        try {
            ps = conn.prepareStatement(xSql);
            ps.setInt(1, pid);
            ps.executeUpdate();
            if (rs.next()) {
                return rs.getInt("quantity");
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public List<Product> getTop3LatestProduct() {
        List<Product> list = new ArrayList<>();
        xSql = "select top 3 * from product order by id desc";
        //asc
        try {
            ps = conn.prepareStatement(xSql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt("id"), rs.getString("name"), rs.getString("image"), rs.getInt("price"), rs.getInt("quantity"), rs.getString("title"), rs.getString("description"), rs.getInt("cid")));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public boolean checkDupProId(int pid) {
        xSql = "SELECT * FROM product WHERE id = ?";
        try {
            ps = conn.prepareStatement(xSql);
            ps.setInt(1, pid);
            ps.executeUpdate();
            if (rs.next()) {
                return true;
            }
        } catch (Exception e) {
        }
        return false;
    }

    public boolean checkCateNotExist(int cid) {
        xSql = "SELECT * FROM category WHERE cid = ?";
        try {
            ps = conn.prepareStatement(xSql);
            ps.setInt(1, cid);
            ps.executeUpdate();
            if (rs.next()) {
                return false;
            }
        } catch (Exception e) {
        }
        return true;
    }

    public static void main(String[] args) {
        productDAO dao = new productDAO();
        List<Product> list = dao.getProductByCateID("1");
        List<Product> listbyN = dao.getProductByName("u");
        for (Product product : listbyN) {
            System.out.println(product.getTitle());
        }
        dao.deleteProduct("3");
    }
}
