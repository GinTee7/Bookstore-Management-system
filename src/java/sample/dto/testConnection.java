/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.dto;

import java.util.ArrayList;
import sample.dao.AccountDAO;
import sample.dao.OrderDAO;

/**
 *
 * @author ADMIN
 */
public class testConnection {

    public static void main(String[] args) {
//
        Account acc = AccountDAO.getAccount("test@gmail.com", "test");
        if (acc != null) {
            if (acc.getRole() == 1) {
                System.out.println("i am an admin");
            } else {
                System.out.println("i am a user");
            }
        } else {
            System.out.println("login fail");
        }
//
//        ArrayList<Account> list = AccountDAO.getAccounts();
//        for (Account account : list) {
//            System.out.println(account.getAccID() + "," + account.getEmail() + "," + account.getFullname() + "," + account.getPassword());
//        }
//        if (AccountDAO.updateAccountStatus("test@gmail.com", 1)) {
//            System.out.println("update status successfully");
//        } else {
//            System.out.println("cannot update status");
//        }
//        if (AccountDAO.changeAccount("hongnhan@gmail.com", "number1", "0888385759")) {
//            System.out.println("update change status successfully");
//        } else {
//            System.out.println(" kakak cannot update status");
//        }
//        if(AccountDAO.insertAccount("dggdgd", "7t3781g", "trung tin", "00029", 1, 0)){
//            System.out.println("okoekoe");
//        } else{
//            System.out.println("notoke");
//        }
////
//        if (AccountDAO.insertAccount("test2@gmail.com", "222222", "chi pheo", "12123123", 1, 0)) {
//            System.out.println("Added new account");
//        } else {
//            System.out.println("insert a new account fail");
//        }
//        ArrayList<Order> list1 = OrderDAO.getOrders("test@gmail.com");
//        for (Order order : list1) {
//            System.out.println(order.getOrderDate() + "," + order.getAccID() + "," + order.getAccID());
//        }
//        ArrayList<Order> list2 = OrderDAO.getOrders();
//        for (Order order : list2) {
//            System.out.println(order.getOrderDate() + "," + order.getAccID() + "," + order.getAccID());
//        }

    }
}
