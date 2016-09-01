/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.dao;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import sample.dto.AccountDTO;
import sample.util.XMLUtils;

/**
 *
 * @author Administrator
 */
public class AccountDAO implements Serializable{
     public boolean CheckLogin(String account,String password){
        Connection con = XMLUtils.makeConnection();
        PreparedStatement stm=null;
        ResultSet rs= null;
        
            if(con!=null){
            String sql= "SELECT * from account where account=? and password=?" ;
            try{
             stm=con.prepareStatement(sql);
             stm.setString(1, account);
             stm.setString(2, password);
             //stm.setBoolean(3, true);
             
             rs=stm.executeQuery();
             if(rs.next()){
                 return true;
             }
            }catch(SQLException ex){
                ex.printStackTrace();
            }
            finally{
                try{
                    if(rs!=null){
                        rs.close();
                        
                    }
                    if(stm!=null){
                        stm.close();
                    }
                    if(con!=null){
                        con.close();
                    }
                }catch(SQLException ex){
                    ex.printStackTrace();
                }
            }
            }
        
        return false;
    }
       public String getFullname(String account){
          Connection con=XMLUtils.makeConnection();
        
        PreparedStatement stm =null;
        ResultSet  rs=null;
        String sql=null;
        if(con!=null){
           
           sql ="Select fullname from account where account=?";
            
           try{
               stm =con.prepareStatement(sql); 
               stm.setString(1, account);
               
               rs=stm.executeQuery();            
              while(rs.next()){                           
                  String fullname= rs.getString("fullname");
                 
                  return fullname;    
              }
            }
            catch(SQLException ex){
                ex.printStackTrace();
            }finally{
                try{
                    if(rs!=null){
                        rs.close();
                    }
                    if(stm !=null){
                        stm.close();
                    }
                    if(con !=null){
                        con.close();
                    }
                }catch(SQLException ex){
                    ex.printStackTrace();
                }
            }
            
        }
        return null;
    }
       public boolean checkRole(String account){
          Connection con=XMLUtils.makeConnection();
        
        PreparedStatement stm =null;
        ResultSet  rs=null;
        String sql=null;
        if(con!=null){
           
           sql ="Select * from account where account=?";
            
           try{
               stm =con.prepareStatement(sql); 
               stm.setString(1, account);
               
               rs=stm.executeQuery();            
              while(rs.next()){                           
                  String type= rs.getString("type");
                 if(type.equals("admin")){
                  return true;    
                 }else
                     return false;
              }
            }
            catch(SQLException ex){
                ex.printStackTrace();
            }finally{
                try{
                    if(rs!=null){
                        rs.close();
                    }
                    if(stm !=null){
                        stm.close();
                    }
                    if(con !=null){
                        con.close();
                    }
                }catch(SQLException ex){
                    ex.printStackTrace();
                }
            }
            
        }
        return false;
    }
       public AccountDTO getInformation(String account){
          Connection con=XMLUtils.makeConnection();
        
        PreparedStatement stm =null;
        ResultSet  rs=null;
        String sql=null;
        if(con!=null){
           
           sql ="Select * from account where account=?";
            
           try{
               stm =con.prepareStatement(sql); 
               stm.setString(1, account);
               
               rs=stm.executeQuery();
               
              while(rs.next()){ 
                  String acc=rs.getString("account");
                  String fullname= rs.getString("fullname");
                  String password=rs.getString("password");
                  String address= rs.getString("address");
                  String type=rs.getString("type");
                  String phone=rs.getString("phone");
                  String avatarlink=rs.getString("avatarlink");
                  
                
                AccountDTO dto = new AccountDTO(acc, password, type, address, phone, fullname, avatarlink);
                  return dto;    
              }
            }
            catch(SQLException ex){
                ex.printStackTrace();
            }finally{
                try{
                    if(rs!=null){
                        rs.close();
                    }
                    if(stm !=null){
                        stm.close();
                    }
                    if(con !=null){
                        con.close();
                    }
                }catch(SQLException ex){
                    ex.printStackTrace();
                }
            }
            
        }
        return null;
    }
       
}
