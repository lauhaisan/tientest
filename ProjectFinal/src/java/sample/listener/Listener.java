/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.listener;

import javax.servlet.ServletRequestEvent;
import javax.servlet.ServletRequestListener;
import sample.dao.ComputerDAO;
import sample.util.XMLUtils;

/**
 *
 * @author Administrator
 */
public class Listener implements ServletRequestListener {

    public void requestDestroyed(ServletRequestEvent sre) {
        System.out.println("destroy");
    }

    public void requestInitialized(ServletRequestEvent sre) {
        System.out.println("Intialized");
    }
}
