/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import java.util.HashMap;
import java.util.Set;
import sample.dto.Order;
import sample.dto.OrderDetail;
import sample.utils.DBUtils;

/**
 *
 * @author ADMIN
 */
public class OrderDAO {
    public static ArrayList<Order> getOrders(){
         Connection cn = null;
        ArrayList<Order> list = new ArrayList<>();
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select OrderID,OrdDate, shipdate, status, AccID\n"
                        + "from Orders\n"
                        + "Order by OrdDate";

                PreparedStatement pst = cn.prepareStatement(sql);
          
                ResultSet rs = pst.executeQuery();
                while (rs.next()) {
                    Order ord = new Order();
                    int OrdID = rs.getInt("OrderID");
                    String OrdDate = rs.getString("OrdDate");
                    String ShipDate = rs.getString("shipdate");
                    int status = rs.getInt("status");
                    int AccID = rs.getInt("AccID");
                    ord = new Order(OrdID, OrdDate, ShipDate, status, AccID);

                    list.add(ord);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    public static ArrayList<Order> getOrders(String email) {
        Connection cn = null;
        ArrayList<Order> list = new ArrayList<>();
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select OrderID,OrdDate, shipdate, Orders.status, Orders.AccID\n"
                        + "from Orders join  Accounts on Orders.AccID = Accounts.accID\n"
                        + "where email like ?";

                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1,email);
                ResultSet rs = pst.executeQuery();
                while (rs.next()) {
                    
                    int orderID = rs.getInt("OrderID");
                    String orderDate = rs.getString("OrdDate");
                    String shipDate = rs.getString("shipdate");
                    int status = rs.getInt("status");
                    int accID = rs.getInt("AccID");
                    Order order = new Order(orderID, orderDate, shipDate, status, accID);
                    list.add(order);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;

    }

    public static ArrayList<OrderDetail> getOrderDetail(int orderID) {
        Connection cn=null;
        ArrayList<OrderDetail> list=new ArrayList<>();
        try{
            cn = DBUtils.makeConnection();
            if(cn!=null){
                String sql="select DetailID,OrderID,BID,BName,price,imgPath,quantity\n"
                        + "from OrderDetail, Books\n"
                        + "where OrderID = ? and OrderDetail.FID=Books.BID";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, orderID);
                ResultSet rs = pst.executeQuery();
                if(rs!=null){
                    while(rs.next()){
                        int detailID = rs.getInt("DetailID");
                        int BookID = rs.getInt("BID");
                        String BookName = rs.getString("BName");
                        int price = rs.getInt("price");
                        String imgPath = rs.getString("imgPath");
                        int quantity = rs.getInt("quantity");
                        OrderDetail orderdetail = new OrderDetail(detailID, orderID, quantity, BookName, price, imgPath, quantity);
                        list.add(orderdetail);
                    }
                }
            }
        } catch(Exception e){
            e.printStackTrace();
        } finally{
            try{
                if(cn!=null) cn.close();
            } catch(Exception e){
                e.printStackTrace();
            }
        }
        return list;
    }
    public static boolean insertOrder(String email, HashMap<String, Integer> cart) {
        boolean result = false;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                int accid = 0, orderid = 0;
                cn.setAutoCommit(false);
                String sql = "select accID from Accounts where Accounts.email=?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, email);
                ResultSet rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    accid = rs.getInt("accID");
                }
                System.out.println("accountid:" + accid);
                Date d = new Date(System.currentTimeMillis());
                System.out.println("order date:" + d);
                sql = "insert Orders(OrdDate,status,AccID) values(?,?,?)";
                pst = cn.prepareStatement(sql);
                pst.setDate(1, d);
                pst.setInt(2, 1);
                pst.setInt(3, accid);
                pst.executeUpdate();
                sql = "select top 1 orderID from Orders order by orderId desc";
                pst = cn.prepareStatement(sql);
                rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    orderid = rs.getInt("orderID");
                }
                System.out.println("orderid:" + orderid);
                Set<String> pids = cart.keySet();
                for (String pid : pids) {
                    sql = "insert OrderDetail values(?,?,?)";
                    pst = cn.prepareStatement(sql);
                    pst.setInt(1, orderid);
                    pst.setInt(2, Integer.parseInt(pid.trim()));
                    pst.setInt(3, cart.get(pid));
                    pst.executeUpdate();
                    cn.commit();
                    cn.setAutoCommit(true);
                }
                return true;
            } else {
                System.out.println("Cannot insert order!!!!");
            }
        } catch (Exception e) {
            try {
                if (cn != null) {
                    cn.rollback();
                }
            } catch (Exception a) {
                e.printStackTrace();

            }
            e.printStackTrace();
            result = false;
        } finally {
            try {
                if (cn != null) {
                    cn.close();
                };
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return result;
    }
}
