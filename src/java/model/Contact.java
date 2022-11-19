/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

/**
 *
 * @author NamND
 */
public class Contact {

    private int id;
    private String fullname;
    private String email;
    private String phone;
    private String message;
    private Timestamp date;
    private ContactStatus status;

    public Contact() {
    }

    public Contact(int id, String fullname, String email, String phone, String message, Timestamp date, ContactStatus status) {
        this.id = id;
        this.fullname = fullname;
        this.email = email;
        this.phone = phone;
        this.message = message;
        this.date = date;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }

    public ContactStatus getStatus() {
        return status;
    }

    public void setStatus(ContactStatus status) {
        this.status = status;
    }

    public String getDates() {
        return new SimpleDateFormat("dd/MM/yyyy HH:mm:ss").format(date);
    }
}
