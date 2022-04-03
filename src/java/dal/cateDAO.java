/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.util.ArrayList;
import java.util.List;
import model.Category;

/**
 *
 * @author DELL
 */
public class cateDAO extends MyDAO{
    
    public List<Category> getAllCategory() {
        List<Category> list = new ArrayList<>();
        xSql = "select * from category";
        try {
            ps = conn.prepareStatement(xSql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Category(rs.getInt("cid"), rs.getString("cname")));
                }
        } catch (Exception e) {
        }
        return list;
    }
        public boolean addCategory(int cid,String cname) {
            int check = 0;
        xSql = "INSERT INTO category(cid,cname) VALUES (?,?)";
        try {
            ps = conn.prepareStatement(xSql);
            ps.setInt(1, cid);
            ps.setString(2, cname);
         
            check = ps.executeUpdate();
        } catch (Exception e) {
        }
        return check > 0;
    }
    
    public static void main(String[] args) {
         
        cateDAO dao = new cateDAO();
        dao.addCategory(10, "quanxi");
//        List<Category> list =  dao.getAllCategory();
//        for (Category category : list) {
//            System.out.println(category);
//        }
       
    }
}
