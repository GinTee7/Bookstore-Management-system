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
import sample.dto.Account;
import sample.utils.DBUtils;

/**
 *
 * @author ADMIN
 */
public class AccountDAO {

    public static Account getAccount(String email, String password) {
        Connection cn = null;
        Account acc = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select accID,email,password,fullname,phone,status,role,token\n"
                        + "from dbo.Accounts\n"
                        + "where status=1 and email =? and password =? COLLATE Latin1_General_CS_AS ";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, email);
                pst.setString(2, password);
                ResultSet rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    int AccID = rs.getInt("accID");
                    String Email = rs.getString("email");
                    String Password = rs.getString("password");
                    String Fullname = rs.getString("fullname");
                    String Phone = rs.getString("phone");
                    int Status = rs.getInt("status");
                    int Role = rs.getInt("role");
                    String Token = rs.getString("token");
                    acc = new Account(AccID, Email, Password, Fullname, Status, Phone, Role,Token);

                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (cn != null) {
                try {
                    cn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return acc;
    }
    
    public static Account getAccount(String token) {
        Connection cn = null;
        Account acc = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select accID,email,password,fullname,phone,status,role,token\n"
                        + "from dbo.Accounts\n"
                        + "where status=1 and token=? ";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, token);
               
                ResultSet rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    int AccID = rs.getInt("accID");
                    String Email = rs.getString("email");
                    String Password = rs.getString("password");
                    String Fullname = rs.getString("fullname");
                    String Phone = rs.getString("phone");
                    int Status = rs.getInt("status");
                    int Role = rs.getInt("role");
                    String Token = rs.getString("token");
                
                    acc = new Account(AccID, Email, Password, Fullname, Status, Phone, Role,Token);

                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (cn != null) {
                try {
                    cn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return acc;
    }
    public static ArrayList<Account> getAccounts(String email) {
        Connection cn = null;
        ArrayList<Account> list = new ArrayList<>();
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select accID,email,password,fullname,phone,status,role,token\n"
                        + "from dbo.Accounts\n"
                        + "where email like ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, "%"+email+"%");
                ResultSet rs = pst.executeQuery();
                while (rs.next()) {
                    Account acc = new Account();
                    int AccID = rs.getInt("accID");
                    String Email = rs.getString("email");
                    String Password = rs.getString("password");
                    String Fullname = rs.getString("fullname");
                    String Phone = rs.getString("phone");
                    int Status = rs.getInt("status");
                    int Role = rs.getInt("role");
                    String Token = rs.getString("token");
                    acc.setAll(AccID, Email, Password, Fullname, Status, Phone, Role,Token);
                    list.add(acc);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    public static ArrayList<Account> getAccounts() {
        Connection cn = null;
        ArrayList<Account> list = new ArrayList<>();
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select accID,email,password,fullname,phone,status,role,token\n"
                        + "from dbo.Accounts\n";

                PreparedStatement pst = cn.prepareStatement(sql);

                ResultSet rs = pst.executeQuery();
                while (rs.next()) {
                    Account acc = new Account();
                    int AccID = rs.getInt("accID");
                    String Email = rs.getString("email");
                    String Password = rs.getString("password");
                    String Fullname = rs.getString("fullname");
                    String Phone = rs.getString("phone");
                    int Status = rs.getInt("status");
                    int Role = rs.getInt("role");
                    String Token = rs.getString("token");
                    acc.setAll(AccID, Email, Password, Fullname, Status, Phone, Role,Token);
                    list.add(acc);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static boolean updateAccountStatus(String email, int status) {
       
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "update dbo.Accounts set status = ? where email = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, 0);
                pst.setString(2, email);

                pst.executeUpdate();
                return true;
            } else {
                return false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    public static boolean changeAccount(String email, String fullname, String phone) {
        Connection cn = null;
        boolean result = false;
    
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "update dbo.Accounts set phone = ?,fullname = ? where email = ?";

                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, phone);
                pst.setString(2, fullname);
                pst.setString(3, email);
                int row = pst.executeUpdate();
                if(row>0){
                    result = true;
                } else {
                    result = false;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    public static boolean insertAccount(String newEmail, String newPassword, String newFullname, String newPhone, int newStatus, int newRole) {
        String sql = "insert into dbo.Accounts (email,password,fullname,phone,status,role) \n "
                        + " values(?,?,?,?,?,?)\n";
        Connection cn = null;
        boolean check = false;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, newEmail);     
                pst.setString(2, newPassword);
                pst.setString(3, newFullname);
                pst.setString(4, newPhone);
                pst.setInt(5, newStatus);
                pst.setInt(6, newRole);
                pst.executeUpdate();
                check = true;
            }
        } catch (Exception e) {
            
        }finally {
            if (cn != null) {
                try {
                    cn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }

        return check;
    }

    public static boolean updateToken(String token, String email) {
         boolean result = false;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "update dbo.Accounts set token = ? where email = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, token);
                pst.setString(2, email);

                pst.executeUpdate();
                result = true;
            } else {
                result = false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
}
