/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.util;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.Serializable;
import java.io.StringReader;
import java.io.StringWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.Marshaller;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;
import javax.xml.stream.XMLInputFactory;
import javax.xml.stream.XMLStreamConstants;
import javax.xml.stream.XMLStreamException;
import javax.xml.stream.XMLStreamReader;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Result;
import javax.xml.transform.Source;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathFactory;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;
import sample.jaxb.Computers;

/**
 *
 * @author Administrator
 */
//doc du lieu xml
public class XMLUtils implements Serializable{
    public static Document parseDOMFromFile(String XMlFilePath)
            throws ParserConfigurationException, SAXException, IOException {
        DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
        DocumentBuilder db = dbf.newDocumentBuilder();
        Document doc = db.parse(XMlFilePath);
        return doc;
    }
    public static Document parseDOMFromString(String xml) throws Exception
{
    DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
    DocumentBuilder builder = factory.newDocumentBuilder();
    InputSource is = new InputSource(new StringReader(xml));
    return builder.parse(is);
}
    public static XPath createXPath(){
       XPathFactory xpf = XPathFactory.newInstance();
        XPath xpath = xpf.newXPath();
        return xpath;
    }
//update du lieu xml
      public static void transformDOMToFile(Node node, String filePath) throws TransformerConfigurationException, TransformerException {
        Source src = new DOMSource(node);
        File file = new File(filePath);
        Result result = new StreamResult(file);
        
        TransformerFactory factory = TransformerFactory.newInstance();
        Transformer transformer = factory.newTransformer();
        
        transformer.transform(src, result);
    }

      
      public static Connection makeConnection() {
       
          try{
        Context context = new InitialContext();
        Context tomcatContext= (Context)context.lookup("java:comp/env");
            DataSource ds= (DataSource)tomcatContext.lookup("DBCon");
            Connection con=ds.getConnection();
            return con;
        }catch(NamingException ex){
            ex.printStackTrace();
        }catch(SQLException ex){
            ex.printStackTrace();
        }
        return null;
    }

    public static String checklogin(String username, String password) {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = makeConnection();
            String sql = "Select * From Account Where username=? and password=?";
            stm = con.prepareStatement(sql);
            stm.setString(1, username);
            stm.setString(2, password);
            rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getString("Type");
            } else {
                return null;
            }
        } catch (SQLException ex) {
            Logger.getLogger(XMLUtils.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stm != null) {
                    stm.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(XMLUtils.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return null;
    }
public static String marshallJAXB(Computers list) {
        try {
            JAXBContext context = JAXBContext.newInstance(Computers.class);
            Marshaller mar = context.createMarshaller();
            
//            mar.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
//            mar.setProperty(Marshaller.JAXB_ENCODING, "UTF-8");
            StringWriter sw=  new StringWriter();
            mar.marshal(list, sw);
           
            return sw.toString();
        
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }
public static String DOMToString(Document doc) throws TransformerException{
    TransformerFactory tf = TransformerFactory.newInstance();
Transformer transformer = tf.newTransformer();
transformer.setOutputProperty(OutputKeys.OMIT_XML_DECLARATION, "yes");
StringWriter writer = new StringWriter();
transformer.transform(new DOMSource(doc), new StreamResult(writer));
String output = writer.getBuffer().toString().replaceAll("\n|\r", "");
return output;
}
}

