/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.dao;

import java.io.Serializable;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import sample.jaxb.ComputerType;
import sample.jaxb.Computers;
import sample.util.XMLUtils;

/**
 *
 * @author Administrator
 */
public class ComputerDAO implements Serializable{
    Computers listcomputers;

    public Computers getListcomputers() {
        return listcomputers;
    }

    public void setLiatcomputers(Computers liatcomputers) {
        this.listcomputers = liatcomputers;
    }
    
   public void getComputers (){
        Connection con = XMLUtils.makeConnection();
        PreparedStatement stm = null;
        ResultSet rs = null;
        listcomputers= new Computers();
        try {
        if (con != null) {
            String sql = "Select * From Computer";
            stm = con.prepareStatement(sql);
            rs = stm.executeQuery();
            
            while (rs.next()){
                String code = rs.getString("code");
                String  name= rs.getString("name");
                String brand= rs.getString("brand");
                String screen= rs.getString("screen");
                String hdd= rs.getString("hdd");
                BigDecimal price= BigDecimal.valueOf(rs.getFloat("price"));
                String vga= rs.getString("vga");
                String ram= rs.getString("ram");
                String cpu = rs.getString("cpu");
                BigDecimal weight= BigDecimal.valueOf(rs.getFloat("weight"));
                BigInteger pin= BigInteger.valueOf(rs.getInt("pin"));
                String imagelink= rs.getString("imagelink");
                BigInteger numberofcompare=BigInteger.valueOf(rs.getInt("numberofcompare"));
                 BigInteger numberoflike=BigInteger.valueOf(rs.getInt("numberoflike"));
                String detail=rs.getString("detail");
                String more=rs.getString("more");
                
                ComputerType dto = new ComputerType(code, name, brand, 
                                                    screen, hdd, price, 
                                                    vga, ram, cpu, 
                                                    weight, pin, imagelink, 
                                                    numberofcompare, numberoflike, detail, more);
                
                listcomputers.getComputer().add(dto);
                
            }
           
            
        }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (rs != null){
                    rs.close();
                }
                if (stm != null) {
                    stm.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        
    }
   public boolean updateInforComputer (String codeComputer,String screen,String hdd, String vga,
           String ram,String price,String detail) {
        Connection con = XMLUtils.makeConnection();
        PreparedStatement stm = null;
               
        try {
        if (con != null) {
            String sql = "Update Computer Set screen = ?,hdd = ?,vga = ?,ram = ?, price = ?,detail = ? Where code = ?";
            stm = con.prepareStatement(sql);
            stm.setString(1, screen);
            stm.setString(2, hdd);
            stm.setString(3, vga);
            stm.setString(4, ram);
            stm.setString(5, price);
            stm.setString(6, detail);
            //stm.setBoolean(2, roles);
            stm.setString(7, codeComputer);
            System.out.println("dddd1");
            
            int row = stm.executeUpdate();
            
            if (row > 0) {
                return true;
            }
                      
            
        }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (stm != null) {
                    stm.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        return false;
    }
    public boolean deleteComputer (String codeComputer) {
        Connection con = XMLUtils.makeConnection();
        PreparedStatement stm = null;
               
        try {
        if (con != null) {
            String sql = "Delete From Computer  Where code = ?";
            stm = con.prepareStatement(sql);
            stm.setString(1, codeComputer);
            
            System.out.println("dddd1");
            
            int row = stm.executeUpdate();
            
            if (row > 0) {
                return true;
            }
                      
            
        }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (stm != null) {
                    stm.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        return false;
    }
}
