/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.servlet;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.io.StringReader;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.transform.Result;
import javax.xml.transform.Source;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.sax.SAXResult;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;
import org.apache.fop.apps.FOUserAgent;
import org.apache.fop.apps.Fop;
import org.apache.fop.apps.FopFactory;
import org.apache.fop.apps.MimeConstants;
import org.xml.sax.SAXException;
import sample.dto.AccountDTO;
/**
 *
 * @author Administrator
 */
@WebServlet(name = "CombineFOWithXSLServlet", urlPatterns = {"/CombineFOWithXSLServlet"})
public class CombineFOWithXSLServlet extends HttpServlet {
private final String detailPage="detail.jsp";
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
         ByteArrayOutputStream out =null; 
            
            
        try  {
          String path = getServletContext().getRealPath("/");
            String xslPath = path + "/WEB-INF/ComputerFO.xsl";
            String xmlPath = path + "/WEB-INF/computers.xml";
            String foPath = path + "/WEB-INF/ComputerFO.fo";
            HttpSession ss=request.getSession();
            String xmldata=(String)ss.getAttribute("XMLDATA");
            AccountDTO accdto=(AccountDTO)ss.getAttribute("ACCINFO");
            String txtCode=request.getParameter("txtCode");
            System.out.println(xmldata);
            //Dung string xml truc tiep thay vi dung filexml
            methodTrAX(xslPath, xmldata, foPath, path,accdto,txtCode);
            
            File file = new File(foPath);
            FileInputStream input = new FileInputStream(file);
            
            out = new ByteArrayOutputStream();
            response.setContentType("application/pdf");

            FopFactory ff = FopFactory.newInstance();       
            FOUserAgent fua = ff.newFOUserAgent();
            Fop fop = ff.newFop(MimeConstants.MIME_PDF, fua, out);
            
            TransformerFactory tff = TransformerFactory.newInstance();
            Transformer trans = tff.newTransformer();
            File fo = new File(foPath);
            Source src = new StreamSource(fo);
            Result result = new SAXResult(fop.getDefaultHandler());
            trans.transform(src, result);
     
            byte[] content = out.toByteArray();
            response.setContentLength(content.length);
            response.getOutputStream().write(content);
            response.getOutputStream().flush();

            
        } catch (TransformerConfigurationException ex) {
            Logger.getLogger(CombineFOWithXSLServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (TransformerException ex) {
            Logger.getLogger(CombineFOWithXSLServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SAXException ex) {
            Logger.getLogger(CombineFOWithXSLServlet.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (out != null) {

                    out.close();
                }
                
            } catch (IOException ex) {
                ex.printStackTrace();
            }
        }
    }
 private void methodTrAX(String xslPath, String xmlPath, String output, String path,
         AccountDTO acc,String txtCode) {
        try {
            String realPath = getServletContext().getRealPath("/");
            String filePath = realPath+"/image/";
            TransformerFactory tf = TransformerFactory.newInstance();
            StreamSource xsltFile = new StreamSource(xslPath);
            Transformer trans = tf.newTransformer(xsltFile);
            String address=acc.getAddress();
            String fullname=acc.getFullname();
            String phone= acc.getPhone();
            trans.setParameter("address", address);
            trans.setParameter("fullname", fullname);
            trans.setParameter("phone", phone);
            trans.setParameter("pathfile", filePath);
             trans.setParameter("txtCode", txtCode);
            //InputStream is = new ByteArrayInputStream(xmlPath.getBytes());

            
            StreamSource xmlFile = new StreamSource(new StringReader(xmlPath));
            StreamResult resultFile = new StreamResult(new FileOutputStream(output));
            trans.transform(xmlFile, resultFile);
        } catch (TransformerConfigurationException ex) {
            Logger.getLogger(CombineFOWithXSLServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (FileNotFoundException ex) {
            Logger.getLogger(CombineFOWithXSLServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (TransformerException ex) {
            Logger.getLogger(CombineFOWithXSLServlet.class.getName()).log(Level.SEVERE, null, ex);
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
