/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.servlet;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.Reader;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.TransformerException;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpressionException;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.xml.sax.SAXException;
import sample.dao.ComputerDAO;
import sample.util.XMLUtils;

/**
 *
 * @author Administrator
 */
@WebServlet(name = "DeleteServlet", urlPatterns = {"/DeleteServlet"})
public class DeleteServlet extends HttpServlet {
private final String xmlFile = "/WEB-INF/computers.xml";
    private String homePage = "homedata.jsp";
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
           String realPath = getServletContext().getRealPath("/");
            String filePath = realPath + xmlFile;
            HttpSession ss = request.getSession();
            String xmldata = (String) ss.getAttribute("XMLDATA");
            String searchCode = request.getParameter("txtCode");
            
            Document doc = XMLUtils.parseDOMFromString(xmldata);
            if (doc != null) {
                //lay laptop theo code
                XPath xPath = XMLUtils.createXPath();
                String exp = "//computer[code="
                        + searchCode
                        + "]";
                //node computer can tim
                Node computer = (Node) xPath.evaluate(exp, doc, XPathConstants.NODE);
                if(computer!=null){
                 Node parentcomputer=computer.getParentNode();
                 parentcomputer.removeChild(computer);
                 //XMLUtils.transformDOMToFile(doc, filePath);
                 //parse lai vao file xml
                   String xmlNewdata=XMLUtils.DOMToString(doc);
                   
                    //lay string xml theo file xml
                   
                    //Delete ca database
                    ComputerDAO daocom = new ComputerDAO();
                    boolean result = daocom.deleteComputer(searchCode);
                    if(result){
                    //show string xml    
                    System.out.println("xmldatA " + xmlNewdata);
                    ss.setAttribute("XMLDATA", xmlNewdata);
                    response.sendRedirect(homePage);
                    }
             }
            }
        } catch (ParserConfigurationException ex) {
        Logger.getLogger(DeleteServlet.class.getName()).log(Level.SEVERE, null, ex);
    } catch (SAXException ex) {
        Logger.getLogger(DeleteServlet.class.getName()).log(Level.SEVERE, null, ex);
    } catch (XPathExpressionException ex) {
        Logger.getLogger(DeleteServlet.class.getName()).log(Level.SEVERE, null, ex);
    } catch (TransformerException ex) {
        Logger.getLogger(DeleteServlet.class.getName()).log(Level.SEVERE, null, ex);
    } catch (Exception ex) {
        Logger.getLogger(DeleteServlet.class.getName()).log(Level.SEVERE, null, ex);
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
