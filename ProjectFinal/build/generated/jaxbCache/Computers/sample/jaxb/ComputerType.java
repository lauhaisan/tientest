//
// This file was generated by the JavaTM Architecture for XML Binding(JAXB) Reference Implementation, v2.2.5-2 
// See <a href="http://java.sun.com/xml/jaxb">http://java.sun.com/xml/jaxb</a> 
// Any modifications to this file will be lost upon recompilation of the source schema. 
// Generated on: 2016.08.04 at 10:33:00 PM ICT 
//


package sample.jaxb;

import java.math.BigDecimal;
import java.math.BigInteger;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlSchemaType;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for computerType complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="computerType">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="code" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="name" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="brand" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="screen" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="hdd" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="price" type="{http://www.w3.org/2001/XMLSchema}decimal"/>
 *         &lt;element name="vga" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="ram" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="cpu" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="weight" type="{http://www.w3.org/2001/XMLSchema}decimal"/>
 *         &lt;element name="pin" type="{http://www.w3.org/2001/XMLSchema}positiveInteger"/>
 *         &lt;element name="imagelink" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="numberofcompare" type="{http://www.w3.org/2001/XMLSchema}positiveInteger"/>
 *         &lt;element name="numberoflike" type="{http://www.w3.org/2001/XMLSchema}positiveInteger"/>
 *         &lt;element name="detail" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="more" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "computerType", propOrder = {
    "code",
    "name",
    "brand",
    "screen",
    "hdd",
    "price",
    "vga",
    "ram",
    "cpu",
    "weight",
    "pin",
    "imagelink",
    "numberofcompare",
    "numberoflike",
    "detail",
    "more"
})
public class ComputerType {

    @XmlElement(required = true)
    protected String code;
    @XmlElement(required = true)
    protected String name;
    @XmlElement(required = true)
    protected String brand;
    @XmlElement(required = true)
    protected String screen;
    @XmlElement(required = true)
    protected String hdd;
    @XmlElement(required = true)
    protected BigDecimal price;
    @XmlElement(required = true)
    protected String vga;
    @XmlElement(required = true)
    protected String ram;
    @XmlElement(required = true)
    protected String cpu;
    @XmlElement(required = true)
    protected BigDecimal weight;
    @XmlElement(required = true)
    @XmlSchemaType(name = "positiveInteger")
    protected BigInteger pin;
    @XmlElement(required = true)
    protected String imagelink;
    @XmlElement(required = true)
    @XmlSchemaType(name = "positiveInteger")
    protected BigInteger numberofcompare;
    @XmlElement(required = true)
    @XmlSchemaType(name = "positiveInteger")
    protected BigInteger numberoflike;
    @XmlElement(required = true)
    protected String detail;
    @XmlElement(required = true)
    protected String more;

    /**
     * Gets the value of the code property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getCode() {
        return code;
    }

    /**
     * Sets the value of the code property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setCode(String value) {
        this.code = value;
    }

    /**
     * Gets the value of the name property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getName() {
        return name;
    }

    /**
     * Sets the value of the name property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setName(String value) {
        this.name = value;
    }

    /**
     * Gets the value of the brand property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getBrand() {
        return brand;
    }

    /**
     * Sets the value of the brand property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setBrand(String value) {
        this.brand = value;
    }

    /**
     * Gets the value of the screen property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getScreen() {
        return screen;
    }

    /**
     * Sets the value of the screen property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setScreen(String value) {
        this.screen = value;
    }

    /**
     * Gets the value of the hdd property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getHdd() {
        return hdd;
    }

    /**
     * Sets the value of the hdd property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setHdd(String value) {
        this.hdd = value;
    }

    /**
     * Gets the value of the price property.
     * 
     * @return
     *     possible object is
     *     {@link BigDecimal }
     *     
     */
    public BigDecimal getPrice() {
        return price;
    }

    /**
     * Sets the value of the price property.
     * 
     * @param value
     *     allowed object is
     *     {@link BigDecimal }
     *     
     */
    public void setPrice(BigDecimal value) {
        this.price = value;
    }

    /**
     * Gets the value of the vga property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getVga() {
        return vga;
    }

    /**
     * Sets the value of the vga property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setVga(String value) {
        this.vga = value;
    }

    /**
     * Gets the value of the ram property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getRam() {
        return ram;
    }

    /**
     * Sets the value of the ram property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setRam(String value) {
        this.ram = value;
    }

    /**
     * Gets the value of the cpu property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getCpu() {
        return cpu;
    }

    /**
     * Sets the value of the cpu property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setCpu(String value) {
        this.cpu = value;
    }

    /**
     * Gets the value of the weight property.
     * 
     * @return
     *     possible object is
     *     {@link BigDecimal }
     *     
     */
    public BigDecimal getWeight() {
        return weight;
    }

    /**
     * Sets the value of the weight property.
     * 
     * @param value
     *     allowed object is
     *     {@link BigDecimal }
     *     
     */
    public void setWeight(BigDecimal value) {
        this.weight = value;
    }

    /**
     * Gets the value of the pin property.
     * 
     * @return
     *     possible object is
     *     {@link BigInteger }
     *     
     */
    public BigInteger getPin() {
        return pin;
    }

    /**
     * Sets the value of the pin property.
     * 
     * @param value
     *     allowed object is
     *     {@link BigInteger }
     *     
     */
    public void setPin(BigInteger value) {
        this.pin = value;
    }

    /**
     * Gets the value of the imagelink property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getImagelink() {
        return imagelink;
    }

    /**
     * Sets the value of the imagelink property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setImagelink(String value) {
        this.imagelink = value;
    }

    /**
     * Gets the value of the numberofcompare property.
     * 
     * @return
     *     possible object is
     *     {@link BigInteger }
     *     
     */
    public BigInteger getNumberofcompare() {
        return numberofcompare;
    }

    /**
     * Sets the value of the numberofcompare property.
     * 
     * @param value
     *     allowed object is
     *     {@link BigInteger }
     *     
     */
    public void setNumberofcompare(BigInteger value) {
        this.numberofcompare = value;
    }

    /**
     * Gets the value of the numberoflike property.
     * 
     * @return
     *     possible object is
     *     {@link BigInteger }
     *     
     */
    public BigInteger getNumberoflike() {
        return numberoflike;
    }

    /**
     * Sets the value of the numberoflike property.
     * 
     * @param value
     *     allowed object is
     *     {@link BigInteger }
     *     
     */
    public void setNumberoflike(BigInteger value) {
        this.numberoflike = value;
    }

    /**
     * Gets the value of the detail property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getDetail() {
        return detail;
    }

    /**
     * Sets the value of the detail property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setDetail(String value) {
        this.detail = value;
    }

    /**
     * Gets the value of the more property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getMore() {
        return more;
    }

    /**
     * Sets the value of the more property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setMore(String value) {
        this.more = value;
    }

}
