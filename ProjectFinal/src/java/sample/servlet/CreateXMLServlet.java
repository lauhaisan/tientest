/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
import sample.dao.ComputerDAO;
import sample.jaxb.Computers;
import sample.util.XMLUtils;

/**
 *
 * @author Administrator
 */
@WebServlet(name = "CreateXMLServlet", urlPatterns = {"/CreateXMLServlet"})
public class CreateXMLServlet extends HttpServlet {

    private String homePage = "homedata.jsp";
    private final String xmlFile = "/WEB-INF/computers.xml";

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
        PrintWriter out = response.getWriter();
        try {
            //JAXB marshalling de lay du lieu tu database va tao file xml
            String path = getServletContext().getRealPath("/");
            String filename = path + xmlFile;
            JAXBContext ctx = JAXBContext.newInstance(Computers.class);
            Marshaller mar = ctx.createMarshaller();
            mar.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
            ComputerDAO dao = new ComputerDAO();
            dao.getComputers();
            Computers computers = dao.getListcomputers();
            //mar.marshal(computers, new File("D:/atest_XML/ProjectFinal/web/WEB-INF/computers.xml"));
            //chuyen thanh string xml qua objectJAXB
            String xmldata = XMLUtils.marshallJAXB(computers);
            
            System.out.println("xmldatA " + xmldata);
            HttpSession ss = request.getSession();
            ss.setAttribute("XMLDATA", xmldata);

            RequestDispatcher rd = request.getRequestDispatcher(homePage);
            rd.forward(request, response);
        } catch (JAXBException ex) {
            Logger.getLogger(CreateXMLServlet.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            out.close();
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
