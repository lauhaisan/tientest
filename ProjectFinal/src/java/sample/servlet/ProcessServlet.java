/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Administrator
 */
@WebServlet(name = "ProcessServlet", urlPatterns = {"/ProcessServlet"})
public class ProcessServlet extends HttpServlet {
 private final String homedataPage = "homedata.jsp";
  private final String loginServlet = "LoginServlet";
    private final String logoutServlet = "LogoutServlet";
  private final String deleteServlet="DeleteServlet";
  private final String updateServlet="UpdateServlet";
  private final String searchServlet="SearchServlet";
    private final String createXMLServlet="CreateXMLServlet";
    private final String detailServlet="DetailServlet";
    private final String combineFOServlet="CombineFOWithXSLServlet";
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       
        try {
            String url = homedataPage;
            String button = request.getParameter("btAction");
            if (button == null) {
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            } else if (button.equals("Login")) {
                RequestDispatcher rd = request.getRequestDispatcher(loginServlet);
                rd.forward(request, response);
            } else if (button.equals("Logout")) {
                RequestDispatcher rd = request.getRequestDispatcher(logoutServlet);
                rd.forward(request, response);
            } 
            else if (button.equals("Search")) {
                RequestDispatcher rd = request.getRequestDispatcher(searchServlet);
                rd.forward(request, response);
            }else if (button.equals("Delete")) {
                RequestDispatcher rd = request.getRequestDispatcher(deleteServlet);
                rd.forward(request, response);
            }else if (button.equals("Update")) {
                RequestDispatcher rd = request.getRequestDispatcher(updateServlet);
                rd.forward(request, response);
            }else if (button.equals("CreateXML")) {
                RequestDispatcher rd = request.getRequestDispatcher(createXMLServlet);
                rd.forward(request, response);
            }
            else if (button.equals("Detail")) {
                RequestDispatcher rd = request.getRequestDispatcher(detailServlet);
                rd.forward(request, response);
            }
             else if (button.equals("Buy Laptop")) {
                RequestDispatcher rd = request.getRequestDispatcher(combineFOServlet);
                rd.forward(request, response);
            }
           
        }catch(ServletException ex){
            ex.printStackTrace();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
