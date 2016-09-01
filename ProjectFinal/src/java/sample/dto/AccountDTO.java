/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.dto;

/**
 *
 * @author Administrator
 */
public class AccountDTO {
 String account;
 String password;
 String type;
 String address;
 String phone;
 String fullname;
 String avatarlink;

    public AccountDTO() {
    }

    public AccountDTO(String account, String password, String type, String address, String phone, String fullname, String avatarlink) {
        this.account = account;
        this.password = password;
        this.type = type;
        this.address = address;
        this.phone = phone;
        this.fullname = fullname;
        this.avatarlink = avatarlink;
    }

    

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getAvatarlink() {
        return avatarlink;
    }

    public void setAvatarlink(String avatarlink) {
        this.avatarlink = avatarlink;
    }
 
}
