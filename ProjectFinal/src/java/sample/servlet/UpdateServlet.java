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
import java.math.BigDecimal;
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
@WebServlet(name = "UpdateServlet", urlPatterns = {"/UpdateServlet"})
public class UpdateServlet extends HttpServlet {

    private final String xmlFile = "/WEB-INF/computers.xml";
    private String homePage = "homedata.jsp";
    private String detailPage = "detail.jsp";
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
        try (PrintWriter out = response.getWriter()) {
            
            String realPath = getServletContext().getRealPath("/");
            String filePath = realPath + xmlFile;
            HttpSession ss = request.getSession();
            String xmldata = (String) ss.getAttribute("XMLDATA");
            String searchCode = request.getParameter("searchCode");
            String price = request.getParameter("txtPrice");
            String screen= request.getParameter("txtScreen");
            String hdd= request.getParameter("txtHdd");
            String vga= request.getParameter("txtVga");
            String ram =request.getParameter("txtRam");
            String detail = request.getParameter("txtDetail");
            String searchpage=request.getParameter("txtSearchPage");
            if(isNumeric(price)==false || screen==null ||hdd==null
                  ||vga==null||ram==null){
                request.setAttribute("Error", "Update not sucessful!");
                if(searchpage==null){
                    response.sendRedirect(homePage);
                    }else{
                        String url=detailPage+"?txtCode="+searchCode;
                      response.sendRedirect(url);  
                    }
            }
            //co string xml, chi can parse chuoi, khong can parse tu file xml
            Document doc = XMLUtils.parseDOMFromString(xmldata);
            //Document doc = XMLUtils.parseDOMFromFile(filePath);
            if (doc != null) {
                //lay laptop theo code
                XPath xPath = XMLUtils.createXPath();
                String exp = "//computer[code="
                        + searchCode
                        + "]";
                //node computer can tim
                Node computer = (Node) xPath.evaluate(exp, doc, XPathConstants.NODE);
                if (computer != null) {
                    //dieu chinh gia
                    String exp1 = "//computer[code="
                            + searchCode
                            + "]/price";
                    //node computer
                    Node s = (Node) xPath.evaluate(exp1, doc, XPathConstants.NODE);
                    if (s != null) {
                        s.setTextContent(price);
                    }
                    //update screen
                    String exp2 = "//computer[code="
                            + searchCode
                            + "]/screen";
                    //node computer
                    Node s2 = (Node) xPath.evaluate(exp2, doc, XPathConstants.NODE);
                    if (s2 != null) {
                        s2.setTextContent(screen);
                    }
                     //update
                    String exp3 = "//computer[code="
                            + searchCode
                            + "]/hdd";
                    //node computer
                    Node s3= (Node) xPath.evaluate(exp3, doc, XPathConstants.NODE);
                    if (s3 != null) {
                        s3.setTextContent(hdd);
                    }
                    //update vga
                    String exp4 = "//computer[code="
                            + searchCode
                            + "]/vga";
                    //node computer
                    Node s4= (Node) xPath.evaluate(exp4, doc, XPathConstants.NODE);
                    if (s4 != null) {
                        s4.setTextContent(vga);
                    }
                     //update vga
                    String exp5 = "//computer[code="
                            + searchCode
                            + "]/ram";
                    //node computer
                    Node s5= (Node) xPath.evaluate(exp5, doc, XPathConstants.NODE);
                    if (s5 != null) {
                        s5.setTextContent(ram);
                    }
                    //update detail
                    String exp6 = "//computer[code="
                            + searchCode
                            + "]/detail";
                    //node computer
                    Node s6 = (Node) xPath.evaluate(exp6, doc, XPathConstants.NODE);
                    if (s6 != null) {
                        s6.setTextContent(detail);
                    }
                    //parse lai ve phia client chuoi xml string
                    String xmlNewdata=XMLUtils.DOMToString(doc);

                    
                    
                    //update ca database
                    ComputerDAO daocom = new ComputerDAO();
                    boolean result = daocom.updateInforComputer(searchCode,screen, hdd, vga, ram, price, detail);
                    if(result){
                    //show string xml    
                    System.out.println("xmldatA " + xmlNewdata);
                    ss.setAttribute("XMLDATA", xmlNewdata);
                    if(searchpage==null){
                    response.sendRedirect(homePage);
                    }else{
                        String url=detailPage+"?txtCode="+searchCode;
                      response.sendRedirect(url);  
                    }
                    }
                }
            }

           
        } catch (XPathExpressionException ex) {
            Logger.getLogger(UpdateServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ParserConfigurationException ex) {
            Logger.getLogger(UpdateServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SAXException ex) {
            Logger.getLogger(UpdateServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (TransformerException ex) {
            Logger.getLogger(UpdateServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(UpdateServlet.class.getName()).log(Level.SEVERE, null, ex);
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
public static boolean isNumeric(String str)  
{  
  try  
  {  
    double d = Double.parseDouble(str);  
  }  
  catch(NumberFormatException nfe)  
  {  
    return false;  
  }  
  return true;  
}
}
