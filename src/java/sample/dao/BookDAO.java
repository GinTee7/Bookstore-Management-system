/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import sample.dto.Book;
import sample.utils.DBUtils;

/**
 *
 * @author ADMIN
 */
public class BookDAO {

    public static ArrayList<Book> getBooks(String keyword, String searchby) {
        ArrayList<Book> list = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null && searchby != null) {
                String sql = "select BID,BName,price,imgPath,description,status,Books.CateID as 'CateID',CateName\n"
                        + "from Books join Categories on Books.CateID=Categories.CateID\n";
                if (searchby.equalsIgnoreCase("byname")) {
                    sql = sql + "where Books.BName like ?";
                } else {
                    sql = sql + "where CateName like ?";
                }
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, "%" + keyword + "%");
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int id = rs.getInt("BID");
                        String name = rs.getString("BName");
                        int price = rs.getInt("price");
                        String imgpath = rs.getString("imgPath");
                        String description = rs.getString("description");
                        int status = rs.getInt("status");
                        int cateid = rs.getInt("CateID");
                        String catename = rs.getString("CateName");
                        Book plant = new Book(id, name, price, imgpath, description, status, cateid, catename);
                        list.add(plant);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static Book getBook(String bid) throws Exception {
        Book p = null;
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "select BID,BName,price,imgPath,description,status,Books.CateID as cateID,CateName\n"
                    + "from Books, Categories\n"
                    + "where Books.CateID=Categories.CateID and BID=?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, bid);
            ResultSet rs = pst.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    int id = rs.getInt("BID");
                    String name = rs.getString("BName");
                    int price = rs.getInt("price");
                    String imgPath = rs.getString("imgPath");
                    String des = rs.getString("description");
                    int status = rs.getInt("status");
                    int cateID = rs.getInt("CateID");
                    String cateName = rs.getString("CateName");
                    p = new Book(id, name, price, imgPath, des, status, cateID, cateName);

                }
            }
            cn.close();
        }
        return p;
    }

    public static ArrayList<Book> getBooks() {
        Connection cn = null;
        ArrayList<Book> list = new ArrayList<>();
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select BID,BName,price,imgPath,description,status,Books.CateID as 'CateID',CateName\n"
                        + "from Books join Categories on Books.CateID=Categories.CateID\n";

                PreparedStatement pst = cn.prepareStatement(sql);

                ResultSet rs = pst.executeQuery();
                while (rs.next()) {
                    Book book = new Book();
                    int id = rs.getInt("BID");
                    String name = rs.getString("BName");
                    int price = rs.getInt("price");
                    String imgpath = rs.getString("imgPath");
                    String description = rs.getString("description");
                    int status = rs.getInt("status");
                    int cateid = rs.getInt("CateID");
                    String catename = rs.getString("CateName");
                    book.setAll(id, name, price, imgpath, description, status, cateid, catename);
                    list.add(book);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public void deleteBook(int Bid) {
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "delete from Books join Categories on Books.CateID=Categories.CateID where BID = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, Bid);
                pst.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
